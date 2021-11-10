package com.kh.project.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.admin.service.AdminService;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.OrderInfoVO;
import com.kh.project.admin.vo.SalesManageVO;
import com.kh.project.admin.vo.SideMenuVO;
import com.kh.project.board.vo.PageVO;
import com.kh.project.common.util.FileUploadUtil;
import com.kh.project.item.service.ItemService;
import com.kh.project.item.vo.ImgVO;
import com.kh.project.item.vo.ItemVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "itemService")
	private ItemService itemService;
	
	
	@GetMapping("/adminMenu")
	public String goAdminMenu(Model model, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		System.out.println(sideMenuVO.getMenuCode()+"!!!!!!!!!!");
		model.addAttribute("sidePage", "adminMenu");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/reg_category";
	}
	
	@PostMapping("/regCategory")
	public String insertCategory(CategoryVO categoryVO, Model model) {
		adminService.insertCategory(categoryVO);
		return "redirect:/admin/adminMenu";
	}
	
	@PostMapping("/deleteCategory")
	public String deleteCategory(String cateCode) {
		adminService.deleteCategory(cateCode);
		return "redirect:/admin/adminMenu";
	}
	
	@GetMapping("/salesManage")
	public String gosalesManage(Model model, SalesManageVO salesManageVO, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("sidePage", "salesManage");
		model.addAttribute("salesList", adminService.selectSales(salesManageVO));
		model.addAttribute("categoryList", adminService.selectCategoryList());
		model.addAttribute("salesManageVO", salesManageVO);
		return "admin/sales_manage";
	}
	
	@GetMapping("/insertItemForm")
	public String goInsertItem(Model model, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("sidePage", "insertItemForm");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/insert_item_form";
	}
	
	@PostMapping("/insertItem")
	public String insertItem(ItemVO itemVO, MultipartHttpServletRequest multi) {
		Iterator<String> inputNames = multi.getFileNames();
		
		//첨부될 폴더 지정 
		// 호연씨 수업 컴
		String uploadPath = "C:\\Users\\kh202-03\\git\\Team2-Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		// 병준씨 수업 컴, 집컴
		//String uploadPath = "C:\\Users\\kh202-15\\git\\Team2-Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		//String uploadPath = "C:\\workspaceSTS\\Team2 Shop Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		// 준호햄 노트북
		//String uploadPath = "C:\\Users\\82105\\git\\Team2-Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		// 영빈햄 노트북
		//String uploadPath = "C:\\Users\\admin\\git\\Team2-Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		
		//모든 첨부파일 정보가 들어갈 변수
		List<ImgVO> imgList = new ArrayList<>();
		//다음에 들어갈 imgCode의 숫자를 조회
		int nextImgCode = adminService.selectNextNumber();
		//다음에 들어갈 itemCode값 조회
		String itemCode = adminService.selectNextItemCode();
		while (inputNames.hasNext()) {
			String inputName = inputNames.next();
			
			try {
				//다중첨부
				if(inputName.equals("file2")) {
					if(inputName.equals("")) {
						List<MultipartFile> fileList = multi.getFiles(inputName);
						
						for(MultipartFile file : fileList) {
							String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
							String uploadFile = uploadPath + attachedFileName;
							file.transferTo(new File(uploadFile));
							
							ImgVO img = new ImgVO();
							img.setImgCode("IMG_" + String.format("%03d", nextImgCode++));
							img.setOriginImgName(file.getOriginalFilename());
							img.setAttachedImgName(attachedFileName);
							img.setItemCode(itemCode);
							img.setIsMain("N");
							
							imgList.add(img);
						}
					}
					
				}
				//단일첨부
				else {
					MultipartFile file = multi.getFile(inputName);
					String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
					String uploadFile = uploadPath + attachedFileName;
					file.transferTo(new File(uploadFile));
					
					ImgVO img = new ImgVO();
					img.setImgCode("IMG_" + String.format("%03d", nextImgCode++));
					img.setOriginImgName(file.getOriginalFilename());
					img.setAttachedImgName(attachedFileName);
					img.setItemCode(itemCode);
					img.setIsMain("Y");
					
					imgList.add(img);
				}
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//상품정보등록
		itemVO.setItemCode(itemCode);
		adminService.insertItem(itemVO);
		//상품이미지 정보
		itemVO.setImgList(imgList);
		adminService.insertImgs(itemVO);
		
		return "redirect:/admin/insertItemForm";
	}
	@ResponseBody
	@PostMapping("/selectSalesByCateAjax")
	public List<SalesManageVO> selectSalesByCate(SalesManageVO salesManageVO){
		return adminService.selectSalesByCate(salesManageVO);
	}
	
	@RequestMapping("/selectMonthSales")
	public String selectMonthSales(Model model, OrderInfoVO orderInfoVO, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("sidePage", "selectMonthSales");
		model.addAttribute("orderInfoVO", orderInfoVO);
		model.addAttribute("allTotalPrice", adminService.selectAllTotalPrice(orderInfoVO));
		model.addAttribute("orderList", adminService.selectOderInfoList(orderInfoVO));
		return "admin/month_sales";
	}
	@GetMapping("/selectOrderInfo")
	public String selectOrderInfo(Model model, OrderInfoVO orderInfoVO, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("sidePage", "selectOrderInfo");
		model.addAttribute("status", adminService.selectStatus());
		model.addAttribute("statusInfo", adminService.selectStatus());
		model.addAttribute("orderList", adminService.selectOderInfoList(orderInfoVO));
		model.addAttribute("orderVO", orderInfoVO);
		return "admin/order_info";
	}
	
	@ResponseBody
	@PostMapping("/updateStatusAjax")
	public void updateStatus(OrderInfoVO orderInfoVO) {
		adminService.updateStatus(orderInfoVO);
	}
	
	@ResponseBody
	@PostMapping("/serchDateAjax")
	public Map<String, Object> serchDate(OrderInfoVO orderInfoVO){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusInfo", adminService.selectStatus());
		map.put("selectBySerchDateList", adminService.serchDate(orderInfoVO));
		return map;
	}
	
	@RequestMapping("/serchDate")
	public String selectSearchOrderInfo(Model model, OrderInfoVO orderInfoVO, SideMenuVO sideMenuVO) {
		model.addAttribute("sidePage", "selectOrderInfo");
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("statusInfo", adminService.selectStatus());
		model.addAttribute("orderList", adminService.selectOderInfoList(orderInfoVO));
		model.addAttribute("orderVO", orderInfoVO);
		return "admin/order_info";
	}
	//상품목록 조회
	@GetMapping("/itemManage")
	public String selectItem(Model model, PageVO pageVO, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("sidePage", "itemManage");
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("itemList",adminService.selectItem(pageVO));
		return "admin/item_manage";
	}
	
	@GetMapping("/deleteItem")
	public String deleteItem(String itemCode) {
		adminService.deleteItem(itemCode);
		return "redirect:/admin/itemManage";
	}
	
	@GetMapping("/memberList")
	public String memberManage(Model model, SideMenuVO sideMenuVO) {
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("memberList", adminService.selectMember());
		model.addAttribute("sidePage", "memberList");
		return "admin/member_manage";
	}
	
	@GetMapping("/selectMemberDetail")
	public String selectMemberDetail(Model model, String id, SideMenuVO sideMenuVO) {
		sideMenuVO.setMenuCode("MENU_002");
		model.addAttribute("sideMenuList", sideMenu(sideMenuVO));
		model.addAttribute("memberInfo", adminService.selectMemberDetail(id));
		return "admin/member_detail";
	}
	
	@GetMapping("/itemUpdate")
	public String itemUpdate(ItemVO itemVO) {
		adminService.updateItemStatus(itemVO);
		return "redirect:/admin/itemManage";
	}
	
	
	
	
	
	
	
	public List<SideMenuVO> sideMenu( SideMenuVO sideMenuVO){
		return adminService.selectSideMenu(sideMenuVO);
	}
	
	
	
}




















