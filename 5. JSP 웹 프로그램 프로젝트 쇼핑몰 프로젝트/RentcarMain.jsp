<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<% 
		String Center = request.getParameter("center");
		//ó�� ����ÿ��� center���� �Ѿ���� �ʱ⿡
		if(Center==null){//null ó������
			Center = "Center.jsp";//����Ʈ center���� �ο�	
		}
	%>
		<table width="1000" >
		<!--Top �κ� -->
			<tr height="140" align="center">
				<td align="center" width="1000"><jsp:include page="Top.jsp"/></td>
			</tr>
		</table>
		
		<!--Center �κ� -->
			<tr height="470" align="center">
				<td align="center" width="1000"><jsp:include page="<%=Center%>"/></td>
			</tr>
		</table>
		
		<!-- Bottom �κ� -->
			<tr height="100" align="center">
				<td align="center" width="1000"><jsp:include page="Bottom.jsp"/></td>
			</tr>
		</table>
	</center>
</body>
</html>