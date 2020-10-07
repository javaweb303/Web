package org.pub.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.vo.MemberVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	//컨트롤러 실행 전에 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception{
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");		
		String state=(String)session.getAttribute("Rank");
		
		if(state == null) {
			response.sendRedirect("/join");
			return false;
			
		}
		
		if(!state.equals("5")) {
			//System.out.println("state:"+state);
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
