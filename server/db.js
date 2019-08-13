// 数据库连接配置
module.exports = {
    local: {
        host: 'localhost',
        user: 'root',
        password: 'gemini',
        database: 'test',
        port: '3306'
    },
    dev:{
        host: 'rm-bp19v63q682asdrja.mysql.rds.aliyuncs.com',
        user: 'taipingbi_etl',
        password: 'Tpstic123456',
        database: 'tpdwfa',
        port: '3306'
    }
}
