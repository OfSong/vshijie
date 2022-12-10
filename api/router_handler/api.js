const db = require('../db')

// 图片
exports.getImg = (req, res) => {
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0 and cate_id = 1`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取img信息成功! ',
            data: results,
        })
    })

}

// 视频
exports.getVideo = (req, res) => {
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0 and cate_id = 2`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取video信息成功! ',
            data: results,
        })
    })
}

// 所有已发布并未删除的内容
exports.getlist = (req, res) => {
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取列表信息成功! ',
            data: results,
        })
    })
}

// 根据id获取
exports.getid = (req, res) => {
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0 and Id=?`
    db.query(sql,req.params.Id , (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取Id信息成功! ',
            data: results,
        })
    })
}

// 排序
exports.getsort = (req, res) => {
    const tex = req.params.tex;
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0 ORDER BY ${tex} DESC`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取'+tex+'排行列表信息成功! ',
            data: results,
        })
    })
}

// 查询用户基本信息
exports.getuser = (req, res) => {
    const sql = `select uid, uname, nickname, email, user_pic,utime from sj_user where uid=?`
    db.query(sql, req.params.uid, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('获取用户信息失败！')
        res.send({
            status: 0,
            message: '获取用户基本信息成功！',
            data: results[0],
        })
    })
}

// 根据用户id获取作品
exports.getuli = (req, res) => {
    const sql = `select Id, title, content, cover_img, pub_date,cate_id,author_id,nickname,name,likesum from sj_articles where state= '已发布' and  is_delete = 0 and author_id=?`
    db.query(sql,req.params.uid , (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取用户作品列表成功! ',
            data: results,
        })
    })
}

// 搜索
exports.getSearch = (req, res) => {
    const text = req.params.text;
    const sql = `SELECT * FROM sj_articles  WHERE title LIKE '%${text}%' or  content LIKE '%${text}%' or name LIKE '%${text}%' or nickname LIKE '%${text}%'`
    db.query(sql,req.params.uid , (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '搜索'+text+'成功! ',
            data: results,
        })
    })
}