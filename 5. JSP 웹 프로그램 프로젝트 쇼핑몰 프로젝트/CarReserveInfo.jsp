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
		int no = Integer.parseInt(request.getParameter("no"));
	
		//데이터 베이스에 접근
		RentCarDAO rdao  = new RentCarDAO();
		
		//렌트카 하나에 대한 정보를 얻어옴 
		CarListBean bean = rdao.getOneCar(no);

		
		int Category = bean.getCategory();
		String temp ="";
		if(Category ==1)temp="소형";
		else if(Category ==2)temp="중형";
		else if(Category ==3)temp="대형";
	%>
	
<center>
	<form action = "RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName() %> 차량 선택</font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="6" width="500">
					<img alt = "" src="images/<%=bean.getImg()%>" width="450">	
				</td>
				<td width="250" align="center">차량이름</td>
				<td width="250" align="center"><%=bean.getName()%></td>
			</tr>	
				
			<tr>
				<td width="250" align="center">차량 수량</td>
				<td width="250" align="center">
					<select name="qty">
						<option value ="1">1</option>
						<option value ="2">2</option>
						<option value ="3">3</option>
					</select>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">차량 분류</td>
				<td width="250" align="center"><%=temp%></td>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">대여 가격</td>
				<td width="250" align="center"><%=bean.getPrice()%></td>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">제조 회사</td>
				<td width="250" align="center"><%=bean.getCompany()%></td>
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center">
					<input type = "hidden" name="no" value="<%=bean.getNo()%>">
					<input type = "hidden" name="img" value="<%=bean.getImg()%>">
					<input type="submit" value="옵션 선택 후 구매하기">
				</td>
			</tr>	
		</table>
			<br><br><br>
			<font size="5" color="gray"> 차량 정보 보기</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
</body>
</html>