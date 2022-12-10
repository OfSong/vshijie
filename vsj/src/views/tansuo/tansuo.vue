<template>
    <el-page-header @back="goBack">
        <template #content>
            <span class="text-large font-600 mr-3"> 探索 </span>
        </template>
    </el-page-header>
    <div class="common-layout">
        <el-container>
            <el-aside width="500px">
                <div class="shijie">
                    <div class="tou">
                        <h3>60秒看视界</h3>
                    </div>
                    <div class="simg">
                        <img src="http://www.ggapi.cn/api/60s" alt="">
                        <div class="foodi">

                        </div>
                    </div>
                </div>
            </el-aside>
            <!-- <el-container>
                <el-header>Header</el-header>
                <el-main>
                    main
                </el-main>
                <el-footer>Footer</el-footer>
            </el-container> -->
        </el-container>
    </div>

</template>
  
<script setup>
const goBack = () => {
    window.history.go(-1)
}


</script>
    
<style scoped>
.shijie .simg {
    width: auto;
    height: 100%;
    position: relative;
}
.foodi{
    position: absolute;
    background-color: #fff;
    width: 20%;
    height: 20px;
    bottom: 10px;
    left: 23px;
}
.tou {
    text-align: center;
}

.simg img {
    width: 500px;
}
</style>