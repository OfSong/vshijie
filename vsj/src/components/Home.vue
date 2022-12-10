<template>
  <div class="common-layout">
    <el-container>
      <!-- Header -->
      <el-header>
        <!-- 导航栏 -->
        <el-affix :offset="0">
          <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" :ellipsis="false" router>
            <el-menu-item index="0" route="/" style="font-size: 30px;">SHIJIE</el-menu-item>
            <el-menu-item index="1" route="/" style="font-size: 20px;">首页</el-menu-item>
            <el-menu-item index="2" route="/ranking" style="font-size: 20px;">排行榜</el-menu-item>
            <el-menu-item index="3" route="/create" style="font-size: 20px;">投稿</el-menu-item>
            <el-menu-item index="4" route="/suiji" style="font-size: 20px;">随机一图<span class="new">new</span>
            </el-menu-item>
            <el-menu-item index="5" route="/video" style="font-size: 20px;">视频<span class="new">new</span>
            </el-menu-item>
            <el-menu-item index="6" route="/newmk" style="font-size: 20px;">新版块<span
                class="new">new</span></el-menu-item>
            <el-menu-item index="7" route="/tansuo" style="font-size: 20px;">探索<span
                class="new">new</span></el-menu-item>
            <div class="flex-grow" />
            <!-- <el-input v-model="input" :suffix-icon="Search" placeholder="Please input"
              style="width: 300px; padding:10px 0;margin-top: 5px;" /> -->
              <el-menu-item index="8" route="/search" style="font-size: 20px;">搜索</el-menu-item>
            <!-- <el-menu-item v-if="data.mytoken != ''" index="5" route="/my" style="font-size: 20px;">个人中心</el-menu-item> -->
            <el-sub-menu index="5" v-if="data.mytoken != ''">
              <template #title>个人中心</template>
              <el-menu-item route="/my">
                <div style="margin: 0 auto;">个人中心</div>
              </el-menu-item>
              <div @click="goout"
                style="width: 100%;height:100%; font-size: 13px;text-align: center; line-height: 35px;">退出登录</div>
            </el-sub-menu>
            <!-- <el-menu-item v-if="data.mytoken != ''" @click="goout" style="font-size: 15px;">退出</el-menu-item> -->
            <el-menu-item v-else index="5" route="/login" style="font-size: 20px;">登录</el-menu-item>
          </el-menu>

        </el-affix>
        <!-- 回到顶部按钮 -->
        <el-backtop :bottom="100">
          <div style="height: 100%;width: 100%;text-align: center;line-height: 40px;color:  #000;font-size: 15px;">
            顶部
          </div>
        </el-backtop>
      </el-header>

      <!-- ----Main--- -->
      
      <el-main>
        <!-- --轮播图--- -->
        <!-- <el-carousel :interval="5000" arrow="always" height="850px">
          <el-carousel-item v-for="item in data.lbt" :key="item">
            <el-image @click="drawer = true, clickCard(item.Id)" :src="item.cover_img"></el-image>
          </el-carousel-item>
        </el-carousel> -->
        <div class="toplbt">
          <el-carousel :interval="5000" arrow="always" class="lbtings" height="100%">
            <el-carousel-item v-for="item in data.lbt" :key="item">
              <el-image @click="drawer = true, clickCard(item.Id)" :src="item.cover_img"></el-image>
            </el-carousel-item>
          </el-carousel>
        </div>

        <!-- ---轮播图-end -->
        <el-divider>
        </el-divider>
        <!-- 卡片 -->

        <el-row :gutter="12" style="width: 163vh;">
          <el-col :span="8" v-for="item in data.lists" :key="item" router>
            <el-card shadow="hover" style="margin: 5px 0;" route="/about">
              <img class="image" @click="drawer = true, clickCard(item.Id)" :src='item.cover_img' alt="">
              <div style="padding: 14px">
                <span style="font-weight: 900;">{{ item.title }}</span>
                <div class="bottom">
                  <time class="time">{{ item.pub_date }}</time>
                  <el-button text class="button"><span v-if="item.nickname != null">{{ item.nickname }}</span>
                    <span v-else>{{ item.name }}</span></el-button>
                </div>
              </div>
            </el-card>
          </el-col>

        </el-row>
        <!-- ---卡片----exnd--- -->
        <!-- 抽屉 -->
        <el-drawer v-model="drawer" class="couti" title="I am the title" :with-header="false">
          <p class="ctid"> 作品id: <el-link style="color: black;" type="success"> {{ data.wzlist.Id }}</el-link></p>
          <h2>{{ data.wzlist.title }}</h2>
          <img class="ctimg" :src='data.wzlist.cover_img' alt="">
          <el-button type="primary">
            <a :href=data.wzlist.cover_img target="_blank">点击浏览大图</a>
          </el-button>
          <p class="pf">评分: <el-rate :texts="['oops', 'disappointed', 'normal', 'good', 'great']" show-text /></p>
          <el-divider>
          </el-divider>
          <div class="ctbox">
            <el-col :span="12">
              <div class="demo-basic--circle">
                <div class="block">
                  <el-avatar :size="50" src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" />
                  <div class="sub-title">{{ data.wzlist.name }}</div>
                </div>
              </div>
            </el-col>
            <p> 作者昵称: {{ data.wzlist.nickname }}</p>
            <div> 作品介绍: </div>
            <div>&nbsp;&nbsp;&nbsp;&nbsp;{{ data.wzlist.content }}</div>
            <div class="cttime"> 发布日期: {{ data.wzlist.pub_date }}</div>

            <p> <svg t="1670418974558" class="icon" viewBox="0 0 1024 1024" version="1.1"
                xmlns="http://www.w3.org/2000/svg" p-id="4447" width="32" height="32">
                <path
                  d="M5.1 831.1h253.5c2.8 0 5.1-2.3 5.1-5.1s-2.3-5.1-5.1-5.1H5.1c-2.8 0-5.1 2.3-5.1 5.1 0 2.9 2.3 5.1 5.1 5.1z m314.3 0h55.8c2.8 0 5.1-2.3 5.1-5.1s-2.3-5.1-5.1-5.1h-55.8c-2.8 0-5.1 2.3-5.1 5.1 0.1 2.9 2.3 5.1 5.1 5.1z m106.5 0h253.5c2.8 0 5.1-2.3 5.1-5.1s-2.3-5.1-5.1-5.1H425.9c-2.8 0-5.1 2.3-5.1 5.1 0 2.9 2.3 5.1 5.1 5.1z m314.4 0H796c2.8 0 5.1-2.3 5.1-5.1s-2.3-5.1-5.1-5.1h-55.8c-2.8 0-5.1 2.3-5.1 5.1 0.1 2.9 2.4 5.1 5.2 5.1z m106.4 0h172.4c2.8 0 5.1-2.3 5.1-5.1s-2.3-5.1-5.1-5.1H846.7c-2.8 0-5.1 2.3-5.1 5.1 0.1 2.9 2.3 5.1 5.1 5.1z"
                  fill="#3B0404" p-id="4448"></path>
                <path
                  d="M409.6 803.5H86.9c-14 0-25.4-11.4-25.4-25.4 0-14 11.4-25.4 25.4-25.4h118.2c-10.1-3.4-17.3-12.9-17.3-24 0-10.9 6.8-20.1 16.4-23.7h-73.9c-14 0-25.4-11.4-25.4-25.4 0-14 11.4-25.4 25.4-25.4h130.1l-40.8-40.8-1.8-1.8c-88.1-88.1-88.1-231 0-319.1s231-88.1 319.1 0l1.8 1.8 1.8-1.8c88.1-88.1 231-88.1 319.1 0 88.1 88.1 88.1 231 0 319.1l-1.8 1.8L560.2 911c-11.9 11.9-31.1 11.9-43 0L409.6 803.5zM54.5 753.1c-14 0-25.4-11.4-25.4-25.4 0-14 11.4-25.4 25.4-25.4s25.4 11.4 25.4 25.4c0 14.1-11.4 25.4-25.4 25.4z"
                  fill="#FF5E5E" p-id="4449"></path>
                <path
                  d="M668.1 228.8c67.9-9.7 139.3 11.6 191.5 63.8 88.1 88.1 88.1 231 0 319.1l-1.8 1.8L560.2 911c-11.9 11.9-31.1 11.9-43 0l-5.1-5.1 291.3-291.4 1.8-1.8c88.1-88.1 88.1-231 0-319.1-38.3-38.2-87-59.9-137.1-64.8z"
                  fill="#CB2828" p-id="4450"></path>
                <path
                  d="M196 633.3c2 2 2 5.2 0 7.2s-5.2 2-7.2 0L165.3 617l-1-1-0.3-0.3-0.5-0.5c-54.3-54.3-77.4-130.8-63.8-204.9 0.5-2.8 3.1-4.6 5.9-4.1 2.8 0.5 4.6 3.1 4.1 5.9-13 70.9 9.1 144 61 195.9l0.5 0.5 0.3 0.3 1.1 1.1 23.4 23.4z m-85.3-226c-0.6 2.7-3.2 4.5-6 3.9-2.7-0.6-4.5-3.2-3.9-6 0.3-1.7 0.7-3.4 1.1-5.1 0.6-2.7 3.3-4.4 6.1-3.8 2.7 0.6 4.4 3.3 3.8 6.1-0.4 1.6-0.7 3.3-1.1 4.9z m17.4-51.2c-1.2 2.5-4.3 3.6-6.8 2.4s-3.6-4.3-2.4-6.8c11.1-23 26-44 44.5-62.5 44.3-44.3 103.3-68.1 164.6-67.7 2.8 0 5.1 2.3 5 5.1 0 2.8-2.3 5.1-5.1 5-58.6-0.3-115 22.4-157.4 64.7-17.5 17.7-31.8 37.8-42.4 59.8zM333 231.7c-2.8-0.1-5-2.4-4.9-5.2 0.1-2.8 2.4-5 5.2-4.9 1.7 0 3.5 0.1 5.2 0.2 2.8 0.1 4.9 2.5 4.8 5.3-0.1 2.8-2.5 4.9-5.3 4.8-1.7-0.1-3.4-0.2-5-0.2z m272.4-6c2.7-0.5 5.4 1.3 5.9 4s-1.3 5.4-4 5.9c-42.8 8.3-82.3 29-113.9 60.6l-0.4 0.4-1.5 1.5c-2 2-5.2 2-7.2-0.1-0.6-0.6-1.2-1.2-1.7-1.8-26.9-26.9-59.7-46-95.5-56.2-2.7-0.8-4.3-3.6-3.5-6.3 0.8-2.7 3.6-4.3 6.3-3.5 36.7 10.4 70.3 29.8 98.2 57 32.6-31.9 73.2-53 117.3-61.5z m6.6 9c-2.8 0.5-5.4-1.4-5.9-4.1-0.5-2.8 1.4-5.4 4.1-5.9 1.7-0.3 3.4-0.6 5.1-0.8 2.8-0.4 5.3 1.5 5.8 4.3 0.4 2.8-1.5 5.3-4.3 5.8-1.5 0.2-3.2 0.5-4.8 0.7z m54.6-2.5c-2.8-0.2-4.9-2.7-4.7-5.4 0.2-2.8 2.7-4.9 5.4-4.7 54.4 4.2 105.7 27.5 145.1 66.9 23.1 23.1 40.7 50.3 52.2 80.2 1 2.6-0.3 5.5-2.9 6.6-2.6 1-5.5-0.3-6.6-2.9-11-28.5-27.8-54.6-49.9-76.7-37.6-37.7-86.6-59.9-138.6-64zM857 377.5c-0.9-2.6 0.4-5.5 3.1-6.5 2.6-0.9 5.5 0.4 6.5 3.1 0.6 1.6 1.1 3.3 1.7 4.9 0.9 2.7-0.6 5.5-3.2 6.4-2.7 0.9-5.5-0.6-6.4-3.2-0.6-1.6-1.2-3.1-1.7-4.7z m11.9 53.1c-0.3-2.8 1.8-5.3 4.6-5.5 2.8-0.3 5.3 1.8 5.5 4.6 6.7 68.3-17 136.2-66.5 185.7l-1.8 1.8-36.8 36.8c-2 2-5.2 2-7.2 0s-2-5.2 0-7.2l36.8-36.8c0.6-0.6 1.2-1.2 1.8-1.7 47.3-47.5 69.9-112.5 63.6-177.7zM763.1 650.2c2-2 5.2-2 7.2 0s2 5.2 0 7.2l-3.6 3.6c-2 2-5.2 2-7.2 0s-2-5.2 0-7.2l3.6-3.6z m-39.4 39.5c2-2 5.2-2 7.2 0s2 5.2 0 7.2L551.6 876.1c-2 2-5.2 2-7.2 0s-2-5.2 0-7.2l179.3-179.2zM540.9 872.5c2-2 5.2-2 7.2 0s2 5.2 0 7.2l-3.6 3.6c-2 2-5.2 2-7.2 0s-2-5.2 0-7.2l3.6-3.6z m-39.1 38.3c-9.8 6.4-22.9 5.2-31.4-3.1L367.8 805.1c-2-2-5.2-2-7.2 0s-2 5.2 0 7.2L463.3 915c12 11.6 30.3 13.3 44.1 4.4 2.3-1.5 3-4.7 1.5-7-1.6-2.4-4.7-3.1-7.1-1.6z"
                  fill="#3B0404" p-id="4451"></path>
                <path
                  d="M494.3 514.2c-8.4 0-15.2-6.8-15.2-15.2s6.8-15.2 15.2-15.2c8.4 0 15.2 6.8 15.2 15.2s-6.8 15.2-15.2 15.2z m91.3 0c-8.4 0-15.2-6.8-15.2-15.2s6.8-15.2 15.2-15.2 15.2 6.8 15.2 15.2-6.8 15.2-15.2 15.2zM465.1 583.3c18.7 22.9 46.6 36.5 76.7 36.5 29.2 0 56.3-12.7 74.9-34.4 1.8-2.1 1.6-5.3-0.5-7.2-2.1-1.8-5.3-1.6-7.2 0.5-16.8 19.5-41.1 30.9-67.3 30.9-27 0-52.1-12.2-68.8-32.7-1.8-2.2-5-2.5-7.1-0.7s-2.5 5-0.7 7.1z"
                  fill="#3B0404" p-id="4452"></path>
                <path
                  d="M428.4 559.9c-8.4 0-15.2-6.8-15.2-15.2 0-8.4 6.8-15.2 15.2-15.2 8.4 0 15.2 6.8 15.2 15.2 0 8.4-6.8 15.2-15.2 15.2z m223.1 0c-8.4 0-15.2-6.8-15.2-15.2 0-8.4 6.8-15.2 15.2-15.2s15.2 6.8 15.2 15.2c0 8.4-6.8 15.2-15.2 15.2z"
                  fill="#CB2828" p-id="4453"></path>
                <path
                  d="M332.1 483.8c-30.8 0-55.8-25-55.8-55.8s25-55.8 55.8-55.8 55.8 25 55.8 55.8-25 55.8-55.8 55.8z m415.8 0c-30.8 0-55.8-25-55.8-55.8s25-55.8 55.8-55.8 55.8 25 55.8 55.8-25 55.8-55.8 55.8z"
                  fill="#F54040" p-id="4454"></path>
                <path
                  d="M871.4 125.7v-0.3c0-14.9 12.1-26.9 26.9-26.9s26.9 12.1 26.9 26.9V160.6c0 10.5-8.5 19-19 19H871c-14.9 0-26.9-12.1-26.9-26.9s12.1-26.9 26.9-26.9c0.2-0.1 0.3-0.1 0.4-0.1z"
                  fill="#FF5E5E" p-id="4455"></path>
              </svg>&nbsp;&nbsp;&nbsp;{{ data.wzlist.likesum }}&nbsp;个人点赞</p>

          </div>



          <p class="pinglun">

            <el-input v-model="input" placeholder="登录后可发表评论" />
            <span><el-button type="primary">评论</el-button></span>
          </p>
        </el-drawer>

      </el-main>
      <el-divider>
      </el-divider>
      <!-- ----Footer------------ -->
      <el-footer>
        <div class="footer">
          <div class="footop">
            <div class="fone">
              <span>Copyright © 2022 shijieimg.com 视界img 版权所有</span>
            </div>

            <div class="ftow">
              <span>使用条款</span>
              <span>隐私政策</span>
              <span>内容指引</span>
              <span>网站反馈</span>
              <span>常见问题</span>
            </div>
          </div>
          <div class="footb">
            <span>粤ICP备2022092332号</span>
          </div>
        </div>
      </el-footer>
      <!-- ---Footer--end---- -->
    </el-container>
  </div>
