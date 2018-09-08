<template>
<div>
  <a>top page desu</a>
  <h4>{{ now_user }}</h4>
  <h4>{{ now_pass }}</h4>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      now_user: 'test',
      now_pass: null,
    }
  },
  created: function() {
    this.getCookie();
  },
  methods: {
    getCookie: function() {
      var nowUser;
      var nowPass;
      var r = document.cookie.split('; ');
      r.forEach(function(value) {
        //cookie名と値に分ける
        var content = value.split('=');
        if( content[0] == 'name' ) {
          nowUser = content[1];
          console.log("name : " + content[1]);
        } else if( content[0] == 'pass' ) {
          nowPass = content[1];
          console.log('pass : ' + content[1]);
        }
      })
      this.now_user = nowUser;
      this.now_pass = nowPass;
    },
  },
}
</script>