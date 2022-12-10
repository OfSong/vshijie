<template>
    <div class="common-layout">
        <el-container>
            <!-- Header -->
            <el-header>
                <el-page-header @back="goBack">
                    <template #content>
                        <span class="text-large font-600 mr-3"> 排行榜 </span>
                    </template>
                </el-page-header>
                <!-- 回到顶部按钮 -->
                <el-backtop :bottom="100">
                    <div style="height: 100%; width: 100%;text-align: center;line-height: 40px;color:#000;font-size: 15px;">
                        顶部
                    </div>
                </el-backtop>
            </el-header>

            <!-- Main -->

            <!-- <el-main>
                <el-table :data="data.lists" stripe border style="width: 100%">
                    <el-table-column type="index" label="排行" width="100" />
                    <el-table-column prop="cover_img" label="图片地址" width="180" />
                    <el-table-column prop="Id" label="作品ID" width="80" />
                    <el-table-column prop="title" label="标题" width="180" />
                    <el-table-column prop="content" label="介绍" width="300" />
                    <el-table-column prop="nickname" label="用户昵称" width="180" />
                    <el-table-column prop="name" label="用户名" width="180" />
                    <el-table-column prop="pub_date" label="上传日期" width="200" />
                    <el-table-column prop="likesum" label=" " width="180" />
                </el-table>
            </el-main> -->

            <h4 style="text-align: center;">榜单关键词</h4>
            <el-row class="mb-4 btn">
                <el-button type="primary" @click="num" :disabled="true">点赞数量</el-button>
                <el-button type="primary" @click="time" :disabled="false">发布日期</el-button>
            </el-row>
            <el-divider content-position="center">榜单</el-divider>







            <el-col class="col" :span="20" v-for="(item,index) in data.lists" :key="item">
                <el-card shadow="hover" class="card">
                    
                    <img class="image" :src='item.cover_img' alt="" />
                    <div class="index">
                        {{ index+1 }}
                    </div>
                    
                    <div class="title">
                        {{ item.title }}
                    </div>
                    <img class="upimg" src="https://s1.hdslb.com/bfs/static/jinkela/popular/assets/icon_up.png" alt=""/>
                    <div class="name">
                        {{ item.name }}
                    </div>
                    <div class="likeimg">
                        <svg t="1670427849879" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8958" width="32" height="32"><path d="M171.712 571.648l0.352 0.32 287.904 252.8a64 64 0 0 0 82.912 1.344l296.832-244.544a215.584 215.584 0 1 0-301.824-300.576L512 316.672l-25.888-35.616a215.584 215.584 0 1 0-314.4 290.624zM32 407.584a279.584 279.584 0 0 1 480-194.944 279.584 279.584 0 0 1 480 194.944 278.144 278.144 0 0 1-113.024 224.512l-295.36 243.392a128 128 0 0 1-165.888-2.592L129.984 620.16A278.976 278.976 0 0 1 32 407.584z" p-id="8959" fill="#9A9FA6"></path></svg>
                    </div>
                    <div class="like">
                        {{ item.likesum }}
                    </div>

                    <div class="bfl">
                        <!-- <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAC60lEQVR4Xu2aMYgTQRSG31sCprBXRMHmbIRT0EZrweau9ArhrtuZ2QTS2YidrYUEYjKznZc0Z3daHCpYnFrdgYogouAVeiDYaZFAdp6suLDuJdnsXWJ2M5Muu28n7//mzcubnYdg+AcN1w8WgI0AwwnYJWB4ANgkONYSqNfrx8rl8orWehERFwHgAgCcyFP0IOI+Ee0i4lsi+tDv9zer1eqvNB9TAbRarQVEfAAA19IGy9n9N4hYZYy9HuXXSABKqSUiepwzYZncQUSPMdYa9tBQAEopQUTNTL+WU2NEXGaMPRnk3kAASqmrRPRqwAMKEV8GQbDted5envT6vn9aa30FAJYBYDXpGxGdE0J8Sl4/AKDRaBwvlUrbAHAxbuw4zmXXdXfzJHqYL1LKGwCwkbj/vNfrLdVqtV78+gEAUsqbANBJPLzCOX9UBPGRj77vX9Ja7/wjFnGNMbY+EoBS6i4R3YkZrXPO14okPvJVSikBgEXfieieEOJWWgRs/l1HkV3hZj9yXCm1SkQPY4Kfcs6vp0XANyI6FRk5jnPGdd2vRYyAZrN51nGcLzHfv3POT6ZFAMUNOOepxVKe4UgpR+oZlAQtABsBMQJ2CdgccLQkGFZliHifiPYQcYOIOpzzH/8rcc48CSql3hPR+ZjgfQBoB0HQqVQq76YNYuYAkg4kBLfDiBBCbE0LRN4BRLpfIGK72+12kpuVo4IpCoA/Oonoo+M4bUTsuK4br+AOzaFQAGIqf4Z5Qmvd8Txv0HuJsYEUFUBcYLg5ax92Oz4PACIYO0R0WwjxbOzpB4B5AhDq/sw5X7AAMhCYpwgwdgkYmQTN/Bs0uRAythSe/82Q3Q6b/kIkQ80yFdOZF0JTUZVhUAvAHozYk6FsR2NKKeMPR40/Hje+QcLsFhnjm6TCGsPoNrmoyDK6UTIGwdxW2QiC0c3SEQSj2+UzbLwKaVroFrhJELcAJkGxyGPYCCjy7E3CdxsBk6BY5DF+A1q1ml9Q5ZM4AAAAAElFTkSuQmCC" alt=""> -->
                        <svg t="1670427564985" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5442" width="32" height="32"><path d="M675.328 117.717333A425.429333 425.429333 0 0 0 512 85.333333C276.352 85.333333 85.333333 276.352 85.333333 512s191.018667 426.666667 426.666667 426.666667 426.666667-191.018667 426.666667-426.666667c0-56.746667-11.093333-112-32.384-163.328a21.333333 21.333333 0 0 0-39.402667 16.341333A382.762667 382.762667 0 0 1 896 512c0 212.074667-171.925333 384-384 384S128 724.074667 128 512 299.925333 128 512 128c51.114667 0 100.8 9.984 146.986667 29.12a21.333333 21.333333 0 0 0 16.341333-39.402667zM456.704 305.92C432.704 289.152 405.333333 303.082667 405.333333 331.797333v360.533334c0 28.586667 27.541333 42.538667 51.370667 25.856l252.352-176.768c21.76-15.253333 21.632-43.541333 0-58.709334l-252.373333-176.768z m-8.597333 366.72V351.466667l229.269333 160.597333-229.269333 160.597333z" fill="#9A9FA6" p-id="5443"></path></svg>
                    </div>
                    <div class="bfls">
                        177.4万
                    </div>
                    <div class="date">
                        {{ item.pub_date }}
                    </div>
                    <div class="dateimg">
                        <svg t="1670428242489" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10097" width="32" height="32"><path d="M827.871087 196.128913C743.498468 111.756293 631.321596 65.290005 512 65.290005c-119.319549 0-231.499491 46.465265-315.871087 130.837884S65.290005 392.680451 65.290005 512s46.465265 231.499491 130.837884 315.871087 196.551538 130.837884 315.871087 130.837884c119.321596 0 231.499491-46.465265 315.871087-130.837884S958.708971 631.319549 958.708971 512 912.243707 280.500509 827.871087 196.128913zM531.556405 917.246651l0-74.145697c0-11.31572-9.174963-20.491707-20.491707-20.491707-11.316743 0-20.491707 9.174963-20.491707 20.491707l0 74.059739C283.276738 906.322857 116.693746 739.164766 106.755396 531.634176l72.351841 0c11.31572 0 20.491707-9.174963 20.491707-20.491707 0-11.31572-9.174963-20.491707-20.491707-20.491707l-72.273047 0c10.769274-206.737528 177.01253-373.005342 383.740848-383.813502l0 72.346725c0 11.316743 9.174963 20.491707 20.491707 20.491707 11.31572 0 20.491707-9.17394 20.491707-20.491707L531.558451 106.752326c207.593012 9.901511 374.807385 176.539762 385.609405 383.89946l-74.142627 0c-11.316743 0-20.491707 9.174963-20.491707 20.491707 0 11.316743 9.174963 20.491707 20.491707 20.491707l74.220399 0C907.275555 739.78796 739.720422 907.317511 531.556405 917.246651z" p-id="10098" fill="#9A9FA6"></path><path d="M532.098757 503.118726 532.098757 258.240529c0-11.316743-9.174963-20.491707-20.491707-20.491707-11.31572 0-20.491707 9.17394-20.491707 20.491707l0 254.66612c0 7.858992 4.429893 14.677281 10.924817 18.114566L693.447539 722.42757c4.002151 4.000104 9.245572 6.001691 14.490016 6.001691s10.487865-2.001587 14.490016-6.001691c8.002254-8.002254 8.002254-20.977777 0-28.980032L532.098757 503.118726z" p-id="10099" fill="#9A9FA6"></path></svg>
                    </div>
                    <!-- <div class="box">
                        {{ item.content }}
                    </div>
                    <div class="nickname">
                        {{ item.nickname }}
                    </div> -->
                    <el-button class="souc" type="warning" :icon="Star" circle ></el-button>
                    <el-button class="zhuanf" type="primary">转发</el-button>
                </el-card>
            </el-col>



            <!-- Main-end -->
        </el-container>
    </div>
