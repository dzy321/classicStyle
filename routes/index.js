const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.get("/indexPro",(req,res)=>{
  var output=[]
  var sql1="SELECT * FROM cs_cloth where fid=1"
  var sql2="SELECT * FROM cs_cloth where fid=2"

  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[],(err,result)=>{
        if(err) throw err;
        output[0]=result;
        open()
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[],(err,result)=>{
        if(err) throw err;
        output[1]=result;
        open()
      })
    })
  ]).then(function(){
    //console.log(output)

    res.writeHead(200,{
    "Content-Type":"application/json;charset=utf-8",
    "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output));
    res.end();
    
  })
})
module.exports=router;