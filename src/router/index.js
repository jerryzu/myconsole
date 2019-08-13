import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Task from '@/components/Task'
import TablePage from '@/components/TablePage'
import Tree from '@/components/Tree'
import Dropdown from '@/components/Dropdown'
import Action from '@/components/Action'


Vue.use(Router)

export default new Router({
	routes: [
		{
			path: '/',
			name: 'HelloWorld',
			component: HelloWorld
		}, {
			path: '/Task',
			name: 'Task',
			component: Task
		}, {
			path: '/TablePage',
			name: 'TablePage',
			component: TablePage
		}, {
			path: '/Tree',
			name: 'Tree',
			component: Tree
		}, {
			path: '/Dropdown',
			name: 'Dropdown',
			component: Dropdown
		}, {
			path: '/Action',
			name: 'Action',
			component: Action
		}
	]
})
