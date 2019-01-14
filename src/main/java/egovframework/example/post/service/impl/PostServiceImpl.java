package egovframework.example.post.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.post.service.PostService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class PostServiceImpl implements PostService{

	public static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	public String getCurrentDate() {
		return format.format(new Date());
	}
	
	@Resource
	private PostMapper postMapper;
	
	@Override
	public List<EgovMap> selectPostServiceList() throws Exception {
		return postMapper.selectPostServiceList();
	}

	@Override
	public List<EgovMap> selectPostSummaryServiceList() throws Exception {
		return postMapper.selectPostSummaryServiceList();
	}
	
	@Override
	public List<EgovMap> selectPostSummaryServiceList(int i) throws Exception {
		return postMapper.selectPostSummaryServiceList(i);
	}
	
	@Override
	public EgovMap selectPostServiceInfo(HashMap params, int index) throws Exception {
		List<EgovMap> postList = postMapper.selectPostServiceWithParamList(params);
		
		return postList.get(index);
	}

	@Override
	public List<EgovMap> selectCategoryServiceInfo(String postId) throws Exception {
		return postMapper.selectCategoryServiceInfo(postId);
	}


	@Override
	public List<EgovMap> selectCategoryServiceList() throws Exception {
		return postMapper.selectCategoryServiceList();
	}
	
	@Override
	public int insertPostServiceInfo(EgovMap params) throws Exception {
		params.put("date", getCurrentDate());
		
		postMapper.insertPostServiceInfo(params);
		int postId = (int)params.get("postId");
		
		System.out.println("결과 postId: " + postId);
		params.put("postId", postId);
		
		String[] category = (String[])params.get("category");
		if(category != null) {
			for(String categoryId : category) {
				// TODO: 구현은 되지만 중간에 서버가 꺼지면 안됨
				// 절대 다시 하지 말 것
				if(categoryId == null || categoryId.equals("")) continue;
				
				params.put("categoryId", categoryId);
				System.out.println("현재 categoryId " + categoryId);
				System.out.println(params.get("categoryId"));
				
				this.insertCategoryServiceInfo(params);
			}
		}
		
		return postId;
	}
	
	@Override
	public boolean isValidPost(EgovMap map) {
		String value = (String)map.get("author");
		
		if( value == null || value.equals("")) return false;
		
		value = (String)map.get("author");
		if( value == null || value.equals("")) return false;
		
		value = (String)map.get("title");
		if( value == null || value.equals("")) return false;
		
		value = (String)map.get("subtitle");
		if( value == null || value.equals("")) return false;
		
		return true;
	}

	@Override
	public int insertCategoryServiceInfo(EgovMap params) throws Exception {
		return postMapper.insertCategoryServiceInfo(params);
	}



}
