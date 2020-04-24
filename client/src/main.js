import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
store.dispatch("loginUser/whoAmI"); //在网站被访问时，需要用token去换取用户的身份

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
