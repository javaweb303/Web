package org.pub.service;

import java.awt.Container;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import org.apache.commons.io.FileUtils;
import org.pub.dao.FileDAO;
import org.pub.util.PdfFile_Img;
import org.pub.vo.FileVO;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl extends JFrame implements FileService,ActionListener {

	@Autowired
	private FileDAO fileDAO;

	private static final String PATH = "C:/Upload";
	//private static final String PREFIX_URL = "/upload/";
	/*
	@Override
	public List<Integer> upload(List<MultipartFile> files) {
		List<FileVO> list=new ArrayList<>();
		List<Integer> file_no=new ArrayList<Integer>();
		try {
			for(MultipartFile file:files) {
				FileVO v=new FileVO();
				String filename=file.getOriginalFilename();
				String extname=filename.substring(filename.lastIndexOf("."), filename.length());
				Long filesize = file.getSize();
				v.setOriginal_file_name(filename);
				v.setExt(extname);
				v.setFile_size(filesize);
				v.setFile(file);
				list.add(v);
			} //for
			
			list = genSaveFileName(list);
			writeFile(list);
			for(FileVO v:list) {
				System.out.println("파일 번호 :"+v.getFile_no());
				System.out.println("파일 원본이름 :"+v.getOriginal_file_name());
				System.out.println("파일 저장이름 :"+v.getStored_file_name());
				System.out.println("파일 파일크기 :"+v.getFile_size());
				System.out.println("게시판이름 :"+v.getBoardcd());
				System.out.println("파일형식 :"+v.getExt());
				System.out.println("파일 :"+v.getFile());
				System.out.println("\n-------------------------------------");
			}
			fileDAO.in_file(list);//파일 업로드한 파일정보를 db에 저장하는 쿼리문
			file_no=fileDAO.getfile_no(list);//파일 번호값 가져오는 쿼리문
		}catch (Exception e) {
			e.printStackTrace();
		}
		return file_no;
	}
	
	@Override
	public void addFiles(int bookno, List<Integer> file_no, String board) {
		fileDAO.addFiles(bookno,file_no,board);
	}

	@Override
	public List<FileListVO> getALL_FileList(String boardcd) {
		return fileDAO.getALL_FileList(boardcd);
	}
	
	@Override
	public FileVO getFile(int file_no) {//파일 번호 값으로 가져오는
		return fileDAO.getFile(file_no);
	}
	
	
	
	
	
	
	
	
	@Override
	public List<Integer> upload(List<MultipartFile> files,String board) {
		//파일리스트로 받고 파일 업로드를 요청한 곳에 뭔가를 받아온다. 그걸 저장하고 업로드를 다 처리하고 db에다가 처리한다.
		List<FileVO> list=new ArrayList<>();
		List<Integer> numbers=new ArrayList<>();
		try {
			// 파일 정보
			for(MultipartFile file:files) {
				FileVO v=new FileVO();
				String filename=file.getOriginalFilename();
				String extname=filename.substring(filename.lastIndexOf("."), filename.length());
				Long filesize = file.getSize();
				v.setOriginal_file_name(filename);
				v.setExt(extname);
				v.setFile_size(filesize);
				v.setFile(file);
				v.setBoardcd(board);
				list.add(v);
			}
			
			// 서버에서 저장 할 파일 이름
			list = genSaveFileName(list);
			
			writeFile(list);
			for(FileVO v:list) {
				System.out.println("파일 번호 :"+v.getFile_no());
				System.out.println("파일 원본이름 :"+v.getOriginal_file_name());
				System.out.println("파일 저장이름 :"+v.getStored_file_name());
				System.out.println("파일 파일크기 :"+v.getFile_size());
				System.out.println("게시판이름 :"+v.getBoardcd());
				System.out.println("파일형식 :"+v.getExt());
				System.out.println("파일 :"+v.getFile());
				System.out.println("\n-------------------------------------");
			}
			fileDAO.in_file(list);
			numbers=fileDAO.get_fileupload(list);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return numbers;
	}*/
	// 현재 시간을 기준으로 파일 이름 생성
	//가변인자로 받음..
		private List<FileVO> genSaveFileName(List<FileVO> list) {//저장할 파일확장자명을 가변인자로 받음..
			String fileName = "";
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			
			for(FileVO vo:list) {
				Calendar calendar = Calendar.getInstance();
				String time= df.format(calendar.getTime());
				fileName= time+vo.getExt();
				vo.setStored_file_name(fileName);
			}
			
			return list;
		}
		
		private Map<String,Object> getDate() {//날짜 값 불러오는...? 날자에 해당하는 폴더를 만들라고 만듬..
			SimpleDateFormat yf = new SimpleDateFormat("yyyy");
			SimpleDateFormat mf = new SimpleDateFormat("MM");
			SimpleDateFormat df = new SimpleDateFormat("dd");
			Calendar calendar = Calendar.getInstance();
			String y= yf.format(calendar.getTime());
			String m= mf.format(calendar.getTime());
			String d= df.format(calendar.getTime());
			Map<String,Object> date=new HashMap<>();
			date.put("y", y);
			date.put("m", m);
			date.put("d", d);
			return date;
		}
	private boolean writeFile(List<FileVO> vo)//다수에 파일 받기위해 
			throws IOException{
		boolean result = false;
		byte[] data;
		String ext="";//파일별로 폴더를 분리하기 위한..
		FileOutputStream fos=null;//파일 쓰기..
		String saveFileName="";//파일이름.확장자
		String save_path="";//저장경로를 넣기위한 
		File dir = null;
		Map<String,Object> datemap=getDate();
		String date=datemap.get("y")+"/"+datemap.get("m")+"/"+datemap.get("d");
		for(FileVO v:vo) {
			MultipartFile file=v.getFile();
			//파일 크기를 구함.
			data=file.getBytes();
			
			//리스트로 받은 파일 번호에 따른 파일명 가져오기?
			saveFileName=v.getStored_file_name();
			
			//확장자 분류
			ext = v.getExt();
			
			//확장자에 따른 파일 업로드 폴더를 분류
			if(ext.equals(".png") || ext.equals(".jpeg") || ext.equals(".jpg")) {
				ext="img";
			}else if(ext.equals(".pdf")) {
				ext="book";
			}else {
				ext="temp";
			}
			save_path=PATH + "/" + date + "/" + ext + "/";
			dir = new File(save_path);
			if(!dir.exists()){
				dir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
	        }
			fos = new FileOutputStream(save_path + saveFileName);//받아온파일 만큼 저장?
			fos.write(data);
		}
		fos.close();

		return result;
	}
	/*
	@Override
	public List<FileVO> getFile(List<Integer> file_no) {
		return fileDAO.getFile(file_no);
	}

	@Override
	public List<FileListVO> get_e_no_file(int no) {//새롭게만든
		return fileDAO.get_e_no_file(no);
	}

	@Override
	public FileVO get_Fileno(int file_no) {
		return fileDAO.get_Fileno(file_no);
	}

	@Override
	public List<FileListVO> get_enoFileList(int eno) {
		return fileDAO.get_enoFileList(eno);
	}

	@Override
	public FileVO get_enoFile(int file_no) {
		return fileDAO.get_enoFile(file_no);
	}*/


	@Autowired
	private eBookService ebooksService;
	
	JTextField title,author,publisher,publication_year;
	JTextArea book_info,author_info,contents;
	JButton img_btn,file_btn,ok_btn,no_btn;
	JLabel img_text,file_text;
	String[] group= {"컴퓨터/모바일","소설/시/희곡","인문학","과학","사회과학","역사","예술/대중문화","가정/요리/뷰티","건강/취미/레저","외국어","종교/역학","어린이",};
	JComboBox<String> combo;
	
	@Override
	public void eBookAddUI() { //프레임 출력하기위한 ..

		setTitle("임시");
		Container c=getContentPane();
		c.setLayout(null);
		
		JLabel title_label=new JLabel("제목");
		title=new JTextField(15);
		JLabel author_label=new JLabel("작가");
		author=new JTextField(15);
		JLabel publisher_label=new JLabel("출판사");
		publisher=new JTextField(15);
		JLabel publication_year_label=new JLabel("출판연도");
		publication_year=new JTextField(15);
		JLabel group_lable =new JLabel("그룹");
		combo=new JComboBox<>(group);
		
		JLabel book_info_lable =new JLabel("책 소개");
		book_info=new JTextArea();
		book_info.setLineWrap(true);
		JLabel author_info_lable =new JLabel("작가 소개");
		author_info=new JTextArea();
		author_info.setLineWrap(true);
		JLabel contents_lable =new JLabel("목차");
		contents=new JTextArea();
		contents.setLineWrap(true);
		
		JScrollPane book_info_s =new JScrollPane(book_info);
		JScrollPane author_info_s = new JScrollPane(author_info);
		JScrollPane contents_s = new JScrollPane(contents);
		
		img_text=new JLabel("이미지 경로");
		img_btn=new JButton("이미지");
		file_text=new JLabel("파일 경로");
		file_btn=new JButton("파일");
		img_btn.addActionListener(this);
		file_btn.addActionListener(this);

		
		ok_btn=new JButton("확인");
		no_btn=new JButton("취소");
		ok_btn.addActionListener(this);
		no_btn.addActionListener(this);
		
		//위치 크기 설정
			//라벨
		title_label.setBounds(0, 0, 90, 25);
		author_label.setBounds(250, 0, 90, 25);
		publisher_label.setBounds(0, 30, 90, 25);
		publication_year_label.setBounds(250, 30, 90, 25);
		group_lable.setBounds(0, 60, 90, 25);
		book_info_lable.setBounds(0, 90, 90, 25);
		author_info_lable.setBounds(0, 170, 90, 25);
		contents_lable.setBounds(0, 250, 90, 25);
		img_text.setBounds(90, 330, 400, 25);
		file_text.setBounds(90, 360, 400, 25);
		
			//텍스트 필드
		title.setBounds(90, 0, 150, 25);
		author.setBounds(340, 0, 150, 25);
		publisher.setBounds(90, 30, 150, 25);
		publication_year.setBounds(340, 30, 150, 25);
		combo.setBounds(90, 60, 150, 25);
		
			//덱스트 area
		book_info_s.setBounds(90, 90, 400, 75);
		author_info_s.setBounds(90, 170, 400, 75);
		contents_s.setBounds(90, 250, 400, 75);
			//버튼
		img_btn.setBounds(0, 330, 80, 25);
		file_btn.setBounds(0, 360, 80, 25);
		ok_btn.setBounds(160, 400, 80, 25);
		no_btn.setBounds(270, 400, 80, 25);
		
		c.add(title_label);
		c.add(author_label);
		c.add(publisher_label);
		c.add(publication_year_label);
		c.add(group_lable);
		c.add(book_info_lable);
		c.add(img_text);
		c.add(file_text);
		
		c.add(title);
		c.add(author);
		c.add(publisher);
		c.add(publication_year);
		c.add(combo);
		
		c.add(book_info_s);
		
		c.add(img_btn);
		c.add(file_btn);
		c.add(ok_btn);
		c.add(no_btn);
		
		setSize(510, 500);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	}

	@Override
	public void actionPerformed(ActionEvent e) {//프레임에서 버튼 클릭했을때 발생하는 이벤트처리 하는곳
		Object obj = e.getSource();
        if((JButton)obj == img_btn) {//이미지 버튼클릭시
        	FileDialog imgdialog=new FileDialog(this, "이미지 선택",FileDialog.LOAD);//파일을 불러오는 파일다이어로그를 생성한다. 
        	imgdialog.setVisible(true);//파일다이러로그 보이게 설정.
        	img_text.setText(imgdialog.getDirectory()+imgdialog.getFile());//파일 다이로그에서 선택한 파일의 경로+파일 이름을 img_text라벨 텍스트에 넣어줌.
        }else if((JButton)obj == file_btn) {//파일 버튼 클릭시 위와 비슷함.
        	FileDialog filedialog=new FileDialog(this, "파일 선택",FileDialog.LOAD);
        	filedialog.setVisible(true);
        	file_text.setText(filedialog.getDirectory()+filedialog.getFile());
        }else if((JButton)obj == ok_btn) {//확인 버튼 클릭시
        	String result=chk();//빠진 입력칸을 확인하기 위한 메서드실행후 결과를 result에 담음
        	if(result.equals("ok")) {//결과가 ok이면 아래 문장들을 실행
        	eBookVO vo=new eBookVO();
        	vo.setTitle(title.getText());
        	vo.setAuthor(author.getText());
        	vo.setPublisher(publisher.getText());
        	vo.setPublication_year(publication_year.getText());
        	vo.setGroup(combo(combo.getSelectedItem().toString()));
        	vo.setBook_introduce(book_info.getText());
        	int book_no=ebooksService.addBook(vo);//입력한 내용들을 db에 저장후에 해당 내용에 해당하는 책번호값을 가져옴(dao쪽에 되어있음)
        	System.out.println("no "+book_no);
        	try {
        		System.out.println(file_text.getText());
				InputStream is=new FileInputStream(new File(file_text.getText()));//해당 라벨경로에 있는 파일을 입력스트림에 저장
				PdfFile_Img pdf = new PdfFile_Img();//pdf파일 변환하는 객체생성
				pdf.conversionPdf2Img(is, "ebook", book_no);//해당객체안에있는 pdf파일을 변환하는 메서드에 입력스트림과 제목, 책번호를 넘겨줌
				
				String path=PATH+"/book_img";
				File img_file=new File(img_text.getText());//선택한 이미지를 파일 객체에 담아둠
				byte[] data = FileUtils.readFileToByteArray(img_file);//해당 객채애 담겨있는 크기를 바이트로 변환해서 저장
				String savepath=path+"/"+book_no+"_";//저장할 경로를 지정함
				File dir = new File(savepath);
				if(!dir.exists()){
					dir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
		        }
				FileOutputStream fos=null;
				fos = new FileOutputStream(savepath+"/"+title.getText()+".png");
				fos.write(data);
				fos.close();
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        	text_c();
        	}else {
        		JOptionPane.showMessageDialog(null, "빈칸있음..", "빈칸있음", JOptionPane.PLAIN_MESSAGE);
        	}
        }else if((JButton)obj == no_btn){
        	dispose();
        }else {
        	
        }
	}//엑션 리스너 ?
	String chk() {
		String result="";
		if(!(title.getText().trim()).equals("") && !(author.getText().trim()).equals("") && !(publisher.getText().trim()).equals("") && !(publication_year.getText().trim()).equals("") && !(img_text.getText().trim()).equals("") && !(file_text.getText().trim()).equals("")) {
			System.out.println("확인");
			result="ok";
		}
		return result;
	}
	void text_c() {//입력 박스 초기화
		title.setText("");
		author.setText("");
		publisher.setText("");
		publication_year.setText("");
		
		combo.setSelectedIndex(0);
		
		book_info.setText("");
		author_info.setText("");
		contents.setText("");
		
		img_text.setText("");
		file_text.setText("");
	}


	@Override
	public int Dir_filecount(eBookVO vo) {//폴더에 있는 파일 갯수를 세기위한 (전자책 뷰어에서 파일수만큼 가져오기위해서 ..)
		int file_count=0;
		String path=PATH+"/book/"+vo.getE_no()+"_ebook";
		File dir = new File(path);
	    File[] list = dir.listFiles();
	    for (File i : list) { // 현재경로의 폴더, 파일 갯수 합산
	    	if(i.isFile()) {
	    		file_count++;
	    	}
	    }
		return file_count;
	}
	
	String combo(String item) {
		String groupval="";
		switch (item) {
		case "컴퓨터/모바일":
			groupval="38401";
			break;
		case "소설/시/희곡":
			groupval="38396";
			break;
		case "인문학":
			groupval="38403";
			break;
		case "과학":
			groupval="38405";
			break;
		case "사회과학":
			groupval="38404";
			break;
		case "역사":
			groupval="38397";
			break;
		case "예술/대중문화":
			groupval="38402";
			break;
		case "가정/요리/뷰티":
			groupval="38409";
			break;
		case "건강/취미/레저":
			groupval="56388";
			break;
		case "외국어":
			groupval="38411";
			break;
		case "종교/역학":
			groupval="38410";
			break;
		case "어린이":
			groupval="38406";
			break;
		default:
			break;
		}
		
		return groupval;
	}
	
}
