<template>

    <div id="nav" v-bind:class="{ sticky: countdown }">
      <div class="nav-elem">
        <img style = "width: 80px;" src = "../images/f.png">
      </div>
      <div class="nav-elem" v-for= "nav in navlinks">
        <router-link :to="nav.to">{{nav.title}}</router-link>
      </div>
      <div class="nav-elem" v-if="this.countdown">
        <router-link to="/countdown">Обратный отсчёт</router-link>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Nav',
  props: {
    selected: String
  },
  data: function () {
    return {
      navlinks: [
        {to: "/", title: 'Истории'},
        {to: "/museum", title: 'Музей'},
        {to: "/donate", title: 'Донат'}
      ],
      countdown: false,
      offset: 900
    }
  },
  created () {
    window.addEventListener('scroll', this.handleScroll);

  },
  mounted (){
    this.offset = document.getElementById("nav").offsetTop
  },
  destroyed () {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll (event) {
      this.countdown = (window.pageYOffset >= this.offset-50)

    }
  }
}
</script>

<style>
#nav {
  display: inline-flex;
  padding: 0.7rem 0rem;
  background-color: #e6e6e6;
  width: 100%;
}
.nav-elem {
  vertical-align: middle;
  margin: auto 1em;
}
#nav a {
  font-weight: 500;
  color: #2c3e50;
  vertical-align: middle;
  text-decoration: none;
}
.sticky {
  position: fixed;
  top: 0px;
}
#nav a.router-link-exact-active {
  color: #ff5f0b;
}
</style>
