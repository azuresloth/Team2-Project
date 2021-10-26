package com.kh.project.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.admin.vo.BuyStatusVO;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.OrderInfoVO;
import com.kh.project.admin.vo.SalesManageVO;
import com.kh.project.item.vo.ItemVO;

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
		return sqlSession.selectOne("adminMapper.selectNextItemCode");
	}

	@Override
	public void insertImgs(ItemVO itemVO) {
		sqlSession.insert("adminMapper.insertImgs", itemVO);
		
	}

	@Override
	public void insertItem(ItemVO itemVO) {
		sqlSession.insert("adminMapper.insertItem",itemVO);
		
	}

	@Override
	public List<SalesManageVO> selectSalesByCate(SalesManageVO salesManageVO) {
		return sqlSession.selectList("adminMapper.selectSalesByCate", salesManageVO);
	}

	@Override
	public List<OrderInfoVO> selectOderInfoList() {
		return sqlSession.selectList("adminMapper.selectOrderList");
	}

	@Override
	public List<BuyStatusVO> selectStatus() {
		return sqlSession.selectList("adminMapper.selectStatus");
	}



	
	
	
}
