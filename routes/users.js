const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.post("/signin",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  //console.log(uname,upwd);
  pool.query(
    "select * from cs_user where uname=? and upwd=?",
    [uname,upwd],
    (err,result)=>{
      if(err) console.log(err);
      if(result.length>0){
        res.writeHead(200);
        var user=result[0]
        res.write(JSON.stringify({
          ok:1,
          res:user
        }))
      }else{
        res.write(JSON.stringify({
          ok:0,
          msg:"has error about your name or password!"
        }))
      }
      res.end();
    }
  )
})

router.get("/islogin",(req,res)=>{
  res.writeHead(200);
  
    var uid=req.query.uid
    //console.log(uid)
    var sql="select * from cs_user where uid=?";
    pool.query(sql,[uid],(err,result)=>{
      if(err) console.log(err);
      //console.log(result)
      var user=result[0];
      res.write(JSON.stringify({ok:1,uname:user.uname}));
      res.end() 
    })
})

router.get("/signout",(req,res)=>{
  req.session.uid=undefined;
  res.end();
})

router.post("/reg",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var phone=req.body.phone;
  //console.log(uname,upwd,phone)
  var sql="select * from tcc_user where uname=?"
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      pool.query(
        `insert into tcc_user values(null,?,?,?)`,
        [uname,upwd,phone],
        (err,result)=>{
          if(err) throw err;
          res.writeHead(200)
          res.write(JSON.stringify({code:1,msg:"注册成功"}))
          res.end()
        })
    }else{
      res.writeHead(200)
      res.write(JSON.stringify({code:0,msg:"用户已存在"}))
      res.end()
    }
  })
})

//测试：
//http://localhost:3000/users/islogin ok:0
//.../users/signin?uname=dingding&upwd=123456 ok:1
//.../users/islogin ok:1
//.../users/signout
//.../users/islogin ok:0

module.exports=router;