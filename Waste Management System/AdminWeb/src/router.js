import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)





export default new Router({
	routes: [
        // {
        //     path: '/Starterkit',
        //     name: 'Starterkit',
        //     index: 1,
        //     component: () => import('./views/StarterPage.vue')
        // },
    {
    // ======================
    // Full Layout
    // ======================
			path: '/new',
            component: () => import('./layout/full/MainContainer.vue'),
            // component: () => import('./views/Homepage.vue'),
            // ======================
            // Theme routes / pages
            // ======================


            children: [
                {
                    path: '/starterkit',
                    redirect: '/'
                },
                {
                    path: '/',
                    name: 'Starterkit',
                    index: 1,
                    component: () => import('./views/StarterPage.vue')
                }, {
                    path: '/alert',
                    name: 'Alert',
                    index: 2,
                    component: () => import('./views/components/vuesax/alert/alert.vue')
                }, {
                    path: '/avatar',
                    name: 'Avatar',
                    index: 3,
                    component: () => import('./views/components/vuesax/avatar/avatar.vue')
                }, {
                    path: '/breadcrumb',
                    name: 'Breadcrumb',
                    index: 4,
                    component: () => import('./views/components/vuesax/breadcrumb/breadcrumb.vue')
                }, {
                    path: '/buttons',
                    name: 'Buttons',
                    index: 5,
                    component: () => import('./views/components/vuesax/buttons/buttons.vue')
                }, {
                    path: '/cards',
                    name: 'Cards',
                    index: 6,
                    component: () => import('./views/components/vuesax/cards/cards.vue')
                }, {
                    path: '/checkbox',
                    name: 'Checkbox',
                    index: 7,
                    component: () => import('./views/components/vuesax/checkbox/checkbox.vue')
                }, {
                    path: '/collapse',
                    name: 'Collapse',
                    index: 9,
                    component: () => import('./views/components/vuesax/collapse/collapse.vue')
                }, {
                    path: '/dialog',
                    name: 'Dialog',
                    index: 10,
                    component: () => import('./views/components/vuesax/dialog/dialog.vue')
                }, {
                    path: '/divider',
                    name: 'Divider',
                    index: 11,
                    component: () => import('./views/components/vuesax/divider/divider.vue')
                }, {
                    path: '/dropdown',
                    name: 'Dropdown',
                    index: 12,
                    component: () => import('./views/components/vuesax/dropdown/dropdown.vue')
                }, {
                    path: '/input',
                    name: 'Input',
                    index: 13,
                    component: () => import('./views/components/vuesax/input/input.vue')
                }, {
                    path: '/list',
                    name: 'List',
                    index: 14,
                    component: () => import('./views/components/vuesax/list/list.vue')
                }, {
                    path: '/loading',
                    name: 'Loading',
                    index: 15,
                    component: () => import('./views/components/vuesax/loading/loading.vue')
                }, {
                    path: '/navbar',
                    name: 'Navbar',
                    index: 16,
                    component: () => import('./views/components/vuesax/navbar/navbar.vue')
                }, {
                    path: '/notification',
                    name: 'Notification',
                    index: 17,
                    component: () => import('./views/components/vuesax/notification/notification.vue')
                }, {
                    path: '/number-input',
                    name: 'Number input',
                    index: 18,
                    component: () => import('./views/components/vuesax/number-input/number-input.vue')
                }, {
                    path: '/pagination',
                    name: 'Pagination',
                    index: 19,
                    component: () => import('./views/components/vuesax/pagination/pagination.vue')
                }, {
                    path: '/popup',
                    name: 'Popup',
                    index: 20,
                    component: () => import('./views/components/vuesax/popup/popup.vue')
                }, {
                    path: '/progress',
                    name: 'Progress',
                    index: 21,
                    component: () => import('./views/components/vuesax/progress/progress.vue')
                }, {
                    path: '/radio',
                    name: 'Radio',
                    index: 22,
                    component: () => import('./views/components/vuesax/radio/radio.vue')
                }, {
                    path: '/switch',
                    name: 'Switch',
                    index: 26,
                    component: () => import('./views/components/vuesax/switch/switch.vue')
                }, {
                    path: '/tabs',
                    name: 'Tabs',
                    index: 28,
                    component: () => import('./views/components/vuesax/tabs/tabs.vue')
                }, {
                    path: '/textarea',
                    name: 'Textarea',
                    index: 29,
                    component: () => import('./views/components/vuesax/textarea/textarea.vue')
                }, {
                    path: '/settings',
                    name: 'Settings',
                    index: 30,
                    component: () => import('./views/components/dashboard/settings.vue')
                }, {
                    path: '/notifications',
                    name: 'Notifications',
                    index: 31,
                    component: () => import('./views/components/dashboard/notifications.vue')
                }, {
                    path: '/customer',
                    name: 'Customer',
                    index: 32,
                    component: () => import('./views/components/dashboard/customer.vue')
                }, {
                    path: '/buyer',
                    name: 'Buyer',
                    index: 33,
                    component: () => import('./views/components/dashboard/buyer.vue')
                }, {
                    path: '/reports',
                    name: 'Reports',
                    index: 34,
                    component: () => import('./views/components/dashboard/reports.vue')
                },

                // {
                //     path: '/login',
                //     name: 'Login',
                //     index: 35,
                //     component: () => import('./views/components/dashboard/login.vue')
                // },

                // {
                //         path:'/hompagex1',
                //          name:'hompagex1',
                //          index: 31,
                //          component: () => import('./views/hompagex1.vue')
            
                //       },

            ]
        },
        

        {
            path: '/',
            //component: () => import('./views/Homepage.vue'),
            component: () => import('./views/PublicContainer.vue'),

            children: [
                {
                        path:'/',
                        name:'Homepage',
                        index: 36,
                        component: () => import('./views/Homepage.vue')
            
                     },
                     {
                        path:'/publicnews',
                        name:'news',
                        index: 36,
                        component: () => import('./views/publicnews.vue')
            
                     },
                     {
                        path:'/aboutus',
                        name:'aboutus',
                        index: 36,
                        component: () => import('./views/aboutus.vue')
            
                     },
                     {
                        path:'/publicHeader',
                        name:'publicHeader',
                        index: 37,
                        component: () => import('./views/publicCommon/publicHeader.vue')
            
                     },
                     {
                        path: '/login',
                        name: 'Login',
                        index: 35,
                        component: () => import('./views/components/dashboard/login.vue')
                    },
                    

            ]



        },
    // Redirect to  Homepage, if no match found
        {
            path: '*',
            redirect: '/Starterkit'
        }


	]
})