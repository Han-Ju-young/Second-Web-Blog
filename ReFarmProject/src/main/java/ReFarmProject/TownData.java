package ReFarmProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TownData {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	// JDBC 드라이버 로드 메소드
	public TownData() {
		try {
			InitialContext ctx = new InitialContext();
		    ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	// 데이터베이스 연결 메소드 
	public void connect() {
		try {
		    con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 데이터베이스 연결 헤제 메소드 
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판의 모든 레코드를 반환하는 메소드
	public ArrayList<TownEntity> getTownList() {	
		connect();
		ArrayList<TownEntity> list = new ArrayList<TownEntity>();
		String SQL = "select * from townprogram";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();

			//ResultSet의 결과에서 모든 행을 각각의 StudentEntity 객체에 저장  
			while (rs.next()) {		
				//한 행의 학생정보를 저장할 학생을 위한 빈즈 객체 생성  
				TownEntity pro = new TownEntity();

				//한 행의 학생정보를 자바 빈즈 객체에 저장  				
				pro.setId ( rs.getInt("id") );
				pro.setTown ( rs.getString("town") );
				pro.setCity ( rs.getString("city") );
				pro.setCountry ( rs.getString("country") );
				pro.setInfo ( rs.getString("info") );
				pro.setAddress ( rs.getString("address") );
				pro.setName ( rs.getString("name") );
				pro.setPhone ( rs.getString("phone") );
				pro.setHomepage ( rs.getString("homepage") );
				pro.setManage( rs.getString("manage") );
				//ArrayList에 학생정보 StudentEntity 객체를 추가
				list.add(pro);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		//완성된 ArrayList 객체를 반환
		return list;
	}
	public ArrayList<TownEntity> getTownList(int startRow, int pageSize){
		//가변길이 배열 생성
		ArrayList<TownEntity> list = new ArrayList<TownEntity>(); 

		try {
			//1. 디비연결
			connect();
			//2. sql작성, pstmt
			//게시판의 데이터 목록중에서 10개씩 정렬해서 가져오기
			//re_ref(그룹번호) 내림차순 + re_seq(답글순서결정)오름차순으로 정렬
			//데이터 짤라서 가져오기 limit 시작행-1, 페이지갯수 => 해당 위치부터 개수만큼 가져오기
			String sql = "select * from townprogram order by id asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//3. 실행 -> rs저장
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				//4-1.BoardBean 객체생성해서 그 안에 rs데이터 저장
				TownEntity pro = new TownEntity();

				//한 행의 학생정보를 자바 빈즈 객체에 저장  				
				pro.setId ( rs.getInt("id") );
				pro.setTown ( rs.getString("town") );
				pro.setCity ( rs.getString("city") );
				pro.setCountry ( rs.getString("country") );
				pro.setInfo ( rs.getString("info") );
				pro.setAddress ( rs.getString("address") );
				pro.setName ( rs.getString("name") );
				pro.setPhone ( rs.getString("phone") );
				pro.setHomepage ( rs.getString("homepage") );
				pro.setManage( rs.getString("manage") );
				//ArrayList에 학생정보 StudentEntity 객체를 추가
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<TownEntity> getSearch(int startRow, int pageSize, String type){//특정한 리스트를 받아서 반환
	      ArrayList<TownEntity> list = new ArrayList<TownEntity>();
	      // String SQL ="SELECT * FROM board WHERE" + searchField + "LIKE '"+searchText+"%'";
	      
	      String sql = "SELECT * FROM townprogram WHERE city";
	      try {
	    	  connect();
	    	  if(type != null && !type.equals("") ){//이거 빼면 안 나온다ㅜ 왜지?
	    		  sql +=" LIKE '%"+type.trim()+"%' order by id asc limit ?,?";
	          }
	    	  pstmt = con.prepareStatement(sql);
	    	  pstmt.setInt(1, startRow-1);
	    	  pstmt.setInt(2, pageSize);
	          ResultSet rs = pstmt.executeQuery();
	          while(rs.next()) {
	        	  TownEntity pro = new TownEntity();

					//한 행의 학생정보를 자바 빈즈 객체에 저장  				
					pro.setId ( rs.getInt("id") );
					pro.setTown ( rs.getString("town") );
					pro.setCity ( rs.getString("city") );
					pro.setCountry ( rs.getString("country") );
					pro.setInfo ( rs.getString("info") );
					pro.setAddress ( rs.getString("address") );
					pro.setName ( rs.getString("name") );
					pro.setPhone ( rs.getString("phone") );
					pro.setHomepage ( rs.getString("homepage") );
					pro.setManage( rs.getString("manage") );
					//ArrayList에 학생정보 StudentEntity 객체를 추가
					list.add(pro);
	         }
	       } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
				disconnect();
			}
	      return list;//ㄱㅔ시글 리스트 반환
	}
	
	public int getTownCount(){
		int count = 0;
		try {
			//디비연결
			connect();
			//sql작성, pstmt
			String sql = "select count(*) from townprogram";
			pstmt = con.prepareStatement(sql);
			//실행 -> rs저장
			ResultSet rs = pstmt.executeQuery();
			//데이터처리
			if(rs.next()){
				count = rs.getInt(1); // 데이터가 없으면 null이고 return 0값이 된다.
				//count = rs.getInt("count(*)"); 위와 동일한 결과
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}
	public int getTownCount(String type){
		int count = 0;
		try {
			//디비연결
			connect();
			//sql작성, pstmt
			String sql = "select count(*) from townprogram where city LIKE '%"+type.trim()+"%'";
			pstmt = con.prepareStatement(sql);
			//실행 -> rs저장
			ResultSet rs = pstmt.executeQuery();
			//데이터처리
			if(rs.next()){
				count = rs.getInt(1); // 데이터가 없으면 null이고 return 0값이 된다.
				//count = rs.getInt("count(*)"); 위와 동일한 결과
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}
}
