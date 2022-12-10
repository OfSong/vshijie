<template>
  <div class="backg">
    <div class="biaoti">欢迎来到我们的视界~</div>
    <div class="layout">
      <el-tabs type="border-card">
        <el-tab-pane label="登录">
          <el-form label-position="right" label-width="60px" style="max-width: 460px" class="loginForm">
            <el-form-item label="账号：">
              <el-input v-model="uname" />
            </el-form-item>
            <el-form-item label="密码：">
              <el-input type="password" v-model="password" />
            </el-form-item>

            <el-row>
              <el-checkbox class="checkBox" v-model="isAgree" label="同意用户使用准则" name="type" />
            </el-row>
            <el-row>
              <el-button text>
                <a class="floatR" @click="isChangePassword = true">忘记密码</a>
              </el-button>
            </el-row>
            <el-button v-if="isAgree" type="primary" class="loginBtn" @click="login">
              登录
            </el-button>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="注册">
          <el-form label-position="right" label-width="100px" style="max-width: 460px" class="loginForm">
            <el-form-item label="账号：">
              <el-input v-model="runame" />
            </el-form-item>
            <el-form-item label="密码：">
              <el-input type="password" v-model="rPassword" />
            </el-form-item>
            <el-form-item label="确认密码：">
              <el-input type="password" v-model="confirmPassword" @blur="confirmFunc" />
            </el-form-item>
            <el-form-item label="验证码：">
              <el-row>
                <el-input type="password" v-model="identifyCode" class="inpWidth" />
                <el-button type="primary" @click="getIdentifyCode" plain>
                  获取验证码
                </el-button>
              </el-row>
            </el-form-item>

            <el-row>
              <el-checkbox class="checkBox" v-model="rAgree" label="同意用户使用准则" name="type" />
            </el-row>
            <el-button v-if="rAgree" type="primary" class="loginBtn" @click="register">
              注册
            </el-button>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </div>
    <!-- 忘记密码弹窗 -->
    <teleport to="body">
      <el-dialog v-model="isChangePassword" title="修改密码" width="40%">
        <el-form label-position="right" label-width="100px" style="max-width: 460px" class="loginForm">
          <el-form-item label="账号：">
            <el-input v-model="runame" />
          </el-form-item>
          <el-form-item label="密码：">
            <el-input type="password" v-model="rPassword" />
          </el-form-item>
          <el-form-item label="确认密码：">
            <el-input type="password" v-model="confirmPassword" @blur="confirmFunc" />
          </el-form-item>
          <el-form-item label="验证码：">
            <el-row>
              <el-input type="password" v-model="identifyCode" class="inpWidth" />
              <el-button type="primary" @click="getIdentifyCode" plain>
                获取验证码
              </el-button>
            </el-row>
          </el-form-item>

          <el-row>
            <el-checkbox class="checkBox" v-model="rAgree" label="同意用户使用准则" name="type" />
          </el-row>
          <el-button v-if="rAgree" type="primary" class="loginBtn" @click="changePassword">
            修改密码
          </el-button>
          <el-button v-if="rAgree" type="primary" class="loginBtn" @click="isChangePassword = false">
            关闭页面
          </el-button>
        </el-form>
      </el-dialog>
    </teleport>
  </div>
</template>
<script>
import { reactive, toRefs, ref } from "@vue/reactivity";
import { ElMessage } from "element-plus";
import router from '@/router/index.js'
const axios = require('axios').default;


export default {
  setup() {
    const form = reactive({
      uname: "",
      password: "",
      isAgree: 0,
    });
    const registerForm = reactive({
      runame: "",
      rPassword: "",
      confirmPassword: "",
      identifyCode: "",
      rAgree: 0,
    });

    // 方法
    // 登录 将账号密码写入后台,获取用户数据,后登录
    function login() {

      const options = {
        method: 'POST',
        url: 'http://localhost:8000/user/login',
        headers: { 'content-type': 'application/x-www-form-urlencoded' },
        data: { uname: form.uname, upwd: form.password }
      };
      axios.request(options).then(function (response) {
        if (response.data.code == 0) {
          window.localStorage.setItem("token", response.data.token);
          alert('登陆成功');
          setTimeout(() => {
            router.push('/home')
          }, 500);
        } else if (response.data.code == 1) {
          alert('登录失败！请检验账号密码是否正确');
        }
      })

    }
    // 注册 -- 将账号密码写入后台, 自动登录
    function register() {
      const options = {
        method: 'POST',
        url: 'http://localhost:8000/user/reg',
        headers: { 'content-type': 'application/x-www-form-urlencoded' },
        data: { uname: registerForm.runame, upwd: registerForm.rPassword }
      };
      axios.request(options).then(function (response) {
        if (response.data.code == 0) {
          alert('注册成功,请登录');
        } else if (response.data.code == 1) {
          alert('注册失败!' + response.data.message);
        }
      })
    }
    // 获取验证码
    function getIdentifyCode() {
      console.log("获取验证码");
    }
    // 确认密码
    const confirmFunc = () => {
      if (registerForm.confirmPassword !== registerForm.rPassword)
        ElMessage.error("密码与确认密码不一致.");
    };
    // 修改密码
    let isChangePassword = ref(false);
    // 用的是注册参数
    function changePassword() { }

    return {
      isChangePassword,
      ...toRefs(form),
      ...toRefs(registerForm),
      login,
      register,
      getIdentifyCode,
      confirmFunc,
      changePassword,
    };
  },
};
</script>

<style scoped>
.layout {
  position: absolute;
  left: calc(50% - 200px);
  top: 30%;
  width: 400px;
}

.loginBtn {
  width: 100px;
}

.loginForm {
  text-align: center;
}

.checkBox {
  margin-left: 7px;
}

.inpWidth {
  width: 165px;
}

.floatR {
  font-size: 10px;
  margin-left: 9px;
  color: blue;
}

.backg {
  background-image: url('http://127.0.0.1:8000/uploads/e89e8a3c4474f8e2dec24125d1a589bb.jpg');
  background-size: 100% 100%;
  height: 98vh;
  width: auto;
}

.biaoti {
  text-align: center;
  color: white;
  font-size: 80px;
  padding-top: 100px;
}
</style>
