package egovframework.example.stat.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.post.service.PostService;
import egovframework.example.stat.service.StatService;
import egovframework.example.stat.service.StatVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class StatController {

	@Resource
	private StatService statService;
	
	@Resource
	private PostService postService;
	
	@RequestMapping(value = "stat.do")
	public String statInit(ModelMap modelMap) throws Exception {
	
		List<StatVO> statList = statService.selectStatServiceList(); 
		
		String currentDate = postService.getCurrentDate();
		
		List<EgovMap> last1WeekList = statService.selectLastWeekServiceList(currentDate);
		
		modelMap.addAttribute("statList", statList);
		modelMap.addAttribute("last1WeekList", last1WeekList);
		
		return "stat/stat.tiles";
	}
}
