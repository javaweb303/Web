package org.pub.dao;

import java.util.List;

import org.pub.vo.FileListVO;
import org.pub.vo.FileVO;

public interface FileDAO {

	void in_file(List<FileVO> list);

	List get_fileupload(List<FileVO> list);

	List<FileVO> getFile(List<Integer> file_no);

	List<Integer> getfile_no(List<FileVO> list);

	void addFiles(int bookno, List<Integer> file_no, String board);

	List<FileListVO> getALL_FileList(String boardcd);

	FileVO getFile(int file_no);

}
