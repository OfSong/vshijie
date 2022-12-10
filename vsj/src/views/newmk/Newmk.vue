<template>
  <el-header>
    <el-page-header @back="goBack">
      <template #content>
        <span class="text-large font-600 mr-3"> 新模块 </span>
      </template>
    </el-page-header>
    <!-- 回到顶部按钮 -->
    <el-backtop :bottom="100">
      <div style="height: 100%; width: 100%;text-align: center;line-height: 40px;color:#000;font-size: 15px;">
        顶部
      </div>
    </el-backtop>
  </el-header>
  <div>

    <div class="box">
      <div class="item item1">
        <div>学校大门</div>
      </div>
      <div class="item item2">
        <div>学校小路</div>
      </div>
      <div class="item item3">
        <div>学校宿舍</div>
      </div>
      <div class="item item4">
        <div>学校树林</div>
      </div>
      <div class="item item5">
        <div>学校风光</div>
      </div>
      <div class="item item6">
        <div>学校黄昏</div>
      </div>
      <div class="item item7">
        <div>学校大道</div>
      </div>
    </div>

    <div class="navs">
      <div v-for="item in lists" :key="item">
        <div class="nth">
          <img :src=item.img alt="">
          <div class="nths">
            <div>{{ item.slug }}</div>
            <div>{{ item.text }}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  
  
<script setup>
function goBack(){
  window.history.go(-1)
}
const lists = [
  {
    img: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F538e9697402bd.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673014588&t=89085220e2935bbf979f43356d23888b",
    slug: "1000",
    text: "书本",
  }, {
    img: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F5382fc8bd6eef.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673014918&t=e193d7c212827d88760f980b45df320e",
    slug: "1801",
    text: "高山",
  },
  {
    img: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F5382fc96322ba.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673015111&t=f93aeaeb2ea65bf8fc9406904d833bed",
    slug: "1400",
    text: "雪山",
  },
  {
    img: "https://img0.baidu.com/it/u=558952155,2062551832&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "1691",
    text: "瀑布",
  },
  {
    img: "https://img2.baidu.com/it/u=3081975867,1687415251&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "1774",
    text: "湖泊",
  },
  {
    img: "https://img2.baidu.com/it/u=2864589139,1134218305&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "1851",
    text: "草原",
  },
  {
    img: "https://img0.baidu.com/it/u=599570667,1691769483&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "1899",
    text: "云绕群山",
  },
  {
    img: "https://img2.baidu.com/it/u=2695208958,3600575337&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
    slug: "1101",
    text: "落叶",
  },
  {
    img: "https://img1.baidu.com/it/u=1976790484,3358202661&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "2256",
    text: "古藤老树",
  },
  {
    img: "https://img2.baidu.com/it/u=2104291757,3932985185&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "3860",
    text: "绿意",
  },
  {
    img: "https://img2.baidu.com/it/u=2404389700,2446415569&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    slug: "882",
    text: "长桥",
  },
  {
    img: "https://img0.baidu.com/it/u=2528283052,1229977267&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281",
    slug: "4501",
    text: "长桥",
  },
  {
    img: "https://img1.baidu.com/it/u=4202854243,1154414864&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281",
    slug: "785",
    text: "花丛密境",
  }, {
    img: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F538e9697402bd.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673014588&t=89085220e2935bbf979f43356d23888b",
    slug: "1000",
    text: "书本",
  },

]


  // console.log(lists);
</script>
<style  scoped>
* {
  margin: 0;
  padding: 0;
}

.navs {
  width: 1152px;
  margin: 0 auto;
  display: flex;
  /* background-color: rgb(225, 166, 202); */
  border: 1px solid black;
  box-shadow: 0 0 20px 5px rgb(50, 52, 50);
  justify-content: space-around;
  flex-wrap: wrap;
  padding-top: 20px;

}

.nth {
  width: 384px;
  height: 316px;
  display: flex;
  /* background-color: black; */
  flex-wrap: wrap;
  margin: 20px;
}

.nth>img {
  width: 384px;
  height: 216px;
}

.nths {
  width: 384px;
  display: flex;
  justify-content: space-between;
}


.box {
  /* css3动画  */

  width: 1200px;
  margin: 100px auto;
  display: flex;
}

.item {
  width: 172px;
  height: 260px;
  background-position: center;
  transition: all .2s;
  /* 过渡所有图片时间为2s */
}

.item1 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img16.jpg);
}

.item2 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img2.jpg);
}

.item3 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img3.jpg);
}

.item4 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img4.jpg);

}

.item5 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img5.jpg);
}

.item6 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img6.jpg);
}

.item7 {
  background-image: url(http://127.0.0.1:8000/uploads/image/img1.jpg);
}

.item:hover {
  width: 400px !important;
  /*  !important最高级 */
}

.item div {
  font-size: 30px;
  color: white;
  writing-mode: vertical-lr;
  /* 文字垂直书写 */
  background-color: rgba(0, 0, 0, 0.6);
  width: 100%;
  height: 260px;
  text-align: center;
  line-height: 172px;
  letter-spacing: 6px;
  transition: all .2s;
}

.item:hover div {
  opacity: 0;
}

.box:hover .item div {
  line-height: 133px;
}
</style>
  