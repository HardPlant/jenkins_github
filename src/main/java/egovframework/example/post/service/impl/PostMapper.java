package egovframework.example.post.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface PostMapper {

	List<EgovMap> selectPostServiceList() throws Exception;

	List<EgovMap> selectPostSummaryServiceList() throws Exception;
	
	List<EgovMap> selectPostServiceWithParamList(HashMap params) throws Exception;

	int insertPostServiceInfo(EgovMap params) throws Exception;

	List<EgovMap> selectCategoryServiceInfo(String postId) throws Exception;
	List<EgovMap> selectCategoryServiceList() throws Exception;

	int insertCategoryServiceInfo(EgovMap params) throws Exception;

	List<EgovMap> selectPostSummaryServiceList(int i) throws Exception;


}
