const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.get("/",(req,res)=>{
  var cid=req.query.cid;
  //console.log(cid);
  var output={details:{},products:[],fname:""};
  var sql1="SELECT * FROM cs_cloth where cid=?";
  var sql2="select * from cs_cloth where fid=(select fid from cs_cloth where cid=?)"
  var sql3="select fname from cs_cloth_family where fid=(select fid from cs_cloth where cid=?)"
  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[cid],(err,result)=>{
        if(err) throw err;
        //console.log(result[0])
        output.details=result[0]
        open();
        
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[cid],(err,result)=>{
        if(err) throw err;
        //console.log(result)
        output.products=result;
        open();
      })
    }),
    new Promise(function(open){
      pool.query(sql3,[cid],(err,result)=>{
        if(err) throw err;
        //console.log(result)
        output.fname=result[0].fname;
        open()
      })
    })
  ]).then(()=>{
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output));
    res.end();
    //console.log("响应完成!");
  })

  
})

module.exports=router;