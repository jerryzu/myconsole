// sql语句
var sqlMap = {
    // 用户
    user: {
        add: 'insert into user(id, username, password) values (0, ?, ?)',
        select_name: 'SELECT * from user where username = ?',    //查询 username
        select_password: 'SELECT * from user where password = ?'      //查询 password
    },
    task: {
        selectall: 'select * from t_task'
    }
}

module.exports = sqlMap;