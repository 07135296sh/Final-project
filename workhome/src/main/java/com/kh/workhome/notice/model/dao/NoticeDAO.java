package com.kh.workhome.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workhome.common.PageInfo;
import com.kh.workhome.notice.model.vo.Notice;
import com.kh.workhome.notice.model.vo.NoticeFile;

@Repository("nDAO")
public class NoticeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage()-1); 
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nId);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("noticeMapper.addReadCount", nId);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("noticeMapper.deleteNotice", nId);
	}

	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.getSearchResultListCount", map);
	}

	public ArrayList<Notice> selectSearchResultList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage()-1); 
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchResultList", map, rowBounds);
	}

}
