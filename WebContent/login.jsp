<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath(); 
    String basePath = request.getScheme()+"://"+request.getServerName()
    +":"+request.getServerPort()+path+"/";
%>
<head>
<base href=" <%=basePath%>">
 <title>登录</title>
  <link rel="stylesheet" href="../assets/css/amazeui.css" />
  <link rel="stylesheet" href="../assets/css/other.min.css" />
</head>
<body class="login-container">
  <div class="login-box">
    <div class="logo-img">
      <img src="../assets/images/logo2_03.png" alt="" />
    </div>
    <form action="" class="am-form" data-am-validator>
      <div class="am-form-group">
        <label for="doc-vld-name-2"><i class="am-icon-user"></i></label>
        <input type="text" id="doc-vld-name-2" minlength="3" placeholder="输入用户名（至少 3 个字符）" required/>
      </div>

      <div class="am-form-group">
        <label for="doc-vld-email-2"><i class="am-icon-key"></i></label>
        <input type="email" id="doc-vld-email-2" placeholder="输入邮箱" required/>
      </div>
      <button class="am-btn am-btn-secondary"  type="submit">登录</button>
    </form>
  </div>
</body>
</html>