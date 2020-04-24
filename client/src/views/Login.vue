<template>
  <div>
    <p>
      账号：<input type="text" v-model="loginId" autocomplete="new-password" />
    </p>
    <p>
      密码：<input
        type="password"
        v-model="loginPwd"
        autocomplete="new-password"
      />
    </p>
    <p>
      <button @click="handleClick">登录</button>
    </p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loginId: "",
      loginPwd: "",
    };
  },
  methods: {
    async handleClick() {
      const user = await this.$store.dispatch("loginUser/login", {
        loginId: this.loginId,
        loginPwd: this.loginPwd,
      });
      if (user) {
        //成功
        this.$router.push("/");
      } else {
        alert("账号密码错误");
      }
    },
  },
};
</script>

<style></style>
