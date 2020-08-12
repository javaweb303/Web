package org.pub.dao;

import java.util.List;

import org.pub.vo.FileVO;

public interface FileDAO {

	void in_file(List<FileVO> list);

	List get_fileupload(List<FileVO> list);

	List<FileVO> getFile(List<Integer> file_no);

}
