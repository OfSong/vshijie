const express = require('express')
// 创建路由器对象
const router = express.Router()
// 导入用户路由处理函数模块
const userHandler = require('../router_handler/user')
// 1. 导入验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const { reg_login_schema } = require('../schema/user')

// 注册登录路由
router.post('/reg',expressJoi(reg_login_schema), userHandler.reg)
router.post('/login', expressJoi(reg_login_schema), userHandler.login)

module.exports = router;