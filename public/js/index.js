var vm = new Vue({
    el:"#app-index",
    data:{
        list1:[],
        list2:[]
    },
    mounted(){
        $.ajax({
            url:"http://localhost:8080/index/indexPro",
            success:(res)=>{
                this.list1 = res[0].splice(0,3)
                this.list2 = res[1].splice(0,3)
               // console.log(this.list1)
               // console.log(this.list2)





                $(window).load(function() {
                    $("#flexiselDemo").flexisel({
                        visibleItems: 1,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 5000,    		
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: { 
                            portrait: { 
                                changePoint:480,
                                visibleItems: 1
                            }, 
                            landscape: { 
                                changePoint:640,
                                visibleItems: 1
                            },
                            tablet: { 
                                changePoint:768,
                                visibleItems: 1
                            }
                        }
                    });
                    
                });
                $(window).load(function() {
                    $("#owl-demo").flexisel({
                        visibleItems: 2,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,    		
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: { 
                            portrait: { 
                                changePoint:480,
                                visibleItems: 1
                            }, 
                            landscape: { 
                                changePoint:640,
                                visibleItems: 1
                            },
                            tablet: { 
                                changePoint:768,
                                visibleItems: 1
                            }
                        }
                    });
                    
                });

                  //动画时间设置
                wow=new WOW({
                    animateClass:"animated"
                });
                wow.init();
            }
        })
    }
})