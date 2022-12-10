const express = require('express')
const router = express.Router()

const api_handler = require('../router_handler/api')



router.get('/img', api_handler.getImg)
router.get('/video', api_handler.getVideo)
router.get('/list', api_handler.getlist)
router.get('/list/:Id', api_handler.getid)
router.get('/sort/:tex',api_handler.getsort)
// 根据id查询用户基本信息
router.get('/user/:uid',api_handler.getuser)
// 根据用户id查询作品
router.get('/ulist/:uid',api_handler.getuli)

// 搜索表
router.get('/search/:text',api_handler.getSearch)


module.exports = router