<template>
    <el-header>
        <el-page-header @back="goBack">
            <template #content>
                <span class="text-large font-600 mr-3"> 投稿 </span>
            </template>
        </el-page-header>
    </el-header>
    <el-form :model="data.form" label-width="120px">
        <el-form-item label="标题">
            <el-input v-model="data.form.title" />
        </el-form-item>
        <el-form-item label="状态">
            <el-select v-model="data.form.state" placeholder="请选择作品状态">
                <el-option label="草稿" value="草稿" />
                <el-option label="发布" value="已发布" />
            </el-select>
        </el-form-item>
        <el-form-item label="简介">
            <el-input v-model="data.form.content" type="textarea" />
        </el-form-item>
        <input type="file" @change="upimg" />

        <el-form-item>
            <el-button type="primary" @click="onSubmit">提交</el-button>
        </el-form-item>
    </el-form>

</template>
<script setup>
import { reactive, onBeforeMount } from 'vue'
import axios from "axios";
import router from '@/router/index.js'
import { UploadFilled } from '@element-plus/icons-vue'

function goBack() {
    window.history.go(-1)
}
const data = reactive({
    mytoken: '',
    form: {
        "title": '',
        "state": '',
        "cate_id": '1',
        "content": '',
        "cover_img": null,
    }
})
onBeforeMount(() => {
    data.mytoken = window.localStorage.getItem('token')
    const options = {
        method: 'GET',
        url: 'http://localhost:8000/my/userinfo',
        headers: {
            Authorization: data.mytoken,
            // Authorization: '1',//测试身份验证失败的情况
            'content-type': 'application/x-www-form-urlencoded'
        }
    };

    axios.request(options).then(function (response) {
        if (response.data.code == 1) {
            alert('身份验证过期,请重新登录')
            setTimeout(() => {
                router.push('/login')
            }, 500);
        } else {
            data.user = response.data.data
        }
    })
})
const onSubmit = () => {
    const options = {
        method: 'POST',
        url: 'http://localhost:8000/my/article/add',
        headers: {
            Authorization: data.mytoken,
            'content-type': 'multipart/form-data; boundary=---011000010111000001101001'
        },
        data: data.form
    };

    axios.request(options).then(function (response) {
        console.log(response.data);
        if (response.data.code == 1) {
            alert("发布失败，请稍后再试")
        } else if (response.data.code == 0) {
            alert("发布成功")
        }
    }).catch(function (error) {
        console.error(error);
    });
    console.log(data.form)
    console.log('投稿图片：', data.form.cover_img);
}
const upimg = (event) => {
    const files = event.target.files; if (files.length > 0) { data.form.cover_img = files[0]; }
}

</script>
<style scoped>

</style>