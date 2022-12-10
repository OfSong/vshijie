<template>
    <el-page-header @back="goBack">
        <template #content>
            <span class="text-large font-600 mr-3"> 视频 </span>
        </template>
    </el-page-header>
    <el-tooltip class="box-item" effect="dark" content="可以用键盘 1 切换下一个哦" placement="right">
        <el-button class="btn" type="primary" @click="btn01">下一个</el-button>
    </el-tooltip>
    <div class="box">
        <div class="video">
            <video id="shipin" autoplay  controls :src="data.url"></video>
        </div>
    </div>
</template>
  
<script setup>
import { reactive, onMounted } from 'vue'
const goBack = () => {
    window.history.go(-1)
}
const data = reactive({
    url: '',
    videos: [
        "https://us-videos.dji.net/video_trans/2b696e38fd084b1e97bbf4aa65c223b8/720.mp4",
        "https://us-videos.dji.net/video_trans/ee9c3472b4b24aeebb2081f773c74f5b/720.mp4",
        // "https://us-videos.dji.net/video_trans/f3aa3c3804a046fc8403cefe4a4f6060/720.mp4",
        "https://cn-videos.dji.net/video_trans/ae113880e6104c379d2cc8c5e79cdc0b/720.mp4",
        "https://cn-videos.dji.net/video_trans/4199ee53237f434b808a94e88e390265/720.mp4",
        "https://cn-videos.dji.net/video_trans/c8d722359cbc4cee83842b4b67912478/720.mp4",
        "https://cn-videos.dji.net/video_trans/7b91c2a707f44dc0b166c00e17ee2c5c/720.mp4",
        "https://cn-videos.dji.net/video_trans/886a1f6794f44e0d84e27e2ee3e08c0d/720.mp4",
        "https://cn-videos.dji.net/video_trans/b849ba66c687456fb42a4f628dbbbbbe/720.mp4",
        "https://cn-videos.dji.net/video_trans/75e5b346739f461e8c13e2cc8a603dad/720.mp4",
        "https://us-videos.dji.net/video_trans/37b4e42eccdf435fb30ead7378e19e64/720.mp4",
        "https://cn-videos.dji.net/video_trans/e078564760ff4995acc08e778ddbaa63/720.mp4",
        "https://cn-videos.dji.net/video_trans/5e2717f800a0434b9a41504120a1b4ca/720.mp4",
        "https://cn-videos.dji.net/video_trans/dd4c3a048ae44c409c330d993ca752e3/720.mp4",
        "https://us-videos.dji.net/video_trans/4c26f5ea97af4a1f887df2c0eb82ce9b/720.mp4",
        "https://cn-videos.dji.net/video_trans/9dcf72f5860c4a65b6ed69370464830c/720.mp4",
        "https://cn-videos.dji.net/video_trans/56dabf8f136244d896d4db1d3654dd1d/720.mp4",
        "https://cn-videos.dji.net/video_trans/708d64bfc46942eb9e53fd3dc7942931/720.mp4",
        "https://us-videos.dji.net/video_trans/313ffeba3b54480f8af7391be28fcb07/720.mp4",
        "https://cn-videos.dji.net/video_trans/0add8e1b8b054c5fb3ce583d09cb4e69/720.mp4",
        "https://cn-videos.dji.net/video_trans/75e5b346739f461e8c13e2cc8a603dad/720.mp4",
        "https://us-videos.dji.net/video_trans/af9af5ba8dd14c8aaffe5f7fd6ed4ec0/720.mp4",
        "https://cn-videos.dji.net/video_trans/7351aa3b259945faa3e13c05227e793f/720.mp4",
        "https://cn-videos.dji.net/video_trans/1f7dc1b0b4a44c3caee63b7da214a203/720.mp4"
    ]
},
    onMounted(() => {
        var randNum = Math.floor(Math.random() * 10);
        data.url = data.videos[randNum]
    })
)



function btn01() {
    var num = Math.floor(Math.random() * data.videos.length)
    data.url = data.videos[num]
}
// 键盘事件
window.onkeydown = function (event) {
    event = event || window.event;
    if (event.keyCode == 49) {
        btn01()
    }
}
</script>
  
<style scoped>
.video {
    text-align: center;
}

.btn {
    display: block;
    margin: 20px auto;
}

.tip {
    width: 300px;
    margin: auto;
}
</style>