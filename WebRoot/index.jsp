<%@ page import="com.xhao.util.DataDownUtil"%>
<%@ page language="java" import="java.util.*,com.xhao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/bootstrap-theme.css" />
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
 
  <link rel="stylesheet" href="css/animate.min.css" type="text/css"></link></head>
  
  <body>
  <%
  	String url = request.getParameter("url");
  	List<HashMap<String,String>> list = DataDownUtil.getJobInfo(url,"UTF-8");
   
   
   %>
   <h1 style="font-family:'微软雅黑';text-align:center">智联招聘职位抓取</h1>
  <form action="index.jsp">
  	<div style="width: 540px;
    height: 37px;
    margin: 6px auto;" class="animated  zoomIn">
  		<span style="text-align:center;font-family:'微软雅黑';font-size:16px">请输入智联招聘的URL：</span><input type="text" name="url" style="height: 34px;width: 280px;border: 2px solid #06f;"/><input type="submit" value="提交" style="width:60px;height:34px;margin-left:6px;background:#06f;color:#fff;border:0"/>
  	</div>
  	
  </form>
  <table class="table table-striped table-bordered table-hover">
	<thead>
		<tr>
			
		</tr>
	</thead>
	<%
		for(HashMap<String,String> map:list){
	 %>
	<tr class="animated bounceInRight">
	
		<td><%=map.get("jobName") %></td>
		<td><%=map.get("textTitle") %></td>
		<td><%=map.get("money") %></td>
		<td><%=map.get("address") %></td>
		<td><%=map.get("fadate") %></td>
	</tr>
	<%
		}
	 %>
  </table>
    
  </body>
</html>
