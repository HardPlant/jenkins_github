package egovframework.example.post.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface PostService {

	List<EgovMap> selectPostServiceList() throws Exception;
	List<EgovMap> selectPostSummaryServiceList() throws Exception;

	int insertPostServiceInfo(EgovMap params) throws Exception;
	
	EgovMap selectPostServiceInfo(HashMap params, int index) throws Exception;
	
	List<EgovMap> selectCategoryServiceList() throws Exception;
	List<EgovMap> selectCategoryServiceInfo(String postId) throws Exception;

	int insertCategoryServiceInfo(EgovMap params) throws Exception;
	
	boolean isValidPost(EgovMap params);
	String getCurrentDate();
	
	List<EgovMap> selectPostSummaryServiceList(int i) throws Exception;
}
