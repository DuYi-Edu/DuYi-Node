<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/protect">Protect</router-link> |
      <a v-if="isLoading">Loading...</a>
      <template v-else-if="data">
        <a>{{ data.loginId }}</a>
        <button @click="loginOut">注销</button>
      </template>
      <router-link v-else to="/login">Login</router-link>
    </div>
    <router-view />
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: mapState("loginUser", ["data", "isLoading"]),
  methods: {
    loginOut() {
      this.$store.dispatch("loginUser/loginOut");
      this.$router.push("/login");
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
