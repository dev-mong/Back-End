package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class LoginImpl implements Service {

	
	MemberDao dao=null;
	
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		
		Connection conn=null;
		Member members=null;
		
		
		try {
			conn=ConnectionProvider.getConnection();
			
			String uid=request.getParameter("upw");
			members=dao.selectByUid(conn, uid);			
			
			if(members.getUid().equals(uid)) {
				request.setAttribute("member", members);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "/WEB-INF/views/member/login.jsp";
	}

}
