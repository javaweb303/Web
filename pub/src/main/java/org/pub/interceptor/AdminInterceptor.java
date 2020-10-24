package org.pub.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.vo.MemberVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	//컨트롤러 실행 전에 실행 => 관리자가 아닌 회원의 관리자 페이지로의 접근을 막음
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception{
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");		
		String state=(String)session.getAttribute("Rank"); //이용자 상태 번호 1.가입회원 2.탈퇴회원 5.관리자
		
		//로그인 안되어있을시 login페이지로 이동
		if(state == null) {
			response.sendRedirect("/login");
			return false;
			
		}
		
		//로그인은 되어있지만 관리자가 아닐 경우 관리자 페이지 접속을 막음
		if(!state.equals("5")) {
			//System.out.println("state:"+state);
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
