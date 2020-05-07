const page = (function () {
  const userList = $(".users");
  const chatList = $(".chat-list");
  function intoChatRoom() {
    $(".login").hide();
    $(".chat").show();
  }

  function addUser(userName) {
    $("<li>").text(userName).attr("user", userName).appendTo(userList);
    const number = +$(".user-list .title span").text();
    $(".user-list .title span").text(number + 1);
    addLog(`<span class="user">${userName}</span> 进入聊天室`);
    chatList.scrollTop(chatList.prop("scrollHeight"), 0);
  }

  function addLog(log) {
    $("<li>").addClass("log").html(log).appendTo(chatList);
  }

  function removeUser(userName) {
    const li = userList.find(`li[user="${userName}"`);
    if (!li.length) {
      return;
    }
    li.remove();
    const number = +$(".user-list .title span").text();
    $(".user-list .title span").text(number - 1);
    addLog(`<span class="user">${userName}</span> 退出了聊天室`);
  }

  function clearInput() {
    $(".sendmsg input").val("");
  }

  function addMsg(from, msg, to) {
    const li = $("<li>")
      .html(`<span class="user">${from}</span> <span class="gray">对</span> 
    <span class="user">${
      to ? to : "所有人"
    }</span> <span class="gray">说：</span> `);
    const msgSpan = $("<span>").text(msg);
    li.append(msgSpan).appendTo(chatList);
    chatList.scrollTop(chatList.prop("scrollHeight"), 0);
  }

  function getTargetUser() {
    const user = $(".sendmsg .user").text();
    return user === "所有人" ? null : user;
  }

  function initChatRoom() {
    userList.html(`<li class="all">所有人</li>`);
    $(".user-list .title span").text(0);
    chatList.html(`<li class="log">欢迎来到渡一聊天室</li>`);
  }

  userList.click((e) => {
    if (e.target.tagName === "LI") {
      $(".sendmsg .user").text(e.target.innerText);
    }
  });

  return {
    me: null,
    intoChatRoom,
    initChatRoom,
    addUser,
    addLog,
    removeUser,
    addMsg,
    clearInput,
    getTargetUser,
    onLogin: null,
    onSendMsg: null,
  };
})();

(function () {
  $(".login input").keydown((e) => {
    if (e.key === "Enter") {
      page.me = $(e.target).val();
      page.onLogin && page.onLogin(page.me);
    }
  });
  $(".sendmsg input").keydown((e) => {
    if (e.key === "Enter") {
      page.onSendMsg &&
        page.onSendMsg(page.me, $(e.target).val(), page.getTargetUser());
    }
  });
})();
