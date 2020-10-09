package org.pub.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.MailService;
import org.pub.service.MemberService;
import org.pub.service.eBookService;
import org.pub.vo.LoanVO;
import org.pub.vo.MailVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.pub.util.PwdChange;

@Controller
public class MemberController {
   @Autowired//자동 의존성
   private MemberService memberService;
   @Autowired
   private eBookService eBookService;
   @Autowired
   private MailService MailService;
   
   //회원가입 
   @RequestMapping("/join")
   public String join(Model m) {
	   
      return "member/join"; 
   }
   
   //아이디중복검사
   @RequestMapping("/member_idcheck")
   public String member_idcheck(@RequestParam("id") String id,
		   HttpServletResponse response) throws Exception {
	   
	   response.setContentType("text/html; charset=UTF-8");
	   PrintWriter out = response.getWriter();
	   
	   MemberVO db_id= this.memberService.idcheck(id);
	   
	   int re=-1;
	   if(db_id != null) {
		   re=1;
	   }
	   out.println(re); //반환
	   return null;
   } //아이디중복체크
   
   
   
   
   //회원가입 완료 
   @RequestMapping("/join_ok")
   public void join_ok(@ModelAttribute MemberVO m,HttpServletResponse response) throws IOException{
      response.setContentType("text/html;charset=UTF-8");
      
      System.out.println(m);
      String pwd = m.getPw();
      m.setPw (PwdChange.getPassWordToXEMD5String(pwd));
      
     
      
      PrintWriter out=response.getWriter();
      System.out.println(m.getId());
      System.out.println(m.getGender());
      System.out.println(m.getPw());
      System.out.println(m.getBirth());
      System.out.println(m.getName());
      System.out.println(m.getEmail());
      System.out.println(m.getMem_phone1());
      System.out.println(m.getMem_phone2());
      System.out.println(m.getMem_phone3());
      System.out.println(m.getEmail_domain());
      System.out.println(m.getZipNo());
      System.out.println(m.getRoadAddrPart1());
      System.out.println(m.getRoadAddrPart2());
      System.out.println(m.getAddrDetail());
      
      
      System.out.println(m);
      
      memberService.insertMember(m);
      out.println("<script>");
      out.println("alert('회원가입 완료!')");
      out.println("location='/login'");
      out.println("</script>");
   }
   
   
   
   
   //로그인페이지
   @RequestMapping("/login")
   public String login(RedirectAttributes rttr) {
      
      
      return "member/login";
   }
   
   
   //로그인 인증
   @RequestMapping("/login_ok")
   public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws IOException {
      response.setContentType("text/html;charset=UTF-8");
      String id = request.getParameter("id");
      String pwd = (PwdChange.getPassWordToXEMD5String(request.getParameter("pwd")));
      MemberVO vo=memberService.getMember(id); String dbpwd="";
      HttpSession session=request.getSession();
      PrintWriter out=response.getWriter();
      if (vo == null) {
    	  out.println("<script>");
    		out.println("alert('가입 안된 회원입니다!');");
    		out.println("history.back();");
    		out.println("</script>");
        }
      dbpwd=vo.getPw();
      
      ModelAndView mv = new ModelAndView();
      
      MemberVO m=this.memberService.login_check(id);
      
      if(vo.getState() == 2) {
  		out.println("<script>");
  		out.println("alert('탈퇴된 회원입니다!');");
  		out.println("history.back();");
  		out.println("</script>");
  		
  	}
      else {
  	  if(!pwd.equals(dbpwd)) {
  		//암호화 된 비번끼리 비교한다.	
  		  out.println("<script>");
  		  out.println("alert('비번이 다릅니다!');");
  		  out.println("history.go(-1);");
  		  out.println("</script>");
  	  }else if(pwd.equals(dbpwd)){
         session.setAttribute("id", id);
         session.setAttribute("Rank", Integer.toString(vo.getState()));
         out.println("<script>");
         out.println("alert('정상로그인 되었습니다.')");
         mv.setViewName("redirect:/");
         out.println("</script>");
		 return mv;//index매핑주소로 이동
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
				model.addObject("loancount", myloanlist.size());
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
   
   //정보수정 폼
   @RequestMapping("/member_edit")
   public ModelAndView member_edit(HttpServletResponse response,
   		HttpSession session) throws Exception{
   	response.setContentType("text/html;charset=UTF-8");
   	PrintWriter out=response.getWriter();
   	String id=(String)session.getAttribute("id");
   	
   	if(id == null) {
   		out.println("<script>");
   		out.println("alert('다시 로그인 하세요!');");
   		out.println("location='mypage';");
   		out.println("</script>");
   	}else {   		
   		MemberVO m=this.memberService.getMember(id);//오라클로 부터 회원정보를 가져옴.
   		ModelAndView em=new ModelAndView("member/member_edit");
   		em.addObject("m",m);
   		return em;
   	}
   	return null;
   }//member_edit()
   
 //정보수정완료
   @RequestMapping("/edit_ok")
   public String member_edit_ok(HttpServletResponse response,
   		HttpSession session, MemberVO m) throws Exception{
/* MemberVO m은 네임피라미터 이름과 빈클래스 변수명이 일치하면 m객체에 수정한 회원정보가 저장되어 있다.     	
*/
   	response.setContentType("text/html;charset=UTF-8");
   	PrintWriter out=response.getWriter();
   	
   	String id=(String)session.getAttribute("id");
   	if(id == null) {//세션 만료 된 경우=>로그아웃 되었을때
   		out.println("<script>");
   		out.println("alert('다시 로그인 하세요!');");
   		out.println("window.close();");
   		out.println("</script>");
   	}else {
   		m.setId(id);//아이디를 저장
   		
   		this.memberService.updateMember(m);//회원수정
   		
   		out.println("<script>");
   		out.println("alert('회원 수정에 성공했습니다!');");
   		out.println("opener.reload();");
   		out.println("window.close();");
   		out.println("</script>");
   	}//if else
   	return null;
   }//member_edit_ok()
   
   //회원탈퇴
   @RequestMapping("/member_del")
   public ModelAndView member_del(HttpServletResponse response,
		   HttpSession session ) throws Exception {
	   response.setContentType("text/html;charset=UTF-8");
	   PrintWriter out = response.getWriter();
		   
	   String id=(String) session.getAttribute("id");
	   if(id==null) {
		   out.println("<scirpt>");
		   out.println("alert('다시 로그인하세요!');");
		   out.println("locaiton='login';");
		   out.println("</script>");
		   
	   }else {
		   MemberVO m = this.memberService.getMember(id); 
		   ModelAndView dm = new ModelAndView("member/member_del");
		   dm.addObject("m",m);
		   return dm;
	   }
	   return null;
	
   } //회원 탈퇴
	   
	   
	   //회원탈퇴 완료 member_del_ok
	   @RequestMapping("/member_del_ok")
	   public String member_del_ok(HttpServletResponse response,
			   HttpSession session, String del_pwd, String del_cont)
	   throws Exception{
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out = response.getWriter();
		   
		   String id = (String)session.getAttribute("id");
		   if(id == null) {
				out.println("<script>");
	    		out.println("alert('다시 로그인 하세요!');");
	    		out.println("location='login';");
	    		out.println("</script>");
			   
		   }else {
			   del_pwd=PwdChange.getPassWordToXEMD5String(del_pwd);
			   MemberVO db_pwd = this.memberService.getMember(id);
			   if(!db_pwd.getPw().equals(del_pwd)) {
				   out.println("<script>");
				   out.println("alert('비번이 다릅니다. 다시 확인하세요.');");
				   out.println("history.back();");
				   out.println("</script>");
		    }else {
				   MemberVO dm = new MemberVO();
				   dm.setId(id); dm.setDelcont(del_cont);
				   this.memberService.delMem(dm);//탈퇴
				   
				   session.invalidate();
				   
				   out.println("<script>");
				   out.println("alert('회원 탈퇴 했습니다!');");
				   out.println("opener.home();");
				   out.println("window.close();");
				   out.println("</script>");
				   
			   }
			   
		   }
      return null;
	   }
	   @RequestMapping("/change_pw")
	   public String change_pw() {
		   
		   return "member/change_pw";
	   }
	   @RequestMapping("/change_pw_ok")
	   public String change_pw_ok(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out = response.getWriter();
		   String id = (String)session.getAttribute("id");
		   MemberVO vo = memberService.getMember(id);
		   String pw = PwdChange.getPassWordToXEMD5String(request.getParameter("pw"));
		   String changepw =request.getParameter("changepw");
		   System.out.println(changepw);
		   if(pw.equals(vo.getPw())) {
			   vo.setPw(PwdChange.getPassWordToXEMD5String(request.getParameter("changepw")));
			   memberService.updatePwd(vo);
			   session.invalidate();
			   out.println("<script>");
			   out.println("alert('비밀번호가 변경되었습니다!');");
			   out.println("opener.home();");
			   out.println("window.close();");
			   out.println("</script>");
		   }else {
			   out.println("<script>");
			   out.println("alert('비번이 다릅니다. 다시 확인하세요.');");
			   out.println("history.back();");
			   out.println("</script>");
		   }
		   
		   
		   return null;
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
	               entity=new ResponseEntity<String>("FAIL",HttpStatus.OK);
	            }else {
	               entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	            }
	         }catch (Exception e) {
	            e.printStackTrace();
	            entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
	         }
	         return entity;
	      }
	   }
	   

