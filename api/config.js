// 创建 config.js 文件，并向外共享 加密 和 还原 Token 的 jwtSecretKey 字符串
module.exports = {
    // 加密和解密 token 的密钥
    jwtSecretKey: 'my token key ^_^',
    // token 的有效期
    expiresIn: '10h',
}