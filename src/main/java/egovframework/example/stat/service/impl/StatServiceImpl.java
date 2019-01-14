package egovframework.example.stat.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.stat.service.StatService;
import egovframework.example.stat.service.StatVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class StatServiceImpl implements StatService{

	@Resource
	private StatMapper statMapper;

	@Override
	public List<StatVO> selectStatServiceList() throws Exception {
		return statMapper.selectStatServiceList();
	}

	@Override
	public List<EgovMap> selectLastWeekServiceList(String date) throws Exception {
		return statMapper.selectLastWeekServiceList(date);
	}
}
