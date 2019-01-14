package egovframework.example.about.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {

	@RequestMapping(value = "about.do")
	public String aboutInit(ModelMap modelMap) throws Exception{
		
		modelMap.addAttribute("about", "A Developer");
		modelMap.addAttribute("about", "A Developer like");
		
		return "about/about.tiles";
	}
}
