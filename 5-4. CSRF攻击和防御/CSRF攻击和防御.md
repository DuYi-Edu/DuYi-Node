# CSRF 特点和原理

CSRF：Cross Site Request Forgery，跨站请求伪造

本质是：恶意网站把**正常用户**作为**媒介**，通过模拟正常用户的操作，攻击其**登录过**的站点。

<img src="http://mdrs.yuanjin.tech/img/image-20200508122744169.png" alt="image-20200508122744169" style="zoom:50%;" />

它的原理如下：

1. 用户访问正常站点，登录后，获取到了正常站点的令牌，以cookie的形式保存

<img src="http://mdrs.yuanjin.tech/img/image-20200508123116104.png" alt="image-20200508123116104" style="zoom:50%;" />

2. 用户访问恶意站点，恶意站点通过某种形式去请求了正常站点（请求伪造），迫使正常用户把令牌传递到正常站点，完成攻击

<img src="http://mdrs.yuanjin.tech/img/image-20200508123401591.png" alt="image-20200508123401591" style="zoom:50%;" />

# 防御

## cookie的SameSite

现在很多浏览器都支持**禁止跨域附带的cookie**，只需要把cookie设置的`SameSite`设置为`Strict`即可

`SameSite`有以下取值：

- Strict：严格，所有跨站请求都不附带cookie，有时会导致用户体验不好
- Lax：宽松，所有跨站的超链接、GET请求的表单、预加载连接时会发送cookie，其他情况不发送
- None：无限制

这种方法非常简单，极其有效，但前提条件是：用户不能使用太旧的浏览器

## 验证referer和Origin

页面中的二次请求都会附带referer或Origin请求头，向服务器表示该请求来自于哪个源或页面，服务器可以通过这个头进行验证

但某些浏览器的referer是可以被用户禁止的，尽管这种情况极少

## 使用非cookie令牌

这种做法是要求每次请求需要在请求体或请求头中附带token



请求的时候：authorization: token



## 验证码

这种做法是要求每个要防止CSRF的请求都必须要附带验证码

不好的地方是容易把正常的用户逼疯

## 表单随机数

这种做法是服务端渲染时，生成一个随机数，客户端提交时要提交这个随机数，然后服务器端进行对比

该随机数是一次性的



流程：

1. 客户端请求服务器，请求添加学生的页面，传递cookie
2. 服务器
   1. 生成一个随机数，放到session中
   2. 生成页面时，表单中加入一个隐藏的表单域`<input type="hidden" name="hash" value="<%=session['key'] %>">`
3. 填写好信息后，提交表单，会自动提交隐藏的随机数
4. 服务器
   1. 先拿到cookie，判断是否登录过
   2. 对比提交过来的随机数和之前的随机数是否一致
   3. 清除掉session中的随机数



## 二次验证

当做出敏感操作时，进行二次验证