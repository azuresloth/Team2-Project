package com.kh.project.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.cart.service.CartService;
import com.kh.project.cart.vo.CartViewVO;
import com.kh.project.cart.vo.DeliveryInfoVO;
import com.kh.project.common.service.CommonService;
import com.kh.project.common.vo.EmailAndTellVO;
import com.kh.project.item.service.ItemService;
import com.kh.project.item.vo.ItemVO;
import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource(name = "itemService")
	private ItemService itemService;
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "cartService")
	private CartService cartService;
	@Resource(name = "memberService")
	private MemberService memberService;
	
	// 장바구니에 추가 메소드(추가후 장바구니페이지로 이동할지 물어봄)
	//(상세페이지 에서 1.에이작스로? or 2.페이지이동으로?)
	
	// 장바구니 페이지로 이동
	@PostMapping("/goCartList")
	public String goCartList(Model model, ItemVO itemVO) {

		return "cart/cart_list";
	}
	
	// 구매 페이지로 이동
	//@PostMapping("/goPurchasePage")
	@RequestMapping("/goPurchasePage")
	public String goPurchasePage(Model model, CartViewVO cartViewVO, String requestURI, String insOrUpd) {
		System.out.println(requestURI);
		if(requestURI.equals("/cart/goCartList")) {
			System.out.println(1);
			model.addAttribute("cartList", cartService.selectCartViewList(cartViewVO));
			model.addAttribute("requestURI", requestURI);
		}
		else if(requestURI.equals("/item/itemDetail")){
			if(insOrUpd.equals("0")) {
				// 추가쿼리
				System.out.println("추가쿼리탐");
				cartService.insertCart(cartViewVO);
			}
			else if(insOrUpd.equals("1")) {
				// cnt 수정쿼리
				System.out.println("수정쿼리탐");
				cartService.updateCartCnt(cartViewVO);
				
			}
			System.out.println(insOrUpd+2+"!!!!!!!!!상세정보에서 바로구매!!!!!!!!!!!!");
			System.out.println(cartViewVO.getItemCode());
			return "redirect:/cart/goDirectPurchasePage?itemCode="+cartViewVO.getItemCode()+"&id="+cartViewVO.getId();
		}
		return "cart/purchase_page";
	}
	
	// 바로구매시 redirect 메소드(새로고침 오류땜에 만듬)(장바구니에서 가는거도 하나더 만들어야함)
	@GetMapping("/goDirectPurchasePage")
	public String goDirectPurchasePage(Model model, CartViewVO cartViewVO, EmailAndTellVO emailandTellVO) {
		System.out.println(cartViewVO.getItemCode()+ "1234556666" + cartViewVO.getId());
		model.addAttribute("buyItemInfo", cartService.directSelectCartViewList(cartViewVO));
		model.addAttribute("basicDeliveryInfo", memberService.selectBuyMemberInfo(cartViewVO));
		// 이메일, 전화번호 쪼개서 던지기
		MemberVO splitTellEmail = memberService.selectBuyMemberInfo(cartViewVO);
		setTellEmailfun(splitTellEmail);
		
		model.addAttribute("emailandTellInfo", setTellEmailfun(splitTellEmail));
		
		return "cart/purchase_page";
	}
	
	//------------------------- 에이작스 
	
	// 카트에 동일제품 체크
	@ResponseBody
	@PostMapping("/checkCartAjax")
	public CartViewVO checkCartAjax(CartViewVO cartViewVO) {
		System.out.println("동일제품 체크 에이작스");
		return cartService.directSelectCartViewList(cartViewVO);
	}
	
	// 카트의 동일제품 삭제
	@ResponseBody
	@PostMapping("/deleteSameCartAjax")
	public void deleteSameCartAjax(CartViewVO cartViewVO) {
		System.out.println("동일제품 삭제 에이작스");
		cartService.deleteSameCart(cartViewVO);
	}
	
	// 배송정보에 회원정보 넣기
	@ResponseBody
	@PostMapping("/selectMemberDeliveryInfoAjax")
	public DeliveryInfoVO selectMemberDeliveryInfo(CartViewVO cartViewVO, DeliveryInfoVO deliveryInfoVO) {
		MemberVO deli = memberService.selectBuyMemberInfo(cartViewVO);
		deliveryInfoVO.setDeliveryName(deli.getName());
		deliveryInfoVO.setPostCode(deli.getPostCode());
		deliveryInfoVO.setRoadAddr(deli.getRoadAddr());
		deliveryInfoVO.setDetailAddr(deli.getDetailAddr());
		EmailAndTellVO emailAndTell = setTellEmailfun(deli);
		deliveryInfoVO.setDeliveryEmail(emailAndTell.getEmail());
		deliveryInfoVO.setEmail1(emailAndTell.getEmail1());
		deliveryInfoVO.setEmail2(emailAndTell.getEmail2());
		deliveryInfoVO.setDeliveryTell(emailAndTell.getTell());
		deliveryInfoVO.setTell1(emailAndTell.getTell1());
		deliveryInfoVO.setTell2(emailAndTell.getTell2());
		deliveryInfoVO.setTell3(emailAndTell.getTell3());
		return deliveryInfoVO;
	}
	
	
	// 이메일, 연락처 쪼개는 메소드
	public EmailAndTellVO setTellEmailfun(MemberVO memberVO) {
		EmailAndTellVO emailAndTellVO = new EmailAndTellVO();
		String email = memberVO.getEmail();
		int idx = email.indexOf("@");
		String email1 = email.substring(0, idx);
		String email2 = email.substring(idx+1);
		emailAndTellVO.setEmail(email);
		emailAndTellVO.setEmail1(email1);
		emailAndTellVO.setEmail2(email2);
		
		String tell = memberVO.getTell();
		String tell1 = "0", tell2 = "0", tell3 = "0";
		String tells[] = tell.split("-");
		for(int i = 0 ; i < tells.length ; i++) {
			if(i == 0) {
				tell1 = tells[i];
			}
			else if(i == 1) {
				tell2 = tells[i];
			}
			else if(i == 2) {
				tell3 = tells[i];
			}
		}
		emailAndTellVO.setTell(tell);
		emailAndTellVO.setTell1(tell1);
		emailAndTellVO.setTell2(tell2);
		emailAndTellVO.setTell3(tell3);
		return emailAndTellVO;
	}
	
	
	
	
	
}
