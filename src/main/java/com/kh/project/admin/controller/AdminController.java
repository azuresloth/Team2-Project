package com.kh.project.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.admin.service.AdminService;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.common.util.FileUploadUtil;
import com.kh.project.item.vo.ImgVO;
import com.kh.project.item.vo.ItemVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@GetMapping("/adminMenu")
	public String goAdminMenu(Model model) {
		model.addAttribute("sidePage", "categoryManage");
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
	public String gosalesManage(Model model) {
		model.addAttribute("sidePage", "salesManage");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		model.addAttribute("salesList", adminService.selectSales());
		return "admin/sales_manage";
	}
	
	@GetMapping("/insertItemForm")
	public String goInsertItem(Model model) {
		model.addAttribute("sidePage", "insertItem");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/insert_item_form";
	}
	
	@PostMapping("/insertItem")
	public String insertItem(ItemVO itemVO, MultipartHttpServletRequest multi) {
		Iterator<String> inputNames = multi.getFileNames();
		
		//첨부될 폴더 지정 
		String uploadPath = "C:\\Users\\kh202-03\\git\\Team2-Project\\src\\main\\webapp\\resources\\images\\item\\itemImages\\";
		
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
	

	
}




















