<template>
    <el-page-header @back="goBack">
        <template #content>
            <span class="text-large font-600 mr-3"> 个人中心 </span>
        </template>
    </el-page-header>
    <div>这是个人中心</div>
    <div>用户id:{{ data.user.uid }}</div>
    <div>用户名:{{ data.user.uname }}</div>
    <div>昵称:{{ data.user.nickname }}</div>
    <div>邮箱:{{ data.user.email }}</div>
    <div>注册时间:{{ data.user.utime }}</div>


</template>
  
<script setup>
import { reactive, onBeforeMount } from 'vue'
import router from '@/router/index.js'
const axios = require('axios').default;

const goBack = () => {
    window.history.go(-1)
}
const data = reactive({
    mytoken: '',
    user: {}
})


onBeforeMount(() => {
    // data.mytoken = window.localStorage.getItem('token')
    // const options = {
    //     method: 'GET',
    //     url: 'http://localhost:8000/my/userinfo',
    //     headers: {
    //         Authorization: data.mytoken,
    //         // Authorization: '1',//测试身份验证失败的情况
    //         'content-type': 'application/x-www-form-urlencoded'
    //     },
    //     data: {}
    // };

    // axios.request(options).then(function (response) {
    //     if (response.data.code == 1) {
    //         alert('身份验证过期,请重新登录')
    //         setTimeout(() => {
    //             router.push('/login')
    //         }, 500);
    //     } else {
    //         data.user = response.data.data
    //     }
    // })
    data.user =
    {
        "uid": '32',
        "uname": 'xiaoming',
        "nickname": "小明儿",
        "utime": '2022-12-09T09:05:57',
        "email": "24354676@qq.com",
    }

})



</script>
  
<style scoped>

</style>