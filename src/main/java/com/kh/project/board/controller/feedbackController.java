package com.kh.project.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.board.service.FeedbackService;
import com.kh.project.board.vo.FeedbackVO;
import com.kh.project.common.util.FileUploadUtil;

@Controller
@RequestMapping("/feedback")
public class feedbackController {
	
	@Resource(name = "feedbackService")
	private FeedbackService feedbackService;
	
	@ResponseBody
	@PostMapping("/insertAjax")
	public String insertAjax(FeedbackVO feedbackVO, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
		
		// 여기는 인풋 박스에서 name 에 지정한 속성값이 들어간다. 여기서는 한개만 지정하였다.
		Iterator<String> inputName = multi.getFileNames();
		
		// 첨부될 폴더지정(현제는 집 컴퓨터 폴더)
		String uploadPath = "C:\\Users\\82105\\git\\Team2-Project\\src\\main\\webapp\\resources\\feedback\\images\\";
		
		while (inputName.hasNext()) {
			//한개만 넘기니까 하나만 나온다.
			String fileName = inputName.next();
			MultipartFile file = multi.getFile(fileName);
			String attachedFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
			
			
			String uploadFile = uploadPath + attachedFileName;
			file.transferTo(new File(uploadFile));
			feedbackVO.setOriginalFileName(file.getOriginalFilename());
			feedbackVO.setAttachedFileName(attachedFileName);
			
			System.out.println(feedbackVO); // 
			
			feedbackService.insert(feedbackVO);
			
			
		} //while끝
		return feedbackVO.getItemCode();
	}
	
	// feedBackList ajax로 가져가기
	@ResponseBody
	@PostMapping("/feedbackListAjax")
	public List<FeedbackVO> feedbackListAjax(String itemCode){
		
		System.out.println("feedbackListAjax()");
		return feedbackService.feedbackList(itemCode);
	}
	
	@GetMapping("/reviewBoard")
	public String reviewBoard() {
		
		return "board/review_board";
	}

}
