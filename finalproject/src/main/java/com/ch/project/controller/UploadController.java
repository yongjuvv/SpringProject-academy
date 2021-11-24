package com.ch.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

@Controller
public class UploadController {
	private static final Log LOG = LogFactory.getLog(UploadController.class);

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String showUploadForm() {
		return "fileUpload/upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile mf, Model model, HttpSession session)
			throws IllegalStateException, IOException {
		String fileName = mf.getOriginalFilename();
		int fileSize = (int) mf.getSize();
		mf.transferTo(new File("/" + fileName));
		String path = session.getServletContext().getRealPath("/upload");
		String fpath = path + "/" + fileName;
		FileOutputStream fs = new FileOutputStream(fpath);
		fs.write(mf.getBytes());
		fs.close();
		model.addAttribute("fileName", fileName);
		model.addAttribute("fileSize", fileSize);
		return "uploadResult";
	}
}