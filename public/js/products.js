var vm = new Vue({
    el:"#product-list",
    data(){
        return {
            fid:1,
            list:[],
        }
    },
    methods:{
        toDetails(id){
            location.href="single.html?cid="+id
        }
    },
    mounted(){
        if(location.search.indexOf("?fid")!=-1){
            this.fid = decodeURI(location.search.split("=")[1])
            //console.log(this.fid)
        }
        $.ajax({
            url:"http://127.0.0.1:8080/products?fid="+this.fid,
            success:(res)=>{
                this.list=res
            }
        })
    },
})