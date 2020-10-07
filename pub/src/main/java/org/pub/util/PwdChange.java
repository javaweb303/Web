package org.pub.util;

import java.security.MessageDigest;

public class PwdChange
{
	/************ 비밀번호 암호화 *******************/
   public static String getPassWordToXEMD5String(String password) { 
       
    MessageDigest md_Md5 = null;  
      
    try { 
          
    md_Md5 = MessageDigest.getInstance("MD5"); //MD5 암호화 객체 생성
      
      } catch (Exception e) { 
          
      e.printStackTrace(); 
       
    }         
 
      
    String resultString; 
      
    byte[] byteArr; 
       
   String temp = ""; 
         
       
    byteArr = md_Md5.digest(password.getBytes());          
 
       
   for (int i = 0; i < byteArr.length; i++) {             
   resultString = "" + Integer.toHexString((int)byteArr[i] & 0x000000ff);          
   //바이트 배열원소값+16진수 코드를 연결
         
  if( resultString.length() < 2 ) {  
               
   resultString = "0" + resultString; 
           
   }                 
    temp = temp + resultString; 
   }  
       
   return temp;   
  }
}
