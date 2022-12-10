// 导入数据库操作模块
const db = require('../db')
// 导入处理路径的 path 核心模块


// 发布新文章的处理函数
exports.addArticle = (req, res) => {
    // console.log(req.body) // 文本类型的数据
    // console.log('--------分割线----------')
    // console.log(req.file) // 文件类型的数据
    //获取后缀名
    let exts = req.file.originalname.split('.');
    let ext = exts[exts.length - 1];
    // console.log(req.file.path+'.'+ext);
    // 手动判断是否上传了文章封面
    if (!req.file || req.file.fieldname !== 'cover_img') return res.cc('文章封面是必选参数！')

    const articleInfo = {
        // 标题、内容、状态、所属的分类Id
        ...req.body,
        // 文章封面在服务器端的存放路径
        // cover_img: req.file.path+'.'+ext,
        cover_img: 'http://127.0.0.1:8000/uploads/'+req.file.filename+'.jpg',
        // 文章发布时间
        pub_date: new Date(),
        // 文章作者的Id
        author_id: req.user.uid,
        nickname: req.user.nickname,
        name: req.user.uname,
    }
    const sql = `insert into sj_articles set ?`
    db.query(sql, articleInfo, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('发布文章失败！')
        res.cc('发布文章成功', 0)
    })
}


exports.delete = (req, res) => {
    id = req.params.id;
    const sql = `update sj_articles set is_delete=1 where Id=?`
    db.query(sql, id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('您要删除的作品不存在！')
        return res.cc('删除成功！', 0)
    })

}