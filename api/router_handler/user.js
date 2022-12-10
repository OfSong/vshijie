const db = require('../db');
const router = require('../router/user');
const bcrypt = require('bcryptjs');
const { url } = require('inspector');
const jwt = require('jsonwebtoken');// 用这个包来生成 Token 字符串
const config = require('../config');// 导入配置文件

// 注册reg
exports.reg = (req, res) => {
    const userinfo = req.body;

    const sqlzy = `select * from sj_user where uname=?`
    db.query(sqlzy, [userinfo.uname], function (err, results) {
        if (err) return res.cc(err)
        if (results.length > 0) {
            return res.cc('用户名被占用，请更换其他用户名!', 1)
        }
        // 调用 bcrypt.hashSync() 对密码进行加密
        userinfo.upwd = bcrypt.hashSync(userinfo.upwd, 10)
        const sql = `insert into sj_user set ?`;
        db.query(sql, { uname: userinfo.uname, upwd: userinfo.upwd, }, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) {
                return res.cc(1, '用户注册失败，请稍后再试！')
            }
            res.cc('注册成功！', 0)
        })
    })
}

// login
exports.login = (req, res) => {
    const userinfo = req.body;
    const sql = `select * from sj_user where uname=?`;
    db.query(sql, userinfo.uname, function (err, results) {
        if (err) return res.cc(err);
        // 查询到数据条数不等于 1
        if (results.length !== 1) return res.cc('登录失败！');
        // TODO：判断用户输入的登录密码是否和数据库中的密码一致
        // 拿着用户输入的密码,和数据库中存储的密码进行对比
        const compareResult = bcrypt.compareSync(userinfo.upwd, results[0].upwd)
        // 如果对比的结果等于 false, 则证明用户输入的密码错误
        if (!compareResult) {
            return res.cc('登录失败！')
        }

        // TODO：登录成功，生成 Token 字符串
        // 剔除完毕之后，user 中只保留了用户的 id, uname, nickname 属性的值
        const user = { ...results[0], upwd: '', user_pic: '' }

        // // 生成 Token 字符串
        const tokenStr = jwt.sign(user, config.jwtSecretKey, { expiresIn: config.expiresIn, })

        res.send({
            code: 0,
            message: '登录成功！',
            // 为了方便客户端使用 Token，在服务器端直接拼接上 Bearer 的前缀
            token: 'Bearer ' + tokenStr,
        })
    })
}






