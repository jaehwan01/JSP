package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.CustomDTO;

public interface CustomDAO {
	
	public List<CustomDTO> list(CustomDTO dto);
	public void insert(CustomDTO dto);
	public void inserta(CustomDTO dto);
	public CustomDTO detail(String BUSI_NUM);
	public void delete(String BUSI_NUM);
	public void deletea(String BUSI_NUM);
	public void update(CustomDTO dto);
	public void updatea(CustomDTO dto);
}
