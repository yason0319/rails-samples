<template>
  <div>
    <h4>search</h4>
    <input v-model="author" type="text" value="東野圭吾">
    <button v-on:click="searchBooks()">search!</button>
    <button v-on:click="searchResult()">get!</button>
    <table class="user_table">
      <tr v-for="(book, index) in books">
        <th>{{ book.volumeInfo.title }}</th>
        <th>
          <div class="img_cell">
            <img :src="book.volumeInfo.imageLinks.smallThumbnail">
          </div>
        </th>
      </tr>
    </table>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function() {
      return {
        author: '',
        books: []
      }
    },
    methods: {
      searchBooks: function() {
        var baseurl = 'https://www.googleapis.com/books/v1/volumes?q=';
        var searchurl = baseurl + this.author;
        console.log('url : ' + searchurl);
        axios.get(searchurl)
        .then((response) => {
          this.books = response.data.items;
          this.searchResult();
        }, (error) => {
          console.log(error);
        });
      },
      searchResult: function() {
        for( var i=0; i<10; i++ ) {
          console.log(this.books[i].volumeInfo.title);
          console.log(this.books[i].volumeInfo.imageLinks.smallThumbnail);
        }
      }
    }
  }
</script>

<style scoped>
.img_cell {
  height: 100px;
  width: 100px;
}
img {
  width: auto;
  max-height: 100px;
}
</style>