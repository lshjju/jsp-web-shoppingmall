<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<h2> 세션 로그인 처리 1 </h2>
	
	<% 
		request.setCharacterEncoding("UTF-8");
		
		//사용자로 부터 데이터를 읽어드림 
		String id= request.getParameter("id");	
		String pass = request.getParameter("pass");
		
		//아이디와 패스워드를 저장 
		session.setAttribute("id",id);
		session.setAttribute("pass",pass);
		
		//세션 유지 시간 설정 
		session.setMaxInactiveInterval(60*2);//2분간 아이디 유지
		response.sendRedirect("SessionMain.jsp");
	%>
	
	
</center>

</body>
</html>