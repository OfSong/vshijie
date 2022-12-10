const express = require('express')
const app = express()
// 引入 用户路由器 模块
const joi = require('joi')
// 导入 cors 中间件
const cors = require('cors')
// 将 cors 注册为全局中间件
app.use(cors())

app.use((req, res, next) => {
    // code = 0成功 为1失败 默认为1
    res.cc = (err, code = 1) => {
        res.send({
            // 状态
            code,
            // 状态描述，判断 err 是 错误对象 还是 字符串
            message: err instanceof Error ? err.message : err,
        })
    }
    next()
})

// 将post传递的参数，转为对象
app.use(express.urlencoded({ extended: false }));

// 导入配置文件
const config = require('./config')
// 解析 token 的中间件
const expressJWT = require('express-jwt')
// 使用 .unless({ path: [/^\/api\//] }) 指定哪些接口不需要进行 Token 的身份认证
app.use(expressJWT({ secret: config.jwtSecretKey }).unless({ path: [/^\/user\/|\/api\/|\/uploads\//] }))



// 用户
const userRouter = require('./router/user.js')
// api
const apiRouter = require('./router/api.js')
// 导入并使用用户信息路由模块
const userinfoRouter = require('./router/userinfo')
// 导入并使用文章分类路由模块
const artCateRouter = require('./router/artcate')
// 导入并使用文章路由模块
const articleRouter = require('./router/article')


app.use('/user', userRouter);
app.use('/api', apiRouter);
// 注意：以 /my 开头的接口，都是有权限的接口，需要进行 Token 身份认证
app.use('/my', userinfoRouter)
// 为文章分类的路由挂载统一的访问前缀 /my/article
app.use('/my/article', artCateRouter)
// 为文章的路由挂载统一的访问前缀 /my/article
app.use('/my/article', articleRouter)
// 托管静态资源文件
app.use('/uploads', express.static('./uploads'))


// 定义错误级别的中间件
// 错误中间件
app.use((err, req, res, next) => {
    // 数据验证失败
    if (err instanceof joi.ValidationError) return res.cc(err)
    // 身份认证失败
    if (err.name === 'UnauthorizedError') return res.cc('身份认证失败！')
    // 未知错误
    res.cc(err)
})

app.listen(8000, () => {
    console.log('api server running at http://127.0.0.1:8000')
})