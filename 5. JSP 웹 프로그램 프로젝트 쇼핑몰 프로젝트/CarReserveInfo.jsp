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
	
		//������ ���̽��� ����
		RentCarDAO rdao  = new RentCarDAO();
		
		//��Ʈī �ϳ��� ���� ������ ���� 
		CarListBean bean = rdao.getOneCar(no);

		
		int Category = bean.getCategory();
		String temp ="";
		if(Category ==1)temp="����";
		else if(Category ==2)temp="����";
		else if(Category ==3)temp="����";
	%>
	
<center>
	<form action = "RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName() %> ���� ����</font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="6" width="500">
					<img alt = "" src="images/<%=bean.getImg()%>" width="450">	
				</td>
				<td width="250" align="center">�����̸�</td>
				<td width="250" align="center"><%=bean.getName()%></td>
			</tr>	
				
			<tr>
				<td width="250" align="center">���� ����</td>
				<td width="250" align="center">
					<select name="qty">
						<option value ="1">1</option>
						<option value ="2">2</option>
						<option value ="3">3</option>
					</select>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">���� �з�</td>
				<td width="250" align="center"><%=temp%></td>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">�뿩 ����</td>
				<td width="250" align="center"><%=bean.getPrice()%></td>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">���� ȸ��</td>
				<td width="250" align="center"><%=bean.getCompany()%></td>
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center">
					<input type = "hidden" name="no" value="<%=bean.getNo()%>">
					<input type = "hidden" name="img" value="<%=bean.getImg()%>">
					<input type="submit" value="�ɼ� ���� �� �����ϱ�">
				</td>
			</tr>	
		</table>
			<br><br><br>
			<font size="5" color="gray"> ���� ���� ����</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
</body>
</html>