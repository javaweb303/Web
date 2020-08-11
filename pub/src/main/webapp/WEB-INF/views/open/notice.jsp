<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%--본문내용--%>
    
    <div id="wel_cont">
    <div id="bsw_wrap">
    <h2 class="bsw_title">공지사항 글쓰기</h2>
    <form method="post" action="notice_write_ok" >
   
   <table id="notice_t">
   <tr>
   <th>이름</th>
   <td><input name="notice_name" id="notice_name" size="14"> </td>
   </tr>
   <tr>
   <th>제목</th>
   <td><input name="notice_title" id="notice_title" size="33"> </td>
   </tr>
   <tr>
   <th>비밀번호</th>
   <td><input type="password" name="notice_pwd" id="notice_pwd" size="14" /></td>
   </tr>
   <tr>
   <th>글내용</th>
   <td><textarea name="notice_cont" id="notice_cont" rows="8" cols="34"> </textarea></td>
   </tr>
   </table>
   <div id="bsw_menu">
   <input type="submit" value="저장" />
   <input type="reset" value="취소"
   onclick="$('#notice_name').focus();">
   <input type="button" value="목록"
   onclick="location='bbs_list?page=${page}';">
   </div>
    </form>
    </div> 
    </div>
    
