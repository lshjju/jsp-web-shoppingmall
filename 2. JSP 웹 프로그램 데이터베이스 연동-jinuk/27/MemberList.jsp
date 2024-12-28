<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 1. 데이터 베이스에서 모든 회원의 정보를 가져옴  2.table 태크를 이용하여 화면에 회원들의 정보를 출력 -->
	<%
	MemberDAO mdao = new MemberDAO();
	mdao.allSelectMember();
	//회원들의 정보가 얼마나 저장 되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
	//폴리 모피즘 다형성 트리 구조 하위구조 부모 자식 관계 
	Vector<MemberBean> vec = mdao.allSelectMember();
	%>


</body>
</html>