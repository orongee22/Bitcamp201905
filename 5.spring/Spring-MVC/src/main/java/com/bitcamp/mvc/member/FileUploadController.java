    
package com.bitcamp.mvc.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.mvc.domain.Report;

@Controller
public class FileUploadController {
	
	// 업로드할 파일 저장 경로 설정.
	String path = "/uploadfile";
	
	@RequestMapping("/fileupload/uploadForm")
	public String getForm() {
		return "fileupload/uploadForm";
	}
	@RequestMapping(value = "/fileupload/upload1", method = RequestMethod.POST)
	public String upload1(
			@RequestParam("sno") String sno,
			@RequestParam("report") MultipartFile file,
			Model model,
			HttpServletRequest request
			) {
		
		model.addAttribute("sno", sno);
		model.addAttribute("fileName", file.getOriginalFilename());
		model.addAttribute("fileSize", file.getSize());
		
		// 파일의 절대경로 구하기. 
		String dir = request.getSession().getServletContext().getRealPath(path);
		try {
			if(!file.isEmpty() && file.getSize()>0) {
				// dir(위에서 지정한 파일이 있는 절대경로)
				// 절대경로 폴더 속에서 파일이름을 찾아 file형식으로 변환시켜주는 메소드임.
				file.transferTo(new File(dir, sno+file.getOriginalFilename()));
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "fileupload/upload";
	}

	@RequestMapping(value = "/fileupload/upload2", method = RequestMethod.POST)
	public String upload1(
			MultipartHttpServletRequest request,
			Model model
			) {
		
		String sno = request.getParameter("sno");
		MultipartFile file = request.getFile("report");
		
		model.addAttribute("sno", sno);
		model.addAttribute("fileName", file.getOriginalFilename());
		model.addAttribute("fileSize", file.getSize());
		
		return "fileupload/upload";
	}

	@RequestMapping(value = "/fileupload/upload3", method = RequestMethod.POST)
	public String upload1(Report report) {
		
		return "fileupload/upload";
	}

}