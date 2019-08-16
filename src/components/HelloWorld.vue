<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
	<router-link to="Task">Task</router-link>
	<router-link to="Action">Action</router-link>
	<router-link to="DropDown">DropDown</router-link>
	<router-link to="TablePage">TablePage</router-link>
    <form>
      <input type="text" name="username" v-model="userName" />
      <br />
      <input type="text" name="password" v-model="password" />
      <br />
      <a href="javascript:;" @click="addUser">提交</a>
    </form>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      msg: "Welcome to App",
      userName: "",
      password: ""
    };
  },
  methods: {
    addUser() {
      var username = this.userName;
      var password = this.password;
      this.axios
        .post(
          "/api/user/addUser",
          {
            username: username,
            password: password
          },
          {}
        )
        .then(response => {
          console.log(response);
        });
    },

    register(){
            if(this.newUsername == "" || this.newage == ""){
                alert("请输入用户名或密码")
            }else{
                let data = {'username':this.newUsername,'age':this.newage}
                this.axios.post('/api/user/addUser',data).then((res)=>{
                    console.log(res)
                    /*接口的传值是(-1,该用户已存在)*/
                    if(res.data == -1) {
                        this.tishi = "该账号已存在"
                        this.showTishi = true
                        this.username = ''
                        this.age = ''
                    }
                    else if(res.status == 200){
                        this.tishi = "注册成功"
                        this.showTishi = true
                        this.username = ''
                        this.age = ''
                         /*注册成功之后再跳回登录页*/
                        setTimeout(function(){
                            this.showRegister = false
                            this.showLogin = true
                            this.showTishi = false
                        }.bind(this),2000)
                    }
                })
            }
        }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
