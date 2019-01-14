package egovframework.example.stat.service.impl;

import java.util.List;

import egovframework.example.stat.service.StatVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface StatMapper {

	List<StatVO> selectStatServiceList() throws Exception;

	List<EgovMap> selectLastWeekServiceList(String date) throws Exception;

}
