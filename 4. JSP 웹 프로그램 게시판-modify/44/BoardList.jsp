<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//전체 게시글의 내용을 jsp쪽으로 가져와야함
	BoardDAO bdao = new BoardDAO();

	//최신글 10개를 기준으로  게시글을 리턴 받아주는 메소드 호출
	Vector<BoardBean> vec = bdao.getAllBoard();
	%>
	<center>
		<h2>전체 게시글 보기</h2>

		<table width="600" border="1" bgcolor="skyblue">


		</table>
	</center>

</body>
</html>


