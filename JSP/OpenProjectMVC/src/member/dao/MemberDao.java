package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;

public class MemberDao {
	private MemberDao() {
	};

	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		return dao;
	}
	
	//데이터 저장
	public int insertMember(Connection conn, Member member) throws SQLException {

		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member " + "(uid,upw,uname,uphoto) VALUES (?,?,?,?)";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getUid());
			pstmt.setString(2, member.getUpw());
			pstmt.setString(3, member.getUname());
			pstmt.setString(4, member.getUphoto());
			
			resultCnt=pstmt.executeUpdate();
			
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
		}
	
		
		return resultCnt;
	}

	
	//Id check 검색
	public int selectById(Connection conn, String id) throws SQLException {
		
		int resultCnt=0;

		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="SELECT COUNT(*) FROM MEMBER WHERE UID=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				resultCnt = rs.getInt(1); //count(*), 첫번째 컬럼 값을 의미
			}
			
		
		}finally {
			if(rs !=null) {
				rs.close();
			}
			if(pstmt ==null) {
				pstmt.close();
			}
		}
		
		
		return resultCnt;
	}

	
	//전체 회원 개수 검색
	public int selectTotalCount(Connection conn) throws SQLException {
		 
		int memberTotalCount = 0; 
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="SELECT COUNT(*) FROM MEMBER";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//검색 한 회원 전체 개수 
			if(rs.next()) {
				memberTotalCount = rs.getInt(1);
			}
			
		}finally {
			if(pstmt !=null) {
				pstmt.close();
			}
		}
		
		
		return memberTotalCount;
	}

	//페이지 당 출력 할 멤버 리스트 검색
	public List<Member> selectMemberList(Connection conn, int startRow, int countPage) throws SQLException {

		List<Member> memberList=new ArrayList<>();
		
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM MEMBER limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, countPage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setUid(rs.getString("uid"));
				member.setUpw(rs.getString("upw"));
				member.setUname(rs.getString("uname"));
				member.setUphoto(rs.getString("uphoto"));
				member.setRegdate(rs.getDate("regdate"));
				
				//리스트에 member 객체를 담음
				memberList.add(member);
			}
			
		}finally {
			if(rs !=null) {
				rs.close();
			}
			if(pstmt ==null) {
				pstmt.close();
			}
		}
		return memberList;
	}


	
	
	
	
}
