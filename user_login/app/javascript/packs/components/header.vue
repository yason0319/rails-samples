<template>
  <div>
    <ul id="dropdown" class="dropdown-content">
      <li><router-link to="/">Login</router-link></li>
      <li><router-link to="/New">New</router-link></li>
      <li><router-link to="/Search">Search books</router-link></li>
      <!-- <li><router-link to="/contact">Contact</router-link></li> -->
    </ul>
    <nav>
      <div class="nav-wrapper container">
        <router-link to="/" class="brand-logo left">Sample User Login Application</router-link>
        <ul class="right hide-on-med-and-down">
          <li><router-link to="/">Login</router-link></li>
          <li><router-link to="/New">New</router-link></li>
          <li><router-link to="/Search">Search books</router-link></li>
          <!-- <li><router-link to="/contact">Contact</router-link></li> -->
        </ul>
        <ul class="right hide-on-large-only">
          <li>
            <a class="dropdown-button" href="#!" data-activates="dropdown">
              Menu<i class="material-icons right">arrow_drop_down</i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function() {
      return {

      }
    },
    methods: {

    }
  }
</script>