new Vue({
    el:"#container",
    data:{
        uname:"dingding",
        upwd:"123456",
    },
    methods:{
        signin(){
            (async ()=>{
                var res=await axios.post(
                    "http://127.0.0.1:8080/users/signin",
                    Qs.stringify({uname:this.uname,upwd:this.upwd})
                )
                res = res.data;
                console.log(res)
                if(res.ok==1){
                    sessionStorage.setItem("uid",res.res.uid)
                    alert("login success,back to previous page!")
                    if(location.search.startsWith("?back=")){
                        var url=location.search.slice(6) 
                    }else{
                        var url="index.html"
                    }
                    location.href=url;
                    
                }else{
                    //sessionStorage.setItem("uid",null)
                    alert("login unsuccessfully!")
                }
                
            })()
        
        }
    }
})