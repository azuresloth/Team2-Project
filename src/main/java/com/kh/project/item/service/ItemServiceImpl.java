package com.kh.project.item.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.item.vo.CategoryVO;
import com.kh.project.item.vo.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ItemVO> selectItemList() {
		return sqlSession.selectList("itemMapper.selectItemList");
	}

	@Override
	public List<ItemVO> selectRecentItemList() {
		return sqlSession.selectList("itemMapper.selectRecentItemList");
	}

	@Override
	public List<ItemVO> selectBestItemList() {
		return sqlSession.selectList("itemMapper.selectBestItemList");
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
}
