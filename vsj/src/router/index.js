import { createRouter, createWebHashHistory } from 'vue-router';

import Home from '@/components/Home.vue'
import Login from '@/views/login/login.vue'
import Create from '@/views/create/create.vue'
import Ranking from '@/views/ranking/ranking.vue'
import My from '@/views/my/my.vue'
import Err from '@/components/Error.vue'
import Suiji from '@/views/suiji/Suiji.vue'
import Video from '@/views/video/Video.vue'
import tansuo from '@/views/tansuo/tansuo.vue'
import Newmk from '@/views/newmk/Newmk.vue'
import search from '@/views/search/search.vue'

const routes = [
    { path: '/', redirect: '/home' },
    { path: '/home', component: Home },
    { path: '/login', component: Login },
    { path: '/create', component: Create },
    { path: '/video', component: Video },
    { path: '/suiji', component: Suiji },
    { path: '/tansuo', component: tansuo },
    { path: '/newmk', component: Newmk },
    { path: '/search', component: search },
    { path: '/ranking', component: Ranking },
    { path: '/my', component: My },
    {
        name: 'notFound',
        path: '/:catchAll(.*)',
        hidden: true,
        component: () => import('@/components/Error.vue')
    }
];
// https://blog.csdn.net/qq_59076775/article/details/124721699 路由守卫
// https://blog.csdn.net/m0_71485750/article/details/125537406 存储

const router = new createRouter({
    history: createWebHashHistory(),
    routes
})


export default router;
