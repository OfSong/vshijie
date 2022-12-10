import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
// import cookies from 'vue-cookies'


const app = createApp(App)
app.use(router)
app.use(ElementPlus)
// app.use(cookies)
app.mount('#app')
