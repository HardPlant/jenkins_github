package egovframework.example.write.web;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.post.service.PostService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class WriteController {

	@Resource
	private PostService postService;

	@RequestMapping(value = "write.do")
	public String writeInit(
			HttpServletRequest request,
			ModelMap modelMap) throws Exception {
	
		List<EgovMap> categoryList = postService.selectCategoryServiceList();
		
		modelMap.addAttribute("categoryList", categoryList);
		
		if(request.getParameter("author") == null) {
			System.out.println("첫 접속");
			
			return "write/write.tiles";
		}
		
		Enumeration<String> names = request.getParameterNames();
		EgovMap params = new EgovMap();
		
		while(names.hasMoreElements()) {
			String key = names.nextElement();
			String[] value = request.getParameterValues(key);
			if (value.length > 1) {
				System.out.println("요청 키 : " + key + ", 값: " + Arrays.toString(value));
				params.put(key, Arrays.toString(value));
			} else {
				System.out.println("요청 키 : " + key + ", 값: " + value[0]);
				params.put(key, value[0]);
			}
		}
		
		if(postService.isValidPost(params)){
//TODO: ServiceImpl에 넣지 않고, 카테고리 배열을 넣는 방법에 대해 알아본다.

			String[] category = request.getParameterValues("selectCategory");
			
			params.put("category", category);
			
			int returnedRows = postService.insertPostServiceInfo(params);
			System.out.println(returnedRows);
			if(returnedRows > 0){
				modelMap.addAttribute("ok", true);
			}
		}
		
		return "write/write.tiles";
	}
	
}
