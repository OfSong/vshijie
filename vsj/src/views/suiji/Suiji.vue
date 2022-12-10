<template>
  <el-page-header @back="goBack">
    <template #content>
      <span class="text-large font-600 mr-3"> 随机一图 </span>
    </template>
  </el-page-header>

  <div class="box">
    <el-tooltip class="box-item" effect="dark" content="快捷键1-5可切换系列类型" placement="bottom">
      <el-button @click="but01" type="primary">风景系列</el-button>
    </el-tooltip>
      <el-button @click="but02" type="success">小姐姐系列</el-button>
      <el-button @click="but03" type="info">动漫系列</el-button>
      <el-button @click="but04" type="warning">萌宠</el-button>
      <el-button @click="but05" type="danger">随机类型</el-button>
  </div>


  <div class="boximg">
    <div class="imgss">
      <img class="imagess" :src="data.url" alt="">
    </div>
  </div>


</template>

<script setup>
import { reactive } from 'vue'
const goBack = () => {
  window.history.go(-1)
}
const data = reactive({
  url: "https://api.r10086.com:8443/img-api.php?type=风景系列1",
  images01: [
    // "https://api.r10086.com:8443/img-api.php?type=风景系列2",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列3",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列4",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列5",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列6",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列7",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列8",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列9",
    // "https://api.r10086.com:8443/img-api.php?type=风景系列10",
    // "https://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images"
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&method=pc&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=fengjing&method=zsy&format=images",
  ],
  images02: [
    "https://api.btstu.cn/sjbz/api.php?lx=meizi",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&format=images&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&format=images&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&format=images&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&method=pc&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=meizi&method=zsy&format=images",
  ],
  images03: [
    "https://api.btstu.cn/sjbz/api.php?lx=dongman",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&format=images&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&format=images&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&format=images&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&method=pc&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=dongman&method=zsy&format=images",
  ],
  images04: [
    "http://api.starrobotwl.com/api/mc.php",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F1%2F5859e71a19cec.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673243492&t=3f1b5e68b3db7323269f891f7b18c2aa",
    "https://img0.baidu.com/it/u=3385773374,620653622&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    "https://img2.baidu.com/it/u=2620451797,4085819108&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
    "https://img0.baidu.com/it/u=658482827,848600526&fm=253&fmt=auto?w=1366&h=768",
    "https://img0.baidu.com/it/u=1736113696,3934849277&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
    "https://img1.baidu.com/it/u=543200849,2187904103&fm=253&fmt=auto?w=800&h=500",
    "https://img2.baidu.com/it/u=1314778412,2556811116&fm=253&fmt=auto&app=120&f=JPEG?w=1366&h=768",
    "https://img2.baidu.com/it/u=899631773,1509495568&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    "https://img1.baidu.com/it/u=4136068874,734963913&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
  ],
  images05: [
    "https://api.btstu.cn/sjbz/api.php?lx=suiji",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&format=images&method=pc",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&format=images&method=mobile",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&format=images&method=zsy",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&method=pc&format=images",
    "https://api.btstu.cn/sjbz/api.php?lx=suiji&method=zsy&format=images",
  ],
}
)

function but01() {
  var randNum1 = Math.floor(Math.random() * 10);
  data.url = data.images01[randNum1]
}
function but02() {
  var randNum2 = Math.floor(Math.random() * 10);
  data.url = data.images02[randNum2]
}
function but03() {
  var randNum3 = Math.floor(Math.random() * 10);
  data.url = data.images03[randNum3]
}
function but04() {
  var randNum4 = Math.floor(Math.random() * 10);
  data.url = data.images04[randNum4]
}
function but05() {
  var randNum5 = Math.floor(Math.random() * 10);
  data.url = data.images05[randNum5]
}
// 键盘事件
window.onkeydown = function (event) {
  event = event || window.event;
  if (event.keyCode == 49) {
    but01()
  } else if (event.keyCode == 50) {
    but02()
  } else if (event.keyCode == 51) {
    but03()
  } else if (event.keyCode == 52) {
    but04()
  } else if (event.keyCode == 53) {
    but05()
  }
}
</script>

<style scoped>
.box {
  padding: 20px;
  margin: 20px;
  text-align: center;
}

.boximg {
  margin-top: 30px;
  width: 100%;
  height: 80vh;
}

.imgss {
  text-align: center;
  height: 100%;
}

.imagess {
  height: 100%;
  width: auto;
}
</style>