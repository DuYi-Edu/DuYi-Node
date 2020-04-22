login.onclick = function () {
  fetch("/api/admin/login", {
    method: "post",
    headers: {
      "content-type": "application/json",
    },
    body: JSON.stringify({
      loginId: "abc",
      loginPwd: "123123",
    }),
  })
    .then((resp) => resp.json())
    .then((resp) => {
      console.log(resp);
    });
};

updateStu.onclick = function () {
  fetch("/api/student/1201", {
    method: "PUT",
    headers: {
      "content-type": "application/json",
    },
    body: JSON.stringify({
      name: "123",
    }),
  })
    .then((resp) => resp.json())
    .then((resp) => {
      console.log(resp);
    });
};
