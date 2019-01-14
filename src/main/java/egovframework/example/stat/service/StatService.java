package egovframework.example.stat.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface StatService {

	List<StatVO> selectStatServiceList() throws Exception;
	List<EgovMap> selectLastWeekServiceList(String date) throws Exception;

}