	   @RequestMapping("/pwd_find")
	   public String pwd_find() {
		   return "member/find/pwd_find";
		   
	   } //pwd_find()
	   
	   //비번 찾기 결과
	    @RequestMapping("/pwd_find_ok")
	    public String pwd_find_ok(String pwd_id,String pwd_name, String pwd_email, HttpServletResponse 
	    		response,MemberVO m,Model fm) throws Exception{
	    	response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 문자/태그
	    	//언어코딩 타입 설정
	    	PrintWriter out=response.getWriter();//출력스트림 생성
	    	
	    	m.setId(pwd_id); m.setName(pwd_name); m.setEmail(pwd_email);
	    	System.out.println("아이디:"+m.getId());
	    	System.out.println("회원이름:"+m.getName());
	    	System.out.println("이메일:"+m.getEmail());
	    	
	    	MemberVO pm=this.memberService.pwdMember(m);//아이디와 회원이름을 기준으로 디비로 부터
	    	//회원정보 검색

	    	
	    	if(pm==null) {
	    		out.println("<script>");
	    		out.println("alert('회원정보를 찾을 수 없습니다!');");
	    		out.println("history.back()");
	    		out.println("</script>");/* 자바스크립트에서 history객체는 이전 주소정보를 담고 있다.
	    		이 객체 하위의 back()메서드는 뒤로 한칸이동한다. go(-1)과 같다. */
	    	}else {
	    		String pwd=MailService.r_code();
	    		String newpwd=PwdChange.getPassWordToXEMD5String(pwd);
	    		MailVO mail=new MailVO();
	    		mail.setEmail(m.getEmail());
	    		mail.setDomain(m.getEmail_domain());
	    		mail.setCode(pwd);
	    		mail.setType("find_pwd");
	    		m.setPw(newpwd);//임시 비번 암호화
	    		this.memberService.updatePwd(m);//암호화된 임시비번으로 수정
	    		MailService.mailsend(mail);
	    		out.println("<script>");
	    		out.println("alert('임시비밀번호 발급완료 임시 비밀번호로 로그인 해주세요!');");
	    		out.println("window.close();");
	    		out.println("</script>");
	    		
	    	}
	    	return null;
	    }//pwd_find_ok()
	    
	   
	   //아이디 찾기
	    
	    @RequestMapping("/id_find")
		   public String id_find() {
			   return "member/find/id_find";
	    }
	    
	    //아이디 찾기 결과창
	    @RequestMapping("/id_find_ok")
	    public ModelAndView id_find_ok(String name,String email, HttpServletResponse response, MemberVO m, Model fm) throws Exception{
	    	{
	    	response.setContentType("text/html;charset=UTF-8");
	    	PrintWriter out = response.getWriter();
	    	
	    	ModelAndView model = new ModelAndView();
	    	
	    	m.setName(name); m.setEmail(email);
	    	System.out.println("회원 이름:"+m.getName());
	    	System.out.println("회원 이메일:"+m.getEmail());
	    	
	    	MemberVO fi=this.memberService.findMember(m);
	    	System.out.println(fi.getId());
	    	
	    	if(fi == null) {
	    		out.println("<script>");
	    		out.println("alert('회원정보를 찾을 수  없습니다!');");
	    		out.println("history.back()");
	    		out.println("</script>");
	    		
	    	}else {
	    	model.setViewName("member/find/id_find_ok");
	    	model.addObject("id", fi.getId());
	    	
	    
	    	}
	    	
	    	 return model;
	    	}
	    }
}
	  