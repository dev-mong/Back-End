package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class UpdateFormServiceImpl implements Service {

	MemberDao dao=null;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn=null;
		Member member=null;
		
		String index=request.getParameter("index");
		int indexNum=Integer.parseInt(index);
		
		try {
		
			conn=ConnectionProvider.getConnection();
			dao=MemberDao.getInstance();
			member = dao.selectByIdx(conn, indexNum);
			
			request.setAttribute("member", member);	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn !=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return "/WEB-INF/views/member/updateForm.jsp";
	}

}
