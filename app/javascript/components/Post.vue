<template>
    <div class="post">
      <h1>{{params.title}}</h1>
      <div><p>{{params.text}}</p></div>
      <span>39 минут назад</span>
    </div>
</template>

<script>
export default {
  name: 'Post',
  props: {
    params: Object
  },
  data: function () {
    return {
    }
  },
}
</script>

<style>
.post {
/*  width: 80%;
  padding: 1em;
  margin: 1em auto;
  background-color: white;
  border-radius: 10px;
  -webkit-box-shadow: 0px 2px 17px -10px rgba(34, 60, 80, 0.17);
-moz-box-shadow: 0px 2px 17px -10px rgba(34, 60, 80, 0.17);
box-shadow: 0px 2px 17px -10px rgba(34, 60, 80, 0.17);
-webkit-box-shadow: 0px 4px 17px -2px rgba(34, 60, 80, 0.09);
-moz-box-shadow: 0px 4px 17px -2px rgba(34, 60, 80, 0.09);
box-shadow: 0px 4px 17px -2px rgba(34, 60, 80, 0.09);*/
padding: 0.5em;
border-bottom: 1px solid black;
font-family: 'Georgia';
color: black;
font-size: 1.5rem;
}
.post span{
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
color: #ff5f0b;
font-size: .95rem;
font-weight: bold
}
</style>
