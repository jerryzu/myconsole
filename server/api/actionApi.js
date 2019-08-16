const url = require('url');
var models = require('../db');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $sql = require('../sqlMap');

// 连接数据库
var conn = mysql.createConnection(models.dev);

conn.connect();
var jsonWrite = function (res, ret) {
	if (typeof ret === 'undefined') {
		res.json({
			code: '1',
			msg: '操作失败'
		});
	} else {
		res.json(ret);
	}
};

router.get('/selecttoday', (req, res) => {
	var sql = $sql.action.selecttoday;
	let whsql = url.parse(req.url, true).query;
	let addsql = '';

	if (whsql.status) {
		addsql = addsql + ' status =  ' + whsql.status;
	}
	if (addsql){
		sql = sql + ' where ' + addsql;
	} else{
		sql = sql + ' limit 1,10 ';
	}
	console.log(sql);
	conn.query(sql, function (err, result) {
		if (err) {
			console.log(err);
		}
		if (result) {
			jsonWrite(res, result);
		}
	})
});

module.exports = router;