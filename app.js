//使用express构建web服务器 
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');

/*引入路由模块*/
const users = require("./routes/users")
const products = require("./routes/products")
const index = require("./routes/index")
const details = require("./routes/details")
const cart =require("./routes/cart")

var app = express();
var server = app.listen(8080);

//配置跨域
const cors = require("cors")
app.use(cors({
    origin:[
        "http://127.0.0.1:8080",
        "http://localhost:8080"
    ],
    credentials:true
}))

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
app.use(session({
  secret: '128位随机字符串',
  resave: false,
  saveUninitialized: true,
}))

/*使用路由器来管理路由*/
app.use("/users",users);
app.use("/products",products)
app.use("/index",index)
app.use("/details",details)
app.use("/cart",cart)

