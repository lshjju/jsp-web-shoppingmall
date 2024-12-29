package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;// 데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt;// 데이터 베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs;// 데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체

	public void getCon() {
		// 커넥션 풀을 이용하여 데이터 베이스에 접근
		try {
			// 외북에서 데이터 읽어들여야 하기에
			// context - java.naming
			// initialcontext - java.naming
			Context initctx = new InitialContext();
			// 톰캣 서버에 정보를 담아놓은 곳으로 이동
			// lookup - string name
			// redline - add cast to context
			Context envctx = (Context) initctx.lookup("java:comp/env");
			// 데이터 소스 객체를 선언
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			// 데이터 소스를 기준으로 커넥션을 연결해 주시요
			// getconnection - datasource
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