</template>
<script setup >
import {
  Check,
  Delete,
  Edit,
  Message,
  Search,
  Star,
} from '@element-plus/icons-vue'
import { reactive, onBeforeMount } from 'vue'
const axios = require('axios').default;

let data = reactive({
    lists: [],
    phb: 'likesum'
})
onBeforeMount(() => {
    axios.get('http://localhost:8000/api/sort/' + data.phb)
        .then(function (response) {
            data.lists = response.data.data
        });
})
const goBack = () => {
    window.history.go(-1)
}

function num() {
    console.log('num');
    data.phb = 'likesum'
}

function time() {
    console.log('time');
    data.phb = 'pub_date'
    console.log(data.phb);
}
</script>
  
<style  scoped>
.btn {
    margin: 0 auto;
}

.col {
    margin: 0 100px 10px 100px;
}
.card{ 
    position: relative;
}
.image {
    width: 200px;
    height: auto;
}
.index{
    position: absolute;
    top: 19px;
    border-radius:0 0 20px 0 ;
    width: 28px;
    height: 30px;
    color: #fff;
    font-size: 20px;
    font-weight: 900;
    text-align: center;
    background-color: #FFC036;
}
.title{
    position: absolute;
    font-weight: 900;
    font-size: large;
    top: 20px;
    left: 240px;
}
.upimg{
    position: absolute;
    width: 25px;
    height: 25px;
    top: 80px;
    left: 243px;
}
.name{
    position: absolute;
    top: 81px;
    left: 273px;
    color: #9A9FA6;
}
.likeimg{
    position: absolute;
    top: 48px;
    left: 240px;
}
.like{
    position: absolute;
    top: 53px;
    left: 273px;
    color: #9A9FA6;
}
.bfl{
    position: absolute;
    bottom: 13px;
    left: 240px;
}
.bfls{
    position: absolute;
    bottom: 25px;
    left: 275px;
    font-size: small;
    color: #9A9FA6;
}
.date{
    position: absolute;
    top: 10px;
    right: 6px;
}
.dateimg{
    position: absolute;
    top: 6px;
    right: 200px;
}
.box{
    position: absolute;
    top: 40px;
    left: 360px;
    border-left: 1px #9a9fa65e solid;
    border-right: 1px #9a9fa665 solid;
    border-bottom: 1px #9a9fa669 solid;
    height: 90px;
    width: 650px;
    padding: 10px 20px 0 10px ;
    border-radius: 10px;
    overflow: hidden;
}
.nickname{
    position: absolute;
    top: 25px;
    left: 426px;
    padding: 0 20px;
    text-align: center;
    background-color: #FFC036;
    border-radius: 10px;
}
.souc{
    position: absolute;
    bottom: 10px;
    right: 90px;
}
.zhuanf{
    position: absolute;
    bottom: 10px;
    right: 10px;
}
</style>
  