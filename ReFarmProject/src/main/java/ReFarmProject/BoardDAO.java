package ReFarmProject;

import java.sql.*; 
import java.util.*; 
import javax.sql.*; 
import javax.naming.*; 

public class BoardDAO {
	// 데이터베이스 연결관련 변수 선언
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private DataSource ds = null;

		// JDBC 드라이버 로드 메소드
		public BoardDAO() {
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
	public int getBoardCount(){
		int count = 0;
		try {
			//디비연결
			connect();
			//sql작성, pstmt
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			//실행 -> rs저장
			ResultSet rs = pstmt.executeQuery();
			//데이터처리
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}//getBoardCount닫기
	
	public ArrayList<BoardEntity> getBoardList(){
		//가변길이 배열 생성
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>(); 
		try {
			connect();
			String sql = "select * from board order by date desc";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
				BoardEntity brd = new BoardEntity();
				brd.setId ( rs.getString("id") );
				brd.setPasswd ( rs.getString("passwd") );
				brd.setName ( rs.getString("name") );
				brd.setDate ( rs.getTimestamp("date") );
				brd.setShowcnt ( rs.getInt("showcnt") );
				brd.setTitle ( rs.getString("title") );
				brd.setContent ( rs.getString("content") );

				list.add(brd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<BoardEntity> getBoardList(int startRow, int pageSize){
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>(); 

		try {
			connect();
			String sql = "select * from board order by date desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardEntity brd = new BoardEntity();
				brd.setId ( rs.getString("id") );
				brd.setPasswd ( rs.getString("passwd") );
				brd.setName ( rs.getString("name") );
				brd.setDate ( rs.getTimestamp("date") );
				brd.setShowcnt ( rs.getInt("showcnt") );
				brd.setTitle ( rs.getString("title") );
				brd.setContent ( rs.getString("content") );

				list.add(brd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<BoardEntity> getSearch(int startRow, int pageSize, String searchField, String searchText){//특정한 리스트를 받아서 반환
	      ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
	      
	      String sql = "SELECT * FROM board WHERE "+searchField.trim();
	      try {
	    	  connect();
	    	  if(searchText != null && !searchText.equals("") ){
	    		  sql +=" LIKE '%"+searchText.trim()+"%' order by date desc limit ?,?";
	          }
	    	  pstmt = con.prepareStatement(sql);
	    	  pstmt.setInt(1, startRow-1);
	    	  pstmt.setInt(2, pageSize);
	          ResultSet rs = pstmt.executeQuery();
	          while(rs.next()) {
	        	  BoardEntity brd = new BoardEntity();
	        	  brd.setId ( rs.getString("id") );
	        	  brd.setPasswd ( rs.getString("passwd") );
	        	  brd.setName ( rs.getString("name") );
	        	  brd.setDate ( rs.getTimestamp("date") );
	        	  brd.setShowcnt ( rs.getInt("showcnt") );
	        	  brd.setTitle ( rs.getString("title") );
	        	  brd.setContent ( rs.getString("content") );
	        	  
	        	  list.add(brd);//list에 해당 인스턴스를 담는다.
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
				disconnect();
	      }
	      return list;   
	}
	
	public int getCount(String keyWord, String searchWord) {
		int count = 0;
		String sql = "select count(*) from board where " + keyWord + " like ?";
		
		try {
			connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "%" + searchWord + "%");
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}
	
	public BoardEntity getBoard(String id) {	
		connect();
		String SQL = "select * from board where id = ?";
		BoardEntity brd = new BoardEntity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();			
			rs.next();
			brd.setId ( rs.getString("id") );
			brd.setPasswd ( rs.getString("passwd") );
			brd.setName ( rs.getString("name") );
			brd.setDate ( rs.getTimestamp("date") );
			brd.setShowcnt ( rs.getInt("showcnt") );
			brd.setTitle ( rs.getString("title") );
			brd.setContent ( rs.getString("content") );
			
			int Count = rs.getInt("showcnt");
			Count++;
			countUpdate(Count,id);
			
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return brd;
	}
	public int countUpdate(int Count, String id) {
		String SQL = "update board set showcnt = ? where id = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, Count);//물음표의 순서
			pstmt.setString(2, id);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	// 게시물 등록 메서드
	public boolean insertDB(BoardEntity board) {
		boolean success = false; 
		connect();
		String sql ="insert into board values(?, ?, ?, sysdate(), ?, ?, ?)";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getPasswd());
			pstmt.setString(3, board.getName());
			pstmt.setInt(4, board.getShowcnt());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6,  board.getContent());
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	
	// 데이터 갱신을 위한 메서드
	public boolean updateDB(BoardEntity board) {
		boolean success = false; 
		connect();		
		String sql ="update board set name=?, title=?, content=? where id=?";	
		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 GuestBook 객체를 이용해 사용자가 수정한 값을 가져와 SQL문 완성
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getId());
			int rowUdt = pstmt.executeUpdate();
			//System.out.println(rowUdt);
			if (rowUdt == 1) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	
	// 게시물 삭제를 위한 메서드
	public boolean deleteDB(String id) {
		boolean success = false; 
		connect();		
		String sql ="delete from board where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			// 인자로 받은 주 키인 id 값을 이용해 삭제
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}

	// 데이터베이스에서 인자인 id와 passwd가 일치하는지 검사하는  메서드
	public boolean isPasswd(String id, String passwd) {
		boolean success = false;
		connect();		
		String sql ="select passwd from board where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String orgPasswd = rs.getString(1);
			if ( passwd.equals(orgPasswd) ) success = true; 
			System.out.println(success);
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
}
