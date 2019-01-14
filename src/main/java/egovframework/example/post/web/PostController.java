package egovframework.example.post.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import egovframework.example.post.service.PostService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class PostController {
	private final int FIRST_POST = 0;

	@Resource
	private PostService postService;
	
	@RequestMapping(value = "post.do")
	public String postInit(
			@RequestParam HashMap params,
			ModelMap modelMap) throws Exception {
		String postId = (String) params.get("postId");
		
		System.out.println(postId + " 읽는 중");
		
		EgovMap postInfo = postService.selectPostServiceInfo(params, FIRST_POST);
		
		List<EgovMap> categoryList = postService.selectCategoryServiceInfo(postId);
		
		escapeHtml(postInfo);
		
		modelMap.addAttribute("post", postInfo);
		modelMap.addAttribute("categoryList", categoryList);
		return "post/post.tiles";
	}

	private void escapeHtml(EgovMap postInfo) {
		String content = (String)postInfo.get("content");
		postInfo.put("content", HtmlUtils.htmlUnescape(content));
	}

}
