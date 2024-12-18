<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="db.RentCarDAO"%>
<%@ page import="db.CarListBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		//회원 아이디와 패스워드가 일치하는지 비교
		RentCarDAO rdao = new RentCarDAO();
		
		//해당 회원이 있는지 여부를 숫자로 표현
		int result = rdao.getMember(id,pass);
		
		if(result==0){
	%>	
		<script>
			alert("회원 아이디 또는 패스워드가 틀립니다.");
			location.href="RentcarMain.jsp?center=MemberLogin.jsp";
		</script>	
	<% 	
		}else{
			//로그인 처리가 되었다면 
			session.setAttribute("id",id);
			response.sendRedirect("RentcarMain.jsp");	
		}
	%>
</body>
</html>