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

			<tr height="40">
				<td width="50" align="center">번호</td>
				<td width="320" align="center">제목</td>
				<td width="100" align="center">작성자</td>
				<td width="150" align="center">작성일</td>
				<td width="80" align="center">조회수</td>
			</tr>

			<%
			for (int i = 0; i < vec.size(); i++) {
				BoardBean bean = vec.get(i);// 벡터에 저장되어있는 빈 클래스 하나씩 추출
			%>
			<tr height="40">
				<td width="50" align="center"><%=i + 1%></td>
				<td width="320" align="left"><a
					href="BoardInfo.jsp?num=<%=bean.getNum()%>" style ="text-decoration:none;"> <%
 if (bean.getRe_step() > 1) {
 	for (int j = 0; j < (bean.getRe_step() - 1) * 5; j++) {
 %>&nbsp; <%
 }
 }
 %> <%=bean.getSubject()%></a></td>
				<td width="100" align="center"><%=bean.getWriter()%></td>
				<td width="150" align="center"><%=bean.getReg_date()%></td>
				<td width="80" align="center"><%=bean.getReadcount()%></td>
			</tr>
			<%
			}
			%>
			<tr height="40">
				<td align="center" colspan="5"><input type="button" value="글쓰기"
					onclick="location.href='BoardWriteForm.jsp'"></td>
			</tr>


		</table>
	</center>

</body>
</html>


