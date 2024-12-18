<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 세션을 이용한 로그인 처리  -->
	<% 

		String id = (String)session.getAttribute("id");

		//로그인이 되어있지 않다면 
		if(id==null){
			id="GUEST";
		}
	%>

		<table width='1000' bordercolor="white">
				<tr height = "70">
					<td colspan ="4"> 
						<a href="RentcarMain.jsp" style="text-decoration:none">
							<img alt ="" src="images/RENT.png" height="65">
						</a>
					</td>
					
					<td align="center" width="200">
						<%=id %> 님 반갑습니다.
	<% 
						if(id.equals("GUEST")){
	%>
						<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>
	<% 
						}else{
	%>	
						<button onclick="location.href='RentcarMain.jsp?center=MemberLogout.jsp'">로그 아웃</button>
	<% 						
						}
						
	%>
					</td>
				</tr>
				
				<tr height = "50">
					<td align="center" width="200" bgcolor="pink">
						<font color="white" size="5">
							<a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none">예약 하기</a>
						</font>
					</td>
					
					<td align="center" width="200" bgcolor="pink">
						<font color="white" size="5">
							<a href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration:none">예약 확인</a>
						</font>
					</td>
					
					<td align="center" width="200" bgcolor="pink">
						<font color="white" size="5">
							<a href="#" style="text-decoration:none">자유 게시판</a>
						</font>
					</td>
					
					<td align="center" width="200" bgcolor="pink">
						<font color="white" size="5">
							<a href="#" style="text-decoration:none">이벤트</a>
						</font>
					</td>
					
					<td align="center" width="200" bgcolor="pink">
						<font color="white" size="4">
							<a href="#" style="text-decoration:none">고객 센터</a>
						</font>
					</td>
				</tr>
		</table>
</body>
</html>