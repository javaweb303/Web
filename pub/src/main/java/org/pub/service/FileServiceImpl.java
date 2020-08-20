package org.pub.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.pub.dao.FileDAO;
import org.pub.vo.FileListVO;
import org.pub.vo.FileVO;
import org.springframework.beans.ExtendedBeanInfoFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO fileDAO;

	private static final String PATH = "C:/upload";
	//private static final String PREFIX_URL = "/upload/";
	
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
			/*List<MultipartFile> files=new ArrayList<>();
			files.add(img);
			files.add(file);

			System.out.println("originFilename : " + img_filename);
			System.out.println("originFilename : " + file_filename);
			System.out.println("이미지 형식 : " + imgName);
			System.out.println("파일 형식 : " + fileName);
			System.out.println("이미지 크기 : " + imgsize);
			System.out.println("파일 크기 : " + filesize);
			System.out.println("saveFileName : " + saveFileName);*/

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
	}
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
	@Override
	public List<FileVO> getFile(List<Integer> file_no) {
		return fileDAO.getFile(file_no);
	}

	
}
