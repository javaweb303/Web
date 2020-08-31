package org.pub.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.pub.vo.eBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class eBookDAOImpl implements eBookDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void upload(eBookVO book) {
		sqlSession.insert("upload",book);
	}

	@Override
	public List<eBookVO> select() {
		return sqlSession.selectList("sel");
	}

	@Override
	public eBookVO selectOne(int no) {
		return sqlSession.selectOne("sel_one", no);
	}

	@Override
	public void up_recommend() {
		sqlSession.update("up_recommend");
	}

	@Override
	public int addBook(eBookVO book) {//ebook테이블에 내용추가하고 생성된 전자책 번호값 반환.
		sqlSession.insert("addBook", book);
		return sqlSession.selectOne("getBook_no",book);
	}

	@Override
	public eBookVO getEbook(int e_no) {
		return sqlSession.selectOne("getEbook", e_no);
	}

	@Override
	public void recommand(String id, int e_no) {//추천
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("e_no", e_no);
		sqlSession.insert("recommand", map);
		sqlSession.update("e_recommand_up", map);
	}

	@Override
	public String getRecommand(String id, int e_no) {
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("e_no", e_no);
		return sqlSession.selectOne("getrecommand", map);
	}

	@Override
	public void non_recommand(String id, int e_no) {//추천 취소
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("e_no", e_no);
		sqlSession.delete("non_recommand", map);
		sqlSession.update("e_recommand_down", map);
	}
}
