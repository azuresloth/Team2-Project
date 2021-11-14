package com.kh.project.item.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.cart.vo.BuyInfoVO;
import com.kh.project.item.vo.CategoryVO;
import com.kh.project.item.vo.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ItemVO> selectItemList(ItemVO itemVO) {
		return sqlSession.selectList("itemMapper.selectItemList", itemVO);
	}

	@Override
	public List<ItemVO> selectRecentItemList() {
		return sqlSession.selectList("itemMapper.selectRecentItemList");
	}

	@Override
	public List<ItemVO> selectBestItemList(ItemVO itemVO) {
		return sqlSession.selectList("itemMapper.selectBestItemList", itemVO);
	}

	@Override
	public List<CategoryVO> selectCategoryList() {
		return sqlSession.selectList("itemMapper.selectCategoryList");
	}

	@Override
	public List<ItemVO> mainPageSearchList(ItemVO itemVO) {
		return sqlSession.selectList("itemMapper.mainPageSearchList", itemVO);
	}

	@Override
	public int mainPageSearchCnt(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.mainPageSearchCnt", itemVO);
	}

	@Override
	public ItemVO selectItemDetail(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectItemDetail", itemVO);
	}

	@Override
	public CategoryVO selectPath(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectPath", itemVO);
	}

	@Override
	public int updateItemStock(BuyInfoVO buyInfoVO) {
		return sqlSession.update("itemMapper.updateItemStock", buyInfoVO);
	}

	@Override
	public int selectItemStock(BuyInfoVO buyInfoVO) {
		return sqlSession.selectOne("itemMapper.selectItemStock", buyInfoVO);
	}

	@Override
	public void updateItemStatus(BuyInfoVO buyInfoVO) {
		sqlSession.update("itemMapper.updateItemStatus", buyInfoVO);
	}

	@Override
	public int selectItemListCnt(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectItemListCnt", itemVO);
	}

	@Override
	public int selectSearchListCnt(ItemVO itemVO) {
		return sqlSession.selectOne("itemMapper.selectSearchListCnt", itemVO);
	}
}
