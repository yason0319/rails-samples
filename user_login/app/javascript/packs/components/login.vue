<template>
<div>
  <p>test login page</p>
  <router-link to="/Top">to Top page</router-link>
  <h4>user name</h4>
  <input v-model="user_name" type="text">
  <h4>pass word</h4>
  <input v-model="passwd" type="password">
  <button v-on:click="checkUser()">submit!</button>
</div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function() {
      return {
        user_name: "",
        passwd: ""
      }
    },
    created: function() {
      // ログイン画面遷移時は、強制的にCookieクリア
      document.cookie = 'name=';
      document.cookie = 'pass=';
    },
    methods: {
      // 入力されたユーザー情報を送り、照合を行い、結果を返す
      // とりあえず、取得済みのユーザー一覧と照合する
      checkUser: function() {
        const data = { name: this.user_name, pass: this.passwd };
        axios.post('/api/users/check', data)
        .then((response) => {
          console.log(response.data);
          if( response.data.result == "OK" ) {
            this.toTopPage();
          } else {
            alert(response.data.result);
          }
        }, (error) => {
          console.log(error);
        });
      },
      toTopPage: function() {
        document.cookie = 'name=' + encodeURIComponent(this.user_name);
        document.cookie = 'pass=' + encodeURIComponent(this.passwd);
        if( this.user_name == 'admin' ) {
          this.$router.push({ path: '/AdTop'});
        } else {
          this.$router.push({ path: "/Top"});
        }
      },
    },
  }

</script>