<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");	
	
		//취미 부분은 별도로 읽어드려 다시 빈클래스에 저장 
		String [] hobby = request.getParameterValues("hobby");
		
		//배열에 있는 내용알을 하나의 스트링으로 저장 
		String texthobby="";
		
		for(int i = 0 ;i < hobby.length; i++){
			texthobby += hobby[i]+" ";
		}
	%>
	
	<!--useBean을 이용하여 한꺼번에 데이터를 받아옴  -->
	<jsp:useBean id = "mbean" class= "Member.MemberBean">
		<jsp:setProperty name="mbean" property="*" /><!--맵핑 시키시오  -->
	</jsp:useBean>

	<% 
	    mbean.setHobby(texthobby); //기존의 취미는 주소 번지가 저장되기에  위에 배열의 내용을 하나의 스트림으로 저장한 변수를 다시 입력 
	   
	    String dbID = "root";
	    String dbPassword = "root";
	    String dbURL = "jdbc:mysql://localhost:3306/MEMBER";
	
	    try{
	   		//1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클을 사용) 	
		    Class.forName("com.mysql.jdbc.Driver");
	   	
	   		//2.해당 데이터 베이스에 접속
	   		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		    
	   		//3. 접속후 쿼리 준비하여 쿼리를 실행하여 쿼리를 사용하도록 설정 
	   		 String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
	   		
	   		//쿼리를 사용하도록 설정 
			PreparedStatement pstmt = conn.prepareStatement(SQL);//jsp에서 쿼리를 사용하도록 설정
			
	   		//?에 맞게 데이터를 맵핑
	   		pstmt.setString(1,mbean.getId());
	   		pstmt.setString(2,mbean.getPass1());
	   		pstmt.setString(3,mbean.getEmail());
	   		pstmt.setString(4,mbean.getTel());
	   		pstmt.setString(5,mbean.getHobby());
	   		pstmt.setString(6,mbean.getJob());
	   		pstmt.setString(7,mbean.getAge());
	   		pstmt.setString(8,mbean.getInfo());
	   		
	   		//4.오라클에서 퀴리를 실행 하시오 
	   		pstmt.executeUpdate();//insert,update,delete 시 사용하는 메소드 
	   		
	   		//5.자원 반납 
	   		conn.close();
	   		
	   		
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}
	
	
	%>
    	 ~~ 오라클 접속 완료

</body>
</html>