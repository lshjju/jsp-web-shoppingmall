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
		//카테고리 분류값을 받아옴 
		int Category = Integer.parseInt(request.getParameter("category"));
		String temp ="";
		if(Category ==1)temp="소형";
		else if(Category ==2)temp="중형";
		else if(Category ==3)temp="대형";
	%>
	
<center>
	<table width="1000" border ="1" bordercolor="gray">
		<tr height="100">
			<td align="center"colspan="3">
				<font size="7" color="gray"><%=temp%> 자동차</font>
			</td>
		</tr>
	<% 
		RentCarDAO rdao = new RentCarDAO();
		Vector<CarListBean> v = rdao.getCategoryCar(Category);
		//tr를 3개씩 보여주고 다시 tr을 실행 할수 있도록 하는 변수 선언 
		int j = 0;
		for(int i = 0; i < v.size();i++){
			//벡터에 저장되어 있는 빈클래스를 추출
			CarListBean bean = v.get(i);
			if(j%3==0){
	%>		
			<tr height="220">
	<% 
			}
	%>
			<td width="333" align="center">
				<a href ="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
				<img alt ="" src="images/<%=bean.getImg()%>" width="300" height="200"> 
				</a><p>
				<font size ="3" color="gray"><b> 차량명 : <%=bean.getName()%></b></font></p>
			</td>

	<% 		
			j = j+1;//j값을 가하여 하나의 행에 총 3개의 차량정보를 보여주기 위해서 증가
		}
 	%>
	</table>
</center>

</body>
</html>