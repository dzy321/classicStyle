new Vue({
    el:"#details-app",
    data(){
        return{
            cid:0,
            details:{},
            list:[],
            num:1
        }
    },
    methods:{
        addNum(){
            if(this.num<99){
                this.num++
            }
        },
        supNum(){
            if(this.num>=2){
                this.num--
            }
        },
        addToCart(){
            //需要准备cid uid count
            var uid = sessionStorage.getItem("uid")
            if(uid){
                $.ajax({
                    url:"cart/add?cid="+this.cid+"&uid="+this.uid+"&count="+this.num,
                    success:(res)=>{
                       // console.log(res)
                    }
                })
            }else{
                confirm("please signin first!")
                location.href="login.html?back="+location
            }
            
        }
    },
    mounted(){
        if(location.search.indexOf("cid")!=-1){
            this.cid = decodeURI(location.search.split("=")[1])
            //console.log(this.cid)
        }
        $.ajax({
            url:"http://127.0.0.1:8080/details?cid="+this.cid,
            success:(res)=>{
                this.details = res.details
                this.list = res.products
                var length = res.products.length-2
                var i = Math.floor(Math.random()*length)
                //console.log(i)
                this.list = this.list.splice(i,3)
               
                //样式部分
                $(function(){
                    //小图片点击转换为大图片
                    var $lg=$(".lg-pic")
                    $("ul.smallPic").on("mouseenter","li>img",function(){
                        var $smImg=$(this);
                        var smImgUrl=$smImg.attr("src")
                        var bgImg=$("div.bigPic").children().children();
                        $lg.css({"background-image":`url(${smImgUrl})`})
                        bgImg.attr("src",smImgUrl);
                    })
                
                    //点击右边的折叠栏展开对应的文字内容
                    $("ul.tabs").on("click","li>a",function(e){
                        e.preventDefault();
                        var $a=$(this);
                        var id=$a.attr("data-target");
                        //console.log(id);
                        $(id).css("display","block");
                        $(id).siblings().css("display","none");
                    })
                    //放大镜效果
                    var $mask=$(".mask")
                    var $smask=$(".sup-mask")
                    //var $lg=$(".lg-pic")
                    var maxWidth=145;
                    var maxHeight=180;
                    $mask.hover(function(){
                        $smask.toggleClass("d-none")
                        $lg.toggleClass("d-none")
                    }).mousemove(function(e){
                        var top = e.offsetY-180/2;
                        var left = e.offsetX-145/2;
                        if(top<0){
                            top=0
                        }else if(top>maxHeight){
                            top=maxHeight
                        }
                        if(left<0){
                            left = 0
                        }else if(left>maxWidth){
                            left = maxWidth
                        }
                        $smask.css({left:left,top:top})
                        $lg.css({
                            "background-position":`-${2*left}px -${2*top}px` 
                        })
                    })
                    
                })
            }
        })
        
    }
})