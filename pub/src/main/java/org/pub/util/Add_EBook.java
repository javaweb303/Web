package org.pub.util;

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

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import org.apache.commons.io.FileUtils;
import org.pub.service.eBookService;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Add_EBook extends JFrame implements ActionListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private eBookService ebooksService;
	
	private static final String PATH = "C:/upload";

	JTextField title,author,publisher,publication_year;
	JTextArea book_info,author_info,contents;
	JButton img_btn,file_btn,ok_btn,no_btn;
	JLabel img_text,file_text;
	String[] group= {"컴퓨터/모바일","소설/시/희곡","인문학","과학","사회과학","역사","예술/대중문화","가정/요리/뷰티","건강/취미/레저","외국어","종교/역학","어린이",};
	JComboBox<String> combo;
	JFrame frame=new JFrame();
	
	public void UI(){ //프레임 출력하기위한 ..

		frame.setTitle("책등록");
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
		
		frame.add(c);
		
		frame.setSize(510, 500);
		frame.setVisible(true);
		frame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
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
				vo.setCategory(combo.getSelectedItem().toString());
				vo.setBook_introduce(book_info.getText());
			
				System.out.println(vo);
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
				frame.dispose();
			}else {
				JOptionPane.showMessageDialog(null, "빈칸있음..", "빈칸있음", JOptionPane.PLAIN_MESSAGE);
			}
		}else if((JButton)obj == no_btn){
			frame.dispose();
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
