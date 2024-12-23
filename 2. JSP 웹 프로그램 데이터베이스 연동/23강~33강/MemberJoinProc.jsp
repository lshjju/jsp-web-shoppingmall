<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Member.MemberBeanDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");	
	
		//취미 부분은 별도로 읽어드려 다시 빈클래스에 저장 
		String [] hobby = request.getParameterValues("hobby");
		
		//배열에 있는 내용알을 하나의 스트링으로 저장 
		String texthobby="";
		
		for(int i = 0 ;i < hobby.length; i++){
			texthobby += hobby[i]+" ";
		}
	%>
	
	<!--useBean을 이용하여 한꺼번에 데이터를 받아옴  -->
	<jsp:useBean id = "mbean" class= "Member.MemberBean">
		<jsp:setProperty name="mbean" property="*" /><!--맵핑 시키시오  -->
	</jsp:useBean>

	<% 
	    mbean.setHobby(texthobby);
	
		//데이터 베이스 클래스 객체 생성
		MemberBeanDAO mbao = new MemberBeanDAO();
		mbao.insertMember(mbean);
		
		//회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동시킴 
		response.sendRedirect("MemberList.jsp");
	%>


	
</body>
</html>
