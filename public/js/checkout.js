new Vue({
    el:"#app-cart",
    data:{
        uid:0,
        list:[],
        isSelectedAll:false,
        checkBox:[]
    },
    methods:{
        //点击+修改商品数量
        add(cid){
            for(var item of this.list){
                if(item.cid==cid){
                    item.count++
                    $.ajax({
                        url:`cart/update?iid=${item.iid}&count=${item.count}`,
                        success:(res)=>{
                           // console.log(res)
                        }
                    })
                    break;    
                }
               
            }
        },
        //点击-修改商品数量
        sub(cid){
            for(var item of this.list){
                if(item.cid==cid){
                    if(item.count>=2){
                        item.count--
                        $.ajax({
                            url:`cart/update?iid=${item.iid}&count=${item.count}`,
                            success:(res)=>{
                               // console.log(res)
                            }
                        })
                    }
                    break;    
                }
               
            }
        },
        //点击x删除商品
        del(cid){
            for(var i=0;i<this.list.length;i++){
                if(this.list[i].cid==cid){
                    confirm("Do you want to delete it?")
                    $.ajax({
                        url:`cart/update?iid=${this.list[i].iid}&count=0`,
                        success:(res)=>{
                           // console.log(res)
                        }
                    })   
                    this.list.splice(i,1) 
                    break;  
                }
                
            }
        },
        selectOne(){
            //console.log("change")
            var res = true
            for(var i=0;i<this.list.length;i++){
                res = res && this.list[i].isSelected
            }
            this.isSelectedAll = res
        },
        selectAll(){
            for(var i=0;i<this.list.length;i++){
                this.list[i].isSelected = this.isSelectedAll
            }
        }
    },
    mounted(){
        this.uid = sessionStorage.getItem("uid")
        if(!this.uid){
            confirm("please signin first!")
            location.href="login.html"
        }else{
            $.ajax({
                url:"cart/items?uid="+this.uid,
                dataType:"json",
                success:(res)=>{
                    //console.log(res)
                    this.list = res
                    for(var i=0;i<this.list.length;i++){
                        this.list[i].isSelected = false
                    }
                    console.log(this.list)
                }
            })
        }
    },
    computed:{
        sum(){
            let sum = 0
            for(var i=0;i<this.list.length;i++ ){
                sum +=this.list[i].count*this.list[i].price
            }
            return sum
        },

    }
})
    



