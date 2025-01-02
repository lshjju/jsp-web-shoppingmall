package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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

	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		getCon();
		// 빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0; // 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다
		int re_step = 1; // 새글이기에 = 부모 글이기에
		int re_level = 1;

		try {
			// 가장큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from board";
			// 쿼리실행 객체
			pstmt = con.prepareStatement(refsql);
			// 쿼리를 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {// 결과 값이 있다면
				ref = rs.getInt(1) + 1;
			}
			// 실제로 게시글 전체값을 테이블에 저장
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			// 일단 한번 돌려줘야 에러 안남
			pstmt = con.prepareStatement(sql);
			// ?의 값을 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			// 쿼리를 실행하시오
			pstmt.executeUpdate();
			// 자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 모든 게시글을 리턴해 주는 리소스
	public Vector<BoardBean> getAllBoard() {

		// 리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();
		getCon();

		try {
			// 쿼리 준비
			String sql = "select * from board order by ref desc ,re_step asc";
			// 쿼리실행 객체
			pstmt = con.prepareStatement(sql);
			// 쿼리를 실행후 결과를 저장
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while (rs.next()) {
				// 데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				// 패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return v;

	}

}
