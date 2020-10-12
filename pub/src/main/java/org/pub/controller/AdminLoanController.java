package org.pub.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pub.service.AdminLoanService;
import org.pub.service.MemberService;
import org.pub.vo.LoanVO;
import org.pub.vo.MemberVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/*")
public class AdminLoanController {

	@Autowired
	private AdminLoanService adminLoanService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/admin_loan")
	private String adLoan(@RequestParam(required = false)String id, Model m, HttpServletRequest request,
			HttpServletResponse response )throws Exception{
		HttpSession session=request.getSession();
		
		System.out.println("id:"+id);
		if(id == null) {
			id=(String)session.getAttribute("id"); 
		}
		MemberVO mem = this.adminLoanService.getMem(id);
		List<LoanVO> lolist = this.adminLoanService.getLoan(id);
		List<eBookVO> elist = this.adminLoanService.getEbookList(id);
		List<eBookVO> relist = this.adminLoanService.getReturn(id);
		eBookVO ebook = this.adminLoanService.getEbook(id);
		//System.out.println("전자책 번호 :"+loan.get(4));
		//eBookVO ebook = this.adminLoanService.getEbook(loan.get(4));
		//eBookVO eBook = this.adminLoanService.getEbook();
		m.addAttribute("mem", mem);
		m.addAttribute("lolist", lolist);
		System.out.println(lolist);
		m.addAttribute("elist", elist);
		m.addAttribute("ebook",ebook);
		m.addAttribute("relist", relist);
		return "/admin/adLoan";
	}
	@RequestMapping("/admin_return")
	public ModelAndView admin_return(int e_no, String id) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		String time = format.format(new Date());//현재시간을 담음
		try {
			int state=2;//반납 상태 2 = 정상 반납, 3 = 연체됨.
			String date=adminLoanService.getReturnDate(id,e_no);//반납일을 가져옴
			Long calOverDate=(long) 0;
			Date receiveDate=format.parse(date);//String을 date형식으로 변환 해당형식으로 변환
			Date Now=format.parse(time);
			long calDate=Now.getTime()-receiveDate.getTime();//시간 계산
			System.out.println(receiveDate);
			long calDateDays = calDate / ( 24*60*60*1000); //일자 구하는
			//calDateDays+=10;
	        //calDateDays = Math.abs(calDateDays);
	        System.out.println(calDateDays);//3일이 초과됨
	        if(calDateDays > 0) {//0보다 크면 아래 문장 실행
	        	System.out.println("연체됨");
	        	state=3;
	        	String over=memberService.getOverDue(id);
	        	if(over != null) {
	        		Date overdate=format.parse(over);
	        		calOverDate=overdate.getTime()-Now.getTime();//남은 연체기간 계산?
	        	}
	        	long overDateDays = calOverDate / ( 24*60*60*1000);
	        	System.out.println("연체일 "+overDateDays);
	        	if(overDateDays > 0) {
	        		int days=(int)(overDateDays+calDateDays);
	        		System.out.println("계산도ㅣㄴ"+days);
	        		memberService.setOverDue(id,(int)(overDateDays+calDateDays));
	        	}else {
	        		memberService.setOverDue(id,(int)calDateDays);
	        	}
	        }
			adminLoanService.book_Return(id,e_no,state);//서비스에서 vo에 담을예정.그후에 추가.
		}catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:/admin/admin_loan?id="+id);
		return m;
	}
}
