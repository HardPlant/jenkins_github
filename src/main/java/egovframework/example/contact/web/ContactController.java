package egovframework.example.contact.web;

import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {

	@RequestMapping(value = "contact.do")
	public String contactInit(HttpServletRequest requests) throws Exception {
		
		Enumeration<String> params = requests.getParameterNames();
		
		while(params.hasMoreElements()) {
			String currentKey = params.nextElement();
			System.out.println(currentKey);
			
			String[] values = requests.getParameterValues(currentKey);
			
			if(values.length > 1){
				System.out.println(Arrays.toString(values));				
			} else {
				System.out.println(values[0]);
			}
		}
		
		return "contact/contact.tiles";
	}
	@RequestMapping(value = "thank.do")
	public String thankInit(HttpServletRequest requests) throws Exception {
		
		Enumeration<String> params = requests.getParameterNames();
		
		while(params.hasMoreElements()) {
			String currentKey = params.nextElement();
			System.out.println(currentKey);
			
			String[] values = requests.getParameterValues(currentKey);
			
			if(values.length > 1){
				System.out.println(Arrays.toString(values));				
			} else {
				System.out.println(values[0]);
			}
		}
		
		return "contact/contact.tiles";
	}
}
