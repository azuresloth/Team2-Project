package com.kh.project.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.admin.vo.CategoryVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertCategory(CategoryVO categoryVO) {
		sqlSession.insert("adminMapper.insertCategory", categoryVO);
	}
	
	
	
}
