package org.pub.service;

import java.util.List;

import org.pub.vo.eBookVO;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	void upload(List<MultipartFile> files,String board);


}
