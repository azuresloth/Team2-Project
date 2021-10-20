package com.kh.project.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.SalesManageVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertCategory(CategoryVO categoryVO) {
		sqlSession.insert("adminMapper.insertCategory", categoryVO);
	}

	@Override
	public List<CategoryVO> selectCategoryList() {
		return sqlSession.selectList("adminMapper.selectCategoryList");
	}

	@Override
	public void deleteCategory(String cateCode) {
		sqlSession.delete("adminMapper.deleteCategory", cateCode);
	}

	@Override
	public List<SalesManageVO> selectSales() {
		return sqlSession.selectList("adminMapper.selectSalesList");
	}

	@Override
	public int selectNextNumber() {
		return sqlSession.selectOne("adminMapper.selectNextNumber");
	}

	@Override
	public String selectNextItemCode() {
		return "adminMapper.selectNextItemCode";
	}
	
	
	
}
