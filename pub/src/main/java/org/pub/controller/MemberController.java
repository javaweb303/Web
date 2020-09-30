package org.pub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.MemberService;
import org.pub.service.eBookService;
import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired//자동 의존성
	private MemberService memberService;
	@Autowired
	private eBookService eBookService;

	@RequestMapping("/join")
	public String join(Model m) {
		m.addAttribute("code", "null");
		return "member/join";
	}
	@RequestMapping("/join_ok")
	public void join_ok(@ModelAttribute MemberVO m,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println(m.getId());
		System.out.println(m.getGender());
		System.out.println(m.getPw());
		System.out.println(m.getBirth());
		System.out.println(m.getName());
		System.out.println(m.getEmail());

		memberService.join(m);
		out.println("<script>");
		out.println("alert('회원가입 완료!')");
		out.println("location='/login'");
		out.println("</script>");
	}

	@RequestMapping("/login")
	public String login(RedirectAttributes rttr) {


		return "member/login";
	}

	@RequestMapping("/login_ok")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		PrintWriter out=response.getWriter();
		MemberVO vo=memberService.getMember(id);
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(vo);
		if(vo == null) {
			out.println("<script>");
			out.println("alert('존재 하지않는 회원입니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}else {
			System.out.println(vo.getPw());
			System.out.println(pwd);
			String dbpwd=vo.getPw();
			HttpSession session=request.getSession();
			if(pwd.equals(dbpwd)) {
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("alert('정상로그인 되었습니다.')");
				out.println("location='/'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다. 비밀번호를 확인해주세요');");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}

		return null;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");
		if(id != null) {
			session.invalidate();
			out.println("<script>");
			out.println("alert('정상로그아웃 되었습니다.')");
			out.println("location='/'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('로그인이 안되있는데 말도안되..');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		return null;
	}

	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session,HttpServletResponse response,@RequestParam(value="tab_menu", defaultValue = "my_info") String tab_menu) {
		String id=(String)session.getAttribute("id");
		ModelAndView model = new ModelAndView();
		if(id != null) {
			MemberVO mem=memberService.getMember(id);
			List<LoanVO> loanlist=eBookService.book_LoanList(id);//해당아이디에 해당하는 대출목록을 받아옴
			List<eBookVO> myloanlist=new ArrayList<>();
			//대출목록을 이용해서 파일 이미지를 가져옴 그리고 ebookVO에 해당 이미지 경로를 넣어줌.그리고 전자책 정보를 담아서 념김.
			for(LoanVO loan:loanlist) {
				int eno = loan.getE_no();//대출목록에있는 전자책번호를 저장.
				eBookVO vo=eBookService.getEbook(eno);
				vo.setLoan_date(loan.getLoan_date().substring(0, 10));
				vo.setReturn_date(loan.getReturn_date().substring(0, 10));
				System.out.println(vo);
				myloanlist.add(vo);
			}
			model.setViewName("/member/mypage");
			model.addObject("member_info", mem);
			model.addObject("myloanlist", myloanlist);
			model.addObject("tab_send", tab_menu);
		}else {
			model.setViewName("/member/login");
		}
		return model;
	}
}

@RestController
class rest_member {
	@Autowired//자동 의존성
	private MemberService memberService;

	@RequestMapping("/idcheck")
	public ResponseEntity<String> id_check(@RequestBody Map<String,Object> m){
		ResponseEntity<String> entity=null;
		try{
			MemberVO vo=memberService.getMember(m.get("id").toString());
			if(vo != null) {

			}else {

			}
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.BAD_REQUEST);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
