<template>
  <div id="app">
    <div id="countdown">
      <p>1 месяц до пиздеца!</p>
    </div>
    <div id="nav">
      <Nav />
    </div>
    <router-view/>
  </div>
</template>

<script>
  import Nav from './components/Nav.vue'
  export default {
  components: {
    Nav
  }
}
</script>

<style>
  #countdown{
    width: 100%;
    height: 200px;
    display: flex;
    background-color: orange;
  }
  #countdown p{
    margin: auto;
    font-weight: 800;
    color: white;
    font-size: 2rem;
  }
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
body {
  background-color: #e6e6e6;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
h1 {
      font-family: inherit;
    text-transform: uppercase;
    font-size: 4.5rem;
    font-weight: 900;
    letter-spacing: -0.23rem;
    margin: 0px;
}
.wellcum{
  display: flex;
    flex-direction: column;
    margin: auto;
    text-align: center;
    width: 60%;
}
.wellcum p {
  padding: 0px;
  margin: 0px;
  font-size: 1rem;
}
.home {
    display: flex;
    flex-direction: column;
  }
</style>
