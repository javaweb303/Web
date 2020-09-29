package org.pub.service;

import java.util.List;

import org.pub.vo.FileListVO;
import org.pub.vo.FileVO;
import org.pub.vo.eBookVO;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	/*List<Integer> upload(List<MultipartFile> files,String board);

	List<FileVO> getFile(List<Integer> file_no);

	List<Integer> upload(List<MultipartFile> files);

	void addFiles(int bookno, List<Integer> file_no, String board);

	List<FileListVO> getALL_FileList(String boardcd);

	FileVO getFile(int file_no);

	List<FileListVO> get_e_no_file(int no);

	FileVO get_Fileno(int file_no);

	List<FileListVO> get_enoFileList(int eno);

	FileVO get_enoFile(int file_no);
*/
	void eBookAddUI();

	int Dir_filecount(eBookVO vo);


}
