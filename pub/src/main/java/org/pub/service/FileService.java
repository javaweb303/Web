package org.pub.service;

import java.util.List;

import org.pub.vo.FileVO;
import org.pub.vo.eBookVO;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	List<Integer> upload(List<MultipartFile> files,String board);

	List<FileVO> getFile(List<Integer> file_no);


}
