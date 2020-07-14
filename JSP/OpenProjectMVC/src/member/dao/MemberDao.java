package member.dao;

import java.sql.Connection;

import member.model.Member;

public class MemberDao {
	private MemberDao() {
	};

	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		return dao;
	}

	public int insertReport(Connection conn, Member member) {
		return 0;
	}

}
