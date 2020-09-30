package org.pub.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

public class PdfFile_Img {
	public List<String> conversionPdf2Img(InputStream is, String bookname, int bookno) throws FileNotFoundException {
        List<String> savedImgList = new ArrayList<>(); //저장된 이미지 경로를 저장하는 List 객체
        try {
            PDDocument pdfDoc = PDDocument.load(is); //Document 생성
            PDFRenderer pdfRenderer = new PDFRenderer(pdfDoc);

            String resultImgPath = "c:/upload/book/"+bookno+"_"+bookname; //이미지가 저장될 경로
            Files.createDirectories(Paths.get(resultImgPath)); //PDF 2 Img에서는 경로가 없는 경우 이미지 파일이 생성이 안되기 때문에 디렉토리를 만들어준다.

            //순회하며 이미지로 변환 처리
            for (int i=0; i<pdfDoc.getPages().getCount(); i++) {
                String imgFileName = resultImgPath + "/" + i + ".png";
					
                //DPI 설정
                BufferedImage bim = pdfRenderer.renderImageWithDPI(i, 300, ImageType.RGB);

                // 이미지로 만든다.
                ImageIOUtil.writeImage(bim, imgFileName , 300);

                //저장 완료된 이미지를 list에 추가한다.
                savedImgList.add(imgFileName);
            }
            pdfDoc.close(); //모두 사용한 PDF 문서는 닫는다.
        }
        catch (FileNotFoundException e) {}
        catch (IOException e) {}
        return savedImgList;
    }

	public List<String> conversionPdf2Img(InputStream is, String e_title, String isbn) {
		List<String> savedImgList = new ArrayList<>(); //저장된 이미지 경로를 저장하는 List 객체
        try {
            PDDocument pdfDoc = PDDocument.load(is); //Document 생성
            PDFRenderer pdfRenderer = new PDFRenderer(pdfDoc);

            String resultImgPath = "c:/upload/book/"+isbn+"_"+e_title; //이미지가 저장될 경로
            Files.createDirectories(Paths.get(resultImgPath)); //PDF 2 Img에서는 경로가 없는 경우 이미지 파일이 생성이 안되기 때문에 디렉토리를 만들어준다.

            //순회하며 이미지로 변환 처리
            for (int i=0; i<pdfDoc.getPages().getCount(); i++) {
                String imgFileName = resultImgPath + "/" + i + ".png";
					
                //DPI 설정
                BufferedImage bim = pdfRenderer.renderImageWithDPI(i, 300, ImageType.RGB);

                // 이미지로 만든다.
                ImageIOUtil.writeImage(bim, imgFileName , 300);

                //저장 완료된 이미지를 list에 추가한다.
                savedImgList.add(imgFileName);
            }
            pdfDoc.close(); //모두 사용한 PDF 문서는 닫는다.
        }
        catch (FileNotFoundException e) {}
        catch (IOException e) {}
        return savedImgList;
	}
}
