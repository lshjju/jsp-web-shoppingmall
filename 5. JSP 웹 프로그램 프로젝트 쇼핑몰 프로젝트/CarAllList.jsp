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
<center>
	<table width="1000">
		<tr height="100">
			<td align="center"colspan="3">
					<font size="7" color="gray">��ü ��Ʈī ����</font>
			</td>
		</tr>
	<% 
		RentCarDAO rdao = new RentCarDAO();
		Vector<CarListBean> v = rdao.getAllCar();
		//tr�� 3���� �����ְ� �ٽ� tr�� ���� �Ҽ� �ֵ��� �ϴ� ���� ���� 
		int j = 0;
		for(int i = 0; i < v.size();i++){
			//���Ϳ� ����Ǿ� �ִ� ��Ŭ������ ����
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
				<font size ="3" color="gray"><b> ������ : <%=bean.getName()%></b></font></p>
			</td>

	<% 		
			j = j+1;//j���� ���Ͽ� �ϳ��� �࿡ �� 3���� ���������� �����ֱ� ���ؼ� ����
		}
 	%>
	</table>
</center>

</body>
</html>