</template>
<script setup >
import { ref, reactive, onBeforeMount } from 'vue'
import { Search } from '@element-plus/icons-vue'
import router from '@/router/index.js'

const activeIndex = ref('1')
const axios = require('axios').default;
let data = reactive({
  mytoken: '',
  lists: [],
  lbt: [],
  wzlist: {}
})
onBeforeMount(() => {
  data.mytoken = window.localStorage.getItem('token')
  axios.get('http://localhost:8000/api/img')
    .then(function (response) {
      data.lists = response.data.data
    });
  // 轮播图排行榜前三个
  axios.get('http://localhost:8000/api/sort/likesum')
    .then(function (response) {
      data.lbt = response.data.data.slice(0, 3)
    });

})
function clickCard(wzId) {
  // 根据Id获取文章详情
  axios.get('http://localhost:8000/api/list/' + wzId)
    .then(function (response) {
      data.wzlist = response.data.data[0]
    });
  // console.log(data.wzlist);
}
// 退出
function goout() {
  window.localStorage.setItem('token', '')
  data.mytoken = ''
  alert('退出成功')
}

const input = ref('')
const drawer = ref(false)
</script>

<style  scoped>
.flex-grow {
  flex-grow: 1;
}

/* 卡片 */
.time {
  font-size: 12px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0;
  min-height: auto;
}

.image {
  width: 100%;
  display: block;
}

a {
  color: white;
  text-decoration: none;
}

.couti {
  position: relative;
}

.pinglun {
  /* position: absolute; */
  /* bottom: 10px; */
  text-align: right;
}

.new {
  font-size: 10px;
  color: red;
  padding-bottom: 7px;
}

.couti h2 {
  text-align: center;
}

.ctimg {
  width: 100%;
  height: auto;
}

.ctid {
  font-size: small;
}

.ctbox {
  position: relative;
}

.sub-title {
  position: absolute;
  top: 23px;
  left: 70px;
}

.cttime {
  position: absolute;
  top: 0;
  right: 0;
  font-size: smaller;
}

.footer {
  width: 100%;
  height: 80px;
  position: relative;
  text-align: center;
}

.toplbt{
  margin: 0 auto;
  width: 130vh;
  height: 70vh;
}

.lbtings {
  height: 100%;
  width: 100%;
}
</style>
