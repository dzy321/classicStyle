var vm;
$(function(){
    $("<link rel='stylesheet' href='css/header.css'>").appendTo("head")
    $("<link rel='stylesheet' href='css/animate.min.css'>").appendTo("#header")
    $.ajax({
        url:"http://localhost:8080/header.html",
        type:"get",
        success:function(res){
            //获取header组件
            $("#header").replaceWith(res);
            vm=new Vue({
                el:"#header",
                data:{
                   // kword:"",
                    islogin:false,
                    uname:""
                },
                mounted(){
                    var uid = sessionStorage.getItem("uid")
                    if(uid){
                        $.ajax({
                            url:"users/islogin?uid="+uid,
                            dataType:"json",  //不写的话res的结果是字符串
                            success:(res)=>{
                                this.uname = res.uname
                                this.islogin = true;
                            }
                        })
                    }
                },
                computed:{
                     signin(){
                         return `login.html?back=${location.href}`
                     }
                },
                methods:{
                    signout(){
                        $.ajax({
                            url:"http://localhost:8080/users/signout",
                            type:"get",
                            success:()=>{
                                this.islogin=false;
                                sessionStorage.clear()
                            }
                        })
                    },
                    toListWoman(){
                        location.href="products.html?fid=1"
                    },
                    toListMen(){
                        location.href="products.html?fid=2"
                    },
                    jumpCart(){
                        var uid = sessionStorage.getItem("uid")
                        if(uid){
                            location.href="checkout.html";
                        }else{
                            confirm("please signin first!")
                            location.href="login.html"
                        }
                        
                    }
                }
            })
        }
    })
})