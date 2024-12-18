<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="db.RentCarDAO"%>
<%@page import="db.CarViewBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<%
		String id = request.getParameter("id");
		String rday = request.getParameter("rday");
		
		RentCarDAO rdao =new RentCarDAO();
		
		//예약 삭제 메소드 호출 
		rdao.carRemoveReserve(id, rday);
		 
		response.sendRedirect("RentcarMain.jsp");
	%>

</body>
</html>