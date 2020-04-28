import Vue from 'vue'
import Router from 'vue-router'
import Client from '@/components/Client'
import App from '@/components/App'
import Serv from '@/components/Serv'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/client',
      name: 'Client',
      component: Client
    },
	{
      path: '/app',
      name: 'App',
      component: App
    },
	{
      path: '/serv',
      name: 'Serv',
      component: Serv
    }
  ]
})
