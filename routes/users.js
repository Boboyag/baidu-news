var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var dbConf = require('./db.js');
var bodyParser = require('body-parser');
var xss = require('xss');
var csrf = require('csurf');

//创建路由中间件
var csrfProtection = csrf({ cookie: true });
var parseForm = bodyParser.urlencoded({ extended: false });

var connection = mysql.createPool(dbConf.db);



/*后台路由页面*/

//请求进入后台页面（users.ejs）
router.get('/',csrfProtection,function(req,res,next) {
    res.render('users',{ csrfToken: req.csrfToken() })
});

//获取所有新闻列表
router.get('/getnews', function(req, res, next) {
    connection.query('SELECT * FROM `news` order by id desc',function(err,rows) {
        res.json(rows);

    });
});

//添加新闻
router.post('/insert', parseForm, csrfProtection,function(req,res) {
    var newstype = xss(req.body.newstype),
        newstitle = xss(req.body.newstitle),
        newsimg = xss(req.body.newsimg),
        newstime = xss(req.body.newstime),
        newssrc = xss(req.body.newssrc);
    connection.query('INSERT INTO `news`(`newstype`, `newstitle`, `newsimg`, `newstime`, `newssrc`) VALUES (?,?,?,?,?)',[newstype,newstitle,newsimg,newstime,newssrc],function(err,result) {
        if (!err) {
            console.log(result.insertId);
            res.json(result);
        }
    });
});

//模态框取值
router.get('/curnews',function(req,res) {
    var newsid = req.query.newsid;
    connection.query('SELECT * FROM `news` WHERE id=?',[newsid],function(err,rows) {
        res.json(rows);
    });
});


//确认更新
router.post('/update', parseForm, csrfProtection,function(req,res) {
    var newsid = req.body.id,
        newstype = xss(req.body.newstype),
        newstitle = xss(req.body.newstitle),
        newsimg = xss(req.body.newsimg),
        newstime = xss(req.body.newstime),
        newssrc = xss(req.body.newssrc);
    connection.query('UPDATE `news` SET `newstype`=?,`newstitle`=?,`newsimg`=?,`newstime`=?,`newssrc`=? WHERE `id`=?',[newstype,newstitle,newsimg,newstime,newssrc,newsid],function(err,rows) {
        console.log(rows.changedRows);
        res.json(rows);
    });
});

//删除
router.post('/delete',function(req,res) {
    var newsid = req.body.newsid;
    connection.query('DELETE FROM `news` WHERE `news`.`id` = ?',[newsid],function(err,result) {
        console.log(result.affectedRows);
        res.json(result);
    });
});

module.exports = router;
