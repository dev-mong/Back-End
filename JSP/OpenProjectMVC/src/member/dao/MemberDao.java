package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import member.model.Member;

public class MemberDao {
	private MemberDao() {
	};

	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		return dao;
	}

	// 데이터 저장

	public int insertMember(Connection conn, Member member) throws SQLException {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.member " + "(uid,upw,uname,uphoto) VALUES (?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUid());
			pstmt.setString(2, member.getUpw());
			pstmt.setString(3, member.getUname());
			pstmt.setString(4, member.getUphoto());

			resultCnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}

	// Id check 검색
	public int selectById(Connection conn, String id) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM project.member WHERE UID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultCnt = rs.getInt(1); // count(*), 첫번째 컬럼 값을 의미
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt == null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}

	// 전체 회원 개수 검색
	public int selectTotalCount(Connection conn) throws SQLException {

		int memberTotalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM project.member";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 검색 한 회원 전체 개수
			if (rs.next()) {
				memberTotalCount = rs.getInt(1);
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return memberTotalCount;
	}

	// 페이지 당 출력 할 멤버 리스트 검색
	public List<Member> selectMemberList(Connection conn, int startRow, int countPage) throws SQLException {

		List<Member> memberList = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM project.member limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, countPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setUid(rs.getString("uid"));
				member.setUpw(rs.getString("upw"));
				member.setUname(rs.getString("uname"));
				member.setUphoto(rs.getString("uphoto"));
				member.setRegdate(rs.getDate("regdate"));

				// 리스트에 member 객체를 담음
				memberList.add(member);
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt == null) {
				pstmt.close();
			}
		}
		return memberList;
	}

	// 인덱스 번호로 회원 정보 검색
	public Member selectByIdx(Connection conn, int indexNum) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM project.member WHERE IDX=?";
		Member member = new Member();

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setIdx(rs.getInt("idx"));
				member.setUid(rs.getString("uid"));
				member.setUpw(rs.getString("upw"));
				member.setUname(rs.getString("uname"));
				member.setUphoto(rs.getString("uphoto"));
				member.setRegdate(rs.getDate("regdate"));
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return member;
	}

	// 회원 정보 수정
	public int updateMember(Connection conn, Member member) throws SQLException {

		PreparedStatement pstmt = null;
		int resultCnt = 0;

		String sql = "UPDATE project.member SET UPW=?, UNAME=?, UPHOTO=? WHERE UID=?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUpw());
			pstmt.setString(2, member.getUname());
			pstmt.setString(3, member.getUphoto());
			pstmt.setString(4, member.getUid());

			resultCnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}

		}
		return resultCnt;
	}

	// 회원 정보 삭제
	public int deleteMember(Connection conn, int indexNum) throws SQLException {

		PreparedStatement pstmt = null;

		int resultCnt = 0;

		String sql = "DELETE FROM project.member WHERE IDX=?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexNum);

			resultCnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}

}
