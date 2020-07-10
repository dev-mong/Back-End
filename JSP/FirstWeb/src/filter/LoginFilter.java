package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// 1. 현재 세션 객체를 확인
		HttpServletRequest httpRequest = (HttpServletRequest) request;

		// 현재 세션의 객체
		HttpSession session = httpRequest.getSession(false);

		// 로그인 유무 확인 하는 변수
		boolean login = false;

		if (session != null) {
			if (session.getAttribute("memberInfo") != null) {
				login = false;
			}
		}

		if (login) {
			chain.doFilter(request, response);
		} else {

			// 포워딩 할 페이지 경로
			//String path = "../login/session/sessionLoginForm.jsp";
			//RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			//dispatcher.forward(request,response);
			
			
			//리다이랙트 페이지 경로
			HttpServletResponse httpResponse = (HttpServletResponse)response;
			String location=httpRequest.getContextPath()+"/login/session/sessionLoginForm.jsp";
			httpResponse.sendRedirect(location);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	@Override
	public void destroy() {

	}
}