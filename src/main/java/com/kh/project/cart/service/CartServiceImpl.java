package com.kh.project.cart.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.cart.vo.BuyInfoVO;
import com.kh.project.cart.vo.CartViewVO;


@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CartViewVO cartViewVo;

	@Override
	public void insertCart(CartViewVO cartViewVO) {
		sqlSession.insert("cartMapper.insertCart", cartViewVO);
	}

	@Override
	public List<CartViewVO> selectCartViewList(CartViewVO cartViewVO) {
		return sqlSession.selectList("cartMapper.selectCartViewList", cartViewVO);
	}

	@Override
	public CartViewVO directSelectCartViewList(CartViewVO cartViewVO) {
		return sqlSession.selectOne("cartMapper.directSelectCartViewList", cartViewVO);
	}

	@Override
	public void deleteSameCart(CartViewVO cartViewVO) {
		sqlSession.delete("cartMapper.deleteSameCart", cartViewVO);
	}

	@Override
	public void updateCartCnt(CartViewVO cartViewVO) {
		sqlSession.update("cartMapper.updateCartCnt", cartViewVO);
	}

	@Override
	public void deleteCartItem(String itemCode, String id) {
		cartViewVo.setId(id);
		cartViewVo.setItemCode(itemCode);
		sqlSession.delete("cartMapper.deleteCartItem", cartViewVo);
	}

	@Override
	public int selectCheckPurchaseData(String itemCode, String id) {
		cartViewVo.setId(id);
		cartViewVo.setItemCode(itemCode);
		return sqlSession.selectOne("cartMapper.selectCheckPurchaseData", cartViewVo);
	}

	@Override
	public int insertBuyInfo(BuyInfoVO buyInfoVO) {
		return sqlSession.insert("cartMapper.insertBuyInfo", buyInfoVO);
	}

	@Override
	public List<BuyInfoVO> selectRecentBoughtInfo(BuyInfoVO buyInfoVO) {
		return sqlSession.selectList("cartMapper.selectRecentBoughtInfo", buyInfoVO);
	}

	@Override
	public String selectBuyDate(BuyInfoVO buyInfoVO) {
		return sqlSession.selectOne("cartMapper.selectBuyDate", buyInfoVO);
	}

	@Override
	public List<BuyInfoVO> selectOrderLookup(BuyInfoVO buyInfoVO) {
		return sqlSession.selectList("cartMapper.selectOrderLookup", buyInfoVO);
	}

	@Override
	public List<BuyInfoVO> selectOrderDetailList(BuyInfoVO buyInfoVO) {
		return sqlSession.selectList("cartMapper.selectOrderDetailList", buyInfoVO);
	}

	@Override 
	public List<String> selectOrderCode(BuyInfoVO buyInfoVO) {
		return sqlSession.selectList("cartMapper.selectOrderCode", buyInfoVO);
	}

	@Override
	public int selectCartAllTotalPrice(CartViewVO cartViewVO) {
		if(sqlSession.selectOne("cartMapper.selectCartAllTotalPrice", cartViewVO) != null) {
			int allTotalPrice = sqlSession.selectOne("cartMapper.selectCartAllTotalPrice", cartViewVO);
			return allTotalPrice;
		}
		else {
			return 0;
		}
	}

}
