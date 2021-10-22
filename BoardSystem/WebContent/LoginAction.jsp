<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class ="user.User" scope="page" />
<jsp:setProperty name="user" property ="userId" />
<jsp:setProperty name="user" property ="userPassword" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<title>JSP 게시판 웹사이트</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserId(), user.getUserPassword());
		if(result == 1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if(result == 0)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	 %>
	 
</body>
</html>