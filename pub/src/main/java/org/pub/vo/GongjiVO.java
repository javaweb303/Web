package org.pub.vo;

public class GongjiVO {

	
	private int gongji_no;
	private String gongji_name;
	private String gongji_title;
	private String gongji_pwd;
	private String gongji_cont;
	private int gongji_hit;
	private String gongji_date;  

	public String getGongji_date() {
		return gongji_date;
	}
	public void setGongji_date(String gongji_date) {
		this.gongji_date = gongji_date.substring(0,10);
	}
	//페이징 관련변수
	private int startrow; //시작행 번호
	private int endrow; //끝행 번호
	
	//검색어와 검색필드 관련 변수
	
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	private String find_field; //검색 필드
	private String find_name; //검색어
	
	public int getGongji_no() {
		return gongji_no;
	}
	public void setGongji_no(int gongji_no) {
		this.gongji_no = gongji_no;
	}
	public String getGongji_name() {
		return gongji_name;
	}
	public void setGongji_name(String gongji_name) {
		this.gongji_name = gongji_name;
	}
	public String getGongji_title() {
		return gongji_title;
	}
	public void setGongji_title(String gongji_title) {
		this.gongji_title = gongji_title;
	}
	public String getGongji_pwd() {
		return gongji_pwd;
	}
	public void setGongji_pwd(String gongji_pwd) {
		this.gongji_pwd = gongji_pwd;
	}
	public String getGongji_cont() {
		return gongji_cont;
	}
	public void setGongji_cont(String gongji_cont) {
		this.gongji_cont = gongji_cont;
	}
	public int getGongji_hit() {
		return gongji_hit;
	}
	public void setGongji_hit(int gongji_hit) {
		this.gongji_hit = gongji_hit;
	}


	
	
	
	}
	

