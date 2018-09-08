<template>
  <div>
    <h4>User List</h4>
    <table class="user_table">
      <tr>
        <th>No.</th>
        <th>name</th>
        <th>pass</th>
        <th>email</th>
        <th>delete user</th>
      </tr>
      <tr v-for="(user, index) in users">
        <th>{{ index }}</th>
        <th>{{ user.name }}</th>
        <th>{{ user.passwd }}</th>
        <th>{{ user.email }}</th>
        <th><button v-if="user.id != 1" v-on:click="deleteUser(user.id)">Delete</button></th>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      users: [],
    }
  },
  created: function() {
    this.getUsers();
  },
  methods: {
    getUsers: function() {
      axios.get('/api/users')
      .then((response) => {
        console.log(response.data);
        this.users = response.data.users;
        console.log('users : ' + this.users[0]);
      }, (error) => {
        console.log(error);
      });
    },
    deleteUser: function(id) {
      console.log("id : " + id);
      var url = "/api/users/" + id;
      axios.delete(url)
      .then((response) => {
        console.log(response.data);
        this.getUsers();
      }, (error) => {
        console.log(error);
      });
    },
  }
}
</script>

<style scoped>
.user_table th, .user_table td {
  border: solid 1px;
}
</style>