import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import router from '../router'

Vue.use(TurbolinksAdapter)
console.log('hello')
console.log(router)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    router,
    render: function (h) { return h(App) }
  }).$mount('#app')
})
