<template>
    <el-page-header @back="goBack">
        <template #content>
            <span class="text-large font-600 mr-3"> 搜索 </span>
        </template>
    </el-page-header>
    <div class="body">
        <div class="shell">
            <input id="a" type="text" placeholder="请输入要搜索内容" v-model="data.user">
            <button @click="a">GO</button>
            <!-- <el-buttnon @click="btn">GO</el-buttnon> -->
        </div>
    </div>
    <div>这是返回的数据</div>
    <div>搜索的内容：{{ data.user }}</div>
    <div class="box" v-for="item in data.dats">
        <div>作品id:{{ item.Id }}</div>
        <div>标题:{{ item.title }}</div>
        <div>简介:{{ item.content }}</div>
        <div>作者账号:{{ item.name }}</div>
        <div>作者昵称:{{ item.nickname }}</div>
        <div>点赞数量:{{ item.likesum }}</div>
        <div>发布时间:{{ item.pub_date }}</div>
        <div>照片链接:{{ item.cover_img }}</div>
    </div>

</template>

<script setup>
import { reactive } from 'vue'
import axios from "axios";
const data = reactive({
    user: '',
    dats: []
})
const goBack = () => {
    window.history.go(-1)
}
function a() {
    // const options = {
    //     method: 'GET',
    //     url: 'http://localhost:8000/api/search/' + data.user,
    //     headers: { 'content-type': 'application/x-www-form-urlencoded' },
    //     data: {}

    // };
    // axios.request(options).then(function (response) {
    //     // data.dats = response.data.data
    //     // console.log(response.data);
    //     // console.log(data.dats[0].title);
    // })
    data.dats = [
        {
            "title": '一路向西',
            "Id": '113',
            "content": "我想拥有一对翅膀，然后邀请风儿跳支舞” 当她来到大理之前，她的生活被钢筋水泥包围着，有时烦恼和焦虑让她觉得就像高楼林立的围墙，而唯一让她感到不窒息的地方，便是抬起头才能看见的天空。在大理，她时常抬头仰望天空，看着飞鸟划过蓝天白云，眼神里流露出三分感伤，七分憧憬。她想象自己能像一只鸟一样，展翅与风共舞，飞过洱海、飞过田野、消失在天际。",
            "name": 'Blackstation',
            "nickname": "彦昌",
            "likesum": '2345',
            "pub_date": '2022-12-07 18:04:09',
            "cover_img": 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20200314%2F42d749a3127944269eb6a5f9873b1b34.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673252565&t=94e4443b0be36a53399c7d114155354d'
        }
    ]
}
</script>

<style scoped>
* {
    outline: none;
    padding: 0;
    margin: 0;
    text-decoration: none
}

.body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 98vh;
    background-color: #ffdcdc;
}

.shell {
    position: relative;
    /* border: 1px solid black; */
    padding: 33px;
    width: 1000px;
    background-color: #ff7575;
    border-radius: 20px;
    box-shadow: 0 10px 50px #ff7575;

}

.shell input {
    width: 80%;
    height: 35px;
    color: #fff;
    font: 100 30px'优设标题黑';
    border: 0;
    background-color: transparent;
}

.shell input::placeholder {
    color: #8f36367e;
}

.shell button {
    display: flex;
    font-size: 35px;
    position: absolute;
    right: 30px;
    border: none;
    background-color: #ff7575;
    top: 30px;
    /* margin: 0 auto; */
    width: 100px;
    height: 50px;

}
</style>