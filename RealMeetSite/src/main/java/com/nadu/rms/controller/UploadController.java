package com.nadu.rms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
 
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class UploadController {
	/*@Autowired
	private MethodNameResolver methodNameResolver;*/
	@Autowired
	private String uploadRepository;
	
	
	/*public void setMethodNameResolver(MethodNameResolver methodNameResolver) {
		this.methodNameResolver = methodNameResolver;
	}*/

	public void setUploadRepository(String uploadRepository) {
		this.uploadRepository = uploadRepository;
	}

	static final Logger log = LoggerFactory.getLogger(UploadController.class);
	
	 //파일 업로드 페이지
    @RequestMapping(value = "/file/{esidx}", method = RequestMethod.GET)
    public String home(@PathVariable String esidx) {
    	log.info("/fileUpload에 들어왔습니다.");
    	log.info("esidx는 "+esidx);
        return "modules/commons/file";
    }
    
    @RequestMapping(value = "/filepost", method = RequestMethod.POST) //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(Model model, MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
        log.info("/filepost-post에 들어왔습니다.");
        
        Iterator<String> itr =  multipartRequest.getFileNames();
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            String uploadDir = uploadRepository;
            log.info(uploadDir);
            try {
            	new File(uploadDir).mkdir();
				mpf.transferTo(new File(uploadDir + mpf.getOriginalFilename()));
				if(mpf.getName()==null){
					log.error("업로드에 실패하였습니다.!!!!!!!!!!!!!!!!!");
				}else{
					log.error("업로드에 성공하였습니다.!!!!!!!!!!!!!");
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.info("실패하였습니다.");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.info("실패하였습니다.");
			}
            log.info("FILE_INFO: "+originFileName);; //받은 파일 리스트 출력
       }
       return "success";
    }
}