import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Login from '../components/login.vue'
import Top from '../components/top.vue'
import New from '../components/new.vue'
import Search from '../components/search_books.vue'
import AdTop from '../components/admintop.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Login },
    { path: '/Top', component: Top },
    { path: '/New', component: New },
    { path: '/Search', component: Search },
    { path: '/AdTop', component: AdTop }
  ],
})