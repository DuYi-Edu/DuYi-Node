import Vue from 'vue'
import Vuex from 'vuex'
import loginUser from "./loginUser"

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    loginUser
  }
})
