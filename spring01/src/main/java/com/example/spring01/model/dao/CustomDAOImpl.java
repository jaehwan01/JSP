package com.example.spring01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.CustomDTO;

@Repository
public class CustomDAOImpl implements CustomDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CustomDTO> list(CustomDTO dto) {
		return sqlSession.selectList("custom.list", dto);
	}

	@Override
	public void insert(CustomDTO dto) {
		sqlSession.insert("custom.insert", dto);
	}

	@Override
	public void inserta(CustomDTO dto) {
		sqlSession.insert("custom.inserta", dto);
	}

	@Override
	public CustomDTO detail(String BUSI_NUM) {
		return sqlSession.selectOne("custom.detail", BUSI_NUM);
	}

	@Override
	public void delete(String BUSI_NUM) {
		sqlSession.delete("custom.delete", BUSI_NUM);
	}
	
	@Override
	public void deletea(String BUSI_NUM) {
		sqlSession.delete("custom.deletea", BUSI_NUM);
	}

	@Override
	public void update(CustomDTO dto) {
		sqlSession.update("custom.update", dto);
	}
	
	@Override
	public void updatea(CustomDTO dto) {
		sqlSession.update("custom.updatea", dto);
	}

}
