package ReFarmProject;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;
 
public class MemberDAO 
{
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	// JDBC 드라이버 로드 메소드
	public MemberDAO() {
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
	
	// MemberBean
	
    public Date stringToDate(MemberBean member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    }
    public boolean insertMember(MemberBean member) {
		boolean success = false; 
		connect();   
        stringToDate(member);

        String sql ="insert into JSP_MEMBER values(?, ?, ?, ?, ?, ?, ?, ?, sysdate())";
        
		try {
			pstmt = con.prepareStatement(sql.toString());
	        pstmt.setString(1, member.getId());
	        pstmt.setString(2, member.getPassword());
	        pstmt.setString(3, member.getName());
	        pstmt.setString(4, member.getGender());
	        pstmt.setDate(5, stringToDate(member));
	        pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
	        pstmt.setString(7, member.getPhone());
	        pstmt.setString(8, member.getAddress());
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
    
    public MemberBean getUserInfo(String id) 
    {
        MemberBean member = null;
 
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM JSP_MEMBER WHERE ID=?");
 
            connect();
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
 
            if (rs.next()) // 회원정보를 DTO에 담는다.
            {
                // DB의 생년월일정보 -> 년, 월, 일로 문자열 자른다.
                String birthday = rs.getDate("birth").toString();
                String year = birthday.substring(0, 4);
                String month = birthday.substring(5, 7);
                String day = birthday.substring(8, 10);
                
                // 이메일을 @ 기준으로 자른다.
                String mail = rs.getString("mail");
                int idx = mail.indexOf("@"); 
                String mail1 = mail.substring(0, idx);
                String mail2 = mail.substring(idx+1);
                
                // 자바빈에 정보를 담는다.
                member = new MemberBean();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getString("gender"));
                member.setBirthyy(year);
                member.setBirthmm(month);
                member.setBirthdd(day);
                member.setMail1(mail1);
                member.setMail2(mail2);
                member.setPhone(rs.getString("phone"));
                member.setAddress(rs.getString("address"));
                member.setReg(rs.getTimestamp("reg"));
            }
 
            return member;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }    // end getUserInfo
    
    
    /**
     * 회원정보를 수정한다.
     * @param member 수정할 회원정보를 담고있는 TO
     * @throws SQLException
     */
    public void updateMember(MemberBean member) throws SQLException{
        try {
 
            StringBuffer query = new StringBuffer();
            query.append("UPDATE JSP_MEMBER SET");
            query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS=?");
            query.append(" WHERE ID=?");
 
            connect();
            pstmt = con.prepareStatement(query.toString());
 
            // 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
            
            pstmt.setString(1, member.getPassword());
            pstmt.setString(2, member.getMail1()+"@"+member.getMail2());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getAddress());
            pstmt.setString(5, member.getId());
 
            pstmt.executeUpdate();
            // 완료시 커밋
            con.commit(); 
                        
        } catch (Exception sqle) {
            con.rollback(); // 오류시 롤백
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end updateMember
    
    
    /**
     * 회원정보를 삭제한다.
     * @param id 회원정보 삭제 시 필요한 아이디
     * @param pw 회원정보 삭제 시 필요한 비밀번호
     * @return x : deleteMember() 수행 후 결과값
     */
    @SuppressWarnings("resource")
    public int deleteMember(String id, String pw) 
    {
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;
 
        try {
            // 비밀번호 조회
            StringBuffer query1 = new StringBuffer();
            query1.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");
 
            // 회원 삭제
            StringBuffer query2 = new StringBuffer();
            query2.append("DELETE FROM JSP_MEMBER WHERE ID=?");
 
            connect();
 
            // 자동 커밋을 false로 한다.
            con.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            pstmt = con.prepareStatement(query1.toString());
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("password");
                if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
                {
                    // 같을경우 회원삭제 진행
                    pstmt = con.prepareStatement(query2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    con.commit(); 
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
            try {
                con.rollback(); // 오류시 롤백
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end deleteMember
    
    public int loginCheck(String id, String pw) 
    {
        
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");
 
            connect(); 
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
}