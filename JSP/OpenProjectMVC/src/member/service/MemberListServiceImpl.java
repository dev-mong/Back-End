package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import member.model.MemberListView;
import service.Service;

public class MemberListServiceImpl implements Service {

	MemberDao dao = null;

	// 페이지 당 표현 할 정보 개수
	public int MEMBER_COUNT_PAGE = 5;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		Connection conn = null;
		int memberTotalCount = 0;
		List<Member> memberList = null;
		MemberListView memberListView=null;

		try {

			conn = ConnectionProvider.getConnection();
			dao = MemberDao.getInstance();

			// ---- 페이지 당 출력 할 회원 정보 리스트 구하기 ---- //전체 회원정보 개수
			memberTotalCount = dao.selectTotalCount(conn);

			// -----현재 페이지 계산 : 게시물 시작 행, 페지당 표현할 정보 개수 계산 -----
			int startRow = 0; // 게시물 시작 행
			String page = request.getParameter("page");
			int currnetPageNumber = 1;
			
			// 현제 페이지 값
			if (page != null) {
				currnetPageNumber = Integer.parseInt(page);
			}
			
			// 전체 회원 정보가 있을 때
			if (memberTotalCount > 0) {
				// 시작행 계산 식  
				startRow = (currnetPageNumber - 1) * MEMBER_COUNT_PAGE;
				// 출력 할 리스트
				memberList = dao.selectMemberList(conn, startRow, MEMBER_COUNT_PAGE);

			} else { // 회원 정보가 없을 때
				memberList = Collections.emptyList(); // -----------------------★
			}
			
			memberListView = new MemberListView(memberTotalCount, MEMBER_COUNT_PAGE, currnetPageNumber, memberList, startRow);
			
			request.setAttribute("memberListView", memberListView);

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

		return "/WEB-INF/views/member/list.jsp";
	}

}
