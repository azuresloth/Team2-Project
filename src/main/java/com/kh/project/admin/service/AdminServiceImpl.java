package com.kh.project.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.admin.vo.BuyStatusVO;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.OrderInfoVO;
import com.kh.project.admin.vo.SalesManageVO;
import com.kh.project.admin.vo.SideMenuVO;
import com.kh.project.board.vo.PageVO;
import com.kh.project.item.vo.ItemVO;
import com.kh.project.member.vo.MemberVO;

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
	public List<SalesManageVO> selectSales(SalesManageVO salesManageVO) {
		salesManageVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRowBySales", salesManageVO));
		return sqlSession.selectList("adminMapper.selectSalesList", salesManageVO);
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
		if(salesManageVO.getCateCode().equals(null)) {
			salesManageVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRowBySales", salesManageVO));
		}
		else {
			salesManageVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRowBycateSales", salesManageVO));
		}
		return sqlSession.selectList("adminMapper.selectSalesList", salesManageVO);
	}

	@Override
	public List<OrderInfoVO> selectOderInfoList(OrderInfoVO orderInfoVO) {
		orderInfoVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRow", orderInfoVO));
		
		return sqlSession.selectList("adminMapper.selectOrderList", orderInfoVO);
	}

	@Override
	public List<BuyStatusVO> selectStatus() {
		return sqlSession.selectList("adminMapper.selectStatus");
	}

	@Override
	public void updateStatus(OrderInfoVO orderInfoVO) {
		sqlSession.update("adminMapper.updateStatus", orderInfoVO);
	}

	@Override
	public List<OrderInfoVO> serchDate(OrderInfoVO orderInfoVO) {
		orderInfoVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRow", orderInfoVO));
		return sqlSession.selectList("adminMapper.selectOrderList", orderInfoVO);
	}

	@Override
	public List<ItemVO> selectItem(PageVO pageVO) {
		pageVO.setTotalRow(sqlSession.selectOne("adminMapper.getTotalRowByItem"));
		return sqlSession.selectList("adminMapper.selectItem", pageVO);
	}

	@Override
	public void updateItemStatus(ItemVO itemVO) {
		 sqlSession.update("adminMapper.updateItemStatus", itemVO);
	}

	@Override
	public void deleteItem(String itemCode) {
		sqlSession.delete("adminMapper.deleteItem", itemCode);
	}

	@Override
	public List<SideMenuVO> selectSideMenu(SideMenuVO sideMenuVO) {
		return sqlSession.selectList("adminMapper.selectSideMenu", sideMenuVO);
	}

	@Override
	public List<MemberVO> selectMember() {
		return sqlSession.selectList("adminMapper.selectMemberList");
	}

	@Override
	public MemberVO selectMemberDetail(String id) {
		return sqlSession.selectOne("adminMapper.selectMemberDetail", id);
	}

	@Override
	public int selectAllTotalPrice(OrderInfoVO orderInfoVO) {
		return sqlSession.selectOne("adminMapper.allTotalPrice", orderInfoVO);
	}

	@Override
	public int sisk(String itemCode) {
		return sqlSession.selectOne("adminMapper.sisk",itemCode);
	}


	

	



	
	
	
}
