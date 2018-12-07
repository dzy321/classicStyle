const express=require("express")
const router=express.Router()
const pool=require("../pool")

//测试地址: http://localhost:8080/products?fid=1
router.get("/",(req,res)=>{
           //bodyParser:url.parse(req.url,true)
  var fid=req.query.fid;
  var sql="select * from cs_cloth where fid=?";
  pool.query(sql,[fid],(err,result)=>{
    if(err) console.log(err);
    //console.log(result)
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(result))
    res.end()
  })
})

module.exports=router;