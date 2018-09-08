<template>
<div>
  <h2>New user registration</h2>
  <h4>user name</h4>
  <input v-model="user_name" type="text">
  <h4>password</h4>
  <input v-model="passwd" type="password">
  <h4>rewrite password</h4>
  <input v-model="rw_passwd" type="password">
  <h4>email</h4>
  <input v-model="email" type="text">
  <button v-on:click="checkUser()">submit!</button>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      user_name: '',
      passwd:  '',
      rw_passwd: '',
      email: '',
    }
  },
  methods: {
    // 登録しようとしているユーザー名をチェックし、被りがなければ登録する
    checkUser: function() {
      if( this.user_name == '' || this.passwd == '' || this.rw_passwd == '' ) {
        alert('fill in name and password!');
      } else if( this.passwd != this.rw_passwd ) {
        alert('password mismatch');
      } else if( this.passwd == this.rw_passwd ) {
        const data = { name: this.user_name, passwd: this.passwd, email: this.email };
        axios.post('/api/users/reg', data)
        .then((response) => {
          console.log(response.data);
        }, (error) => {
          console.log(error);
        });
      }
    }
  }
}
</script>