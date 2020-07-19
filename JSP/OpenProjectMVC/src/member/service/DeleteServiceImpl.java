package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class DeleteServiceImpl implements Service {

	MemberDao dao = null;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		// 아이디값을 이용해서 데이터 삭제
		Connection conn = null;
		Member member = null;
		int resultCnt = 0;

		String index = request.getParameter("idx");
		System.out.println(index);
		int indexNum = Integer.parseInt(index);

		try {

			conn = ConnectionProvider.getConnection();
			dao = MemberDao.getInstance();
			resultCnt = dao.deleteMember(conn, indexNum);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return "/WEB-INF/views/member/delete.jsp";
	}

}
