package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	String id = "myid";
	String pass = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getCon() {

		try {
			// 1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클을 사용)
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2.해당 데이터 베이스에 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block

		}

	}

	public void insertMember(MemberBean mbean) {
		try {
			getCon();
			// 3. 접속후 쿼리 준비하여 쿼리를 실행하여 쿼리를 사용하도록 설정
			String SQL = "INSERT INTO MEMBERS VALUES(?,?,?,?,?,?,?,?)";

			// 쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(SQL);// jsp에서 쿼리를 사용하도록 설정

			// ?에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());

			// 4.오라클에서 퀴리를 실행 하시오
			pstmt.executeUpdate();// insert,update,delete 시 사용하는 메소드

			// 5.자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

































package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//오라클 데이터 베이스에 연결하고 select, insert , update , delete 작업을 실행해 주는 클래스 입니다.
public class MemberDAO{
	//오라클에 접속하는 소스를 작성
    String dbID = "root";//접속 아이디
    String dbPassword = "root";
    String dbURL = "jdbc:mysql://localhost:3306/MEMBER";
    
    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection conn;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 
	
   
   //데이터 베이스에 접근할수 있도록 도와주는 메소드
	public void getcon(){
		//커넥션 풀을 이요하여 데이터 베이스에 접근 
		
		 try{
		   	//외부에서 데이터를 읽어 드려야 하기에 
			 Context initctx = new InitialContext();
			 //톰캣 서버에 정보를 담아 놓은 곳 으로 이동 
			 Context envctx = (Context)initctx.lookup("java:comp/env");
			 //데이터 베이스 객체를 선언 
			 DataSource ds =  (DataSource)envctx.lookup("jdbc/pool");
			 //데이터 소스를 기준으로 커넥션을 연결해 주시오
			 conn =ds.getConnection();
		   		
		 }catch(Exception e){
		    e.printStackTrace();
		 }
		/*
		 try{
		   		//1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클을 사용) 	
			    Class.forName("com.mysql.jdbc.Driver");
		   		//2.해당 데이터 베이스에 접속
			    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		   		
		   		
		    }catch(Exception e){
		    	e.printStackTrace();
		   	}
		   	*/
	}
	
	//데이터 베이스에 한사람의 회원 정보를 저장해주는 매소드
	public void insertMember(MemberBean mbean){
		try {
		getcon();
		String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
		//쿼리를 사용하도록 설정 
			pstmt = conn.prepareStatement(SQL);
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
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	
	
	//모든 회원의 정보를 리턴해 주는 매소드 호출 
	public Vector<MemberBean> allSelectMember(){
		//가변길이로 데이터를 저장
		Vector<MemberBean> v = new Vector<>();
		
		//무조건 데이터 베이스는 예외 처리를 반드시 해야 합니다.
		 try{
			 //커넥션 연결 
			 getcon();
			 
			 //쿼리 준비 
			 String SQL = "SELECT * FROM MEMBER";
			 
			 //쿼리를 실행 시켜주는 객체 선언 
			 pstmt = conn.prepareStatement(SQL);
			 
			 //메소드 다 외우기
			 //쿼리를 실행 시킨 결과를 리턴해서 받아줌(오라클의 테이블의 검색된 결과를 자바 객체에 저장) 
			 rs = pstmt.executeQuery();
			 
			 //반복문을 사용해서 rs에 저장된 데이터를 추출해 놓아야합니다
			 while(rs.next()){//저장된 데이터 만큼까지 반복문을 돌리겠다는 뜻 입니다. 
				 MemberBean bean = new MemberBean(); //컬럼으로 나뉘어진 데이터를 빈 클래스에 저장 
				 bean.setId(rs.getString(1));
				 bean.setPass1(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setTel(rs.getString(4));
				 bean.setHobby(rs.getString(5));
				 bean.setJob(rs.getString(6));
				 bean.setAge(rs.getString(7));
				 bean.setInfo(rs.getString(8));	 
				 //패키징된 memberbean클래스를 백터에 저장 
				 v.add(bean);//0번지 부터 순서대로 데이터가 저장
			 }
			 //자원 반납
			 conn.close();
			 
		    }catch(Exception e){
		    	e.printStackTrace();
		   	}
		 
		 	//다 저장된 백터를 리턴
		 	return v;	
	}
	
	
	public MemberBean oneSelectMember(String id){
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		MemberBean bean = new MemberBean();
		//무조건 데이터 베이스는 예외 처리를 반드시 해야 합니다.
		 try{
			 //커넥션 연결 
			 getcon();
			 
			 //쿼리 준비 
			 String SQL = "SELECT *FROM MEMBER WHERE id= ?";
			 //쿼리를 실행 시켜주는 객체 선언 
			 pstmt = conn.prepareStatement(SQL);		 
			 //?의 값을 맵핑 
			 pstmt.setString(1,id);
			 //쿼리 실행 
			 rs = pstmt.executeQuery();
			 if(rs.next()){//레코드가 있다면 
				 bean.setId(rs.getString(1));
				 bean.setPass1(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setTel(rs.getString(4));
				 bean.setHobby(rs.getString(5));
				 bean.setJob(rs.getString(6));
				 bean.setAge(rs.getString(7));
				 bean.setInfo(rs.getString(8));	 		 
			 }
			 
			 //자원 반납
			 conn.close();
			 
		    }catch(Exception e){
		    	e.printStackTrace();
		   	}	
		 //리턴 
		return bean;	
	}
	
	//한 회원의 패스워드 값을 리턴하는 메소드 작성
	public String getPass1(String id){
		//스트링으로 리턴을 해야하기에 스트링 변수 선언
		String pass="";
		try {
		 //커넥션 연결 
		 getcon();
		 //쿼리 준비 
		 String SQL = "SELECT pass1 FROM MEMBER WHERE id= ?";
		 //쿼리를 실행 시켜주는 객체 선언 
		 pstmt = conn.prepareStatement(SQL);		 
		 //?의 값을 맵핑 
		 pstmt.setString(1,id);
		 //쿼리 실행 
		 rs = pstmt.executeQuery();
		 
		 if(rs.next()){
			 pass=rs.getNString(1);	 
		 }
		 
		 //자원 반납
		 conn.close();
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}	
		//리턴 
		return pass;	
	}
	
	//한 회원의 정보를 수정하는 매소드 
	public void updateMember(MemberBean bean){
		getcon();
		try {
		 //쿼리 준비 
		 String SQL = "UPDATE MEMBER SET email=?,tel=? WHERE id=?";
		 //쿼리를 실행 시켜주는 객체 선언 
		 pstmt = conn.prepareStatement(SQL);		 
		 //?의 값을 맵핑 
		 pstmt.setString(1,bean.getEmail());
		 pstmt.setString(2,bean.getTel());
		 pstmt.setString(3,bean.getId());
		 //쿼리 실행 
		 pstmt.executeUpdate();
		 //자원 반납
		 conn.close();
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}	
	}
	
	//한회원을 삭제하는 메소드 작성 
	public void deleteMember(String id) {
		getcon();

		try {
		 //쿼리 준비 
		 String SQL = "DELETE FROM MEMBER WHERE id=?";
		 //쿼리를 실행 시켜주는 객체 선언 
		 pstmt = conn.prepareStatement(SQL);		 
		 //?의 값을 맵핑 
		 pstmt.setString(1,id);
		 //쿼리 실행 
		 pstmt.executeUpdate();
		 //자원 반납
		 conn.close();
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}	
	}
}
