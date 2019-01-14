package egovframework.example.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.post.service.PostService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {

	@Resource
	PostService postService;
	
	@RequestMapping(value = "main.do")
	public String mainInit(HttpServletRequest request, HttpServletResponse response
			, ModelMap modelMap) throws Exception {
		
		if (request.getParameter("pageName") == null) {
			request.setAttribute("pageName", "main");
		}
		
		modelMap.addAttribute("blogName", "심플블로그");
		modelMap.addAttribute("blogDesc", "부트스트랩 간단블로그");
		
		List<EgovMap> postList = postService.selectPostSummaryServiceList(5);
		System.out.println(postList);
		
		modelMap.addAttribute("postList", postList);
		
		return "main/main.tiles";
	}
	
	@RequestMapping(value = "fullposts.do")
	public String postsInit(HttpServletRequest request, HttpServletResponse response
			, ModelMap modelMap) throws Exception{
		
		modelMap.addAttribute("blogName", "심플블로그");
		modelMap.addAttribute("blogDesc", "부트스트랩 간단블로그");
		
		List<EgovMap> postList = postService.selectPostSummaryServiceList();
		System.out.println(postList);
		
		modelMap.addAttribute("postList", postList);
		modelMap.addAttribute("showFullPostButton", false);
		
		return "main/main.tiles";
	}
}
