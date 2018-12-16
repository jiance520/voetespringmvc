package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Vote_option;
import com.entity.Vote_optionMapper;
import com.service.IVote_optionService;

/**
 * @version 时间：2018年7月7日 上午11:26:07
 *
 */
@Service("vote_optionService")
public class Vote_optionService implements IVote_optionService {
//	private Vote_itemMapper vote_itemMapper;
	private Vote_optionMapper vote_optionMapper;
//	private Vote_subjectMapper vote_subjectMapper;
//	private Vote_userMapper vote_userMapper;

	public Vote_optionMapper getVote_optionMapper() {
		return vote_optionMapper;
	}
	@Autowired
	public void setVote_optionMapper(Vote_optionMapper vote_optionMapper) {
		this.vote_optionMapper = vote_optionMapper;
	}
	@Override
	public Integer selectOptionNumByVsId(Long vsId) {
		return vote_optionMapper.selectOptionNumByVsId(vsId);
	}
	@Override
	public List<Vote_option> selectOptionsByVsId(Long vsId) {
		return vote_optionMapper.selectOptionsByVsId(vsId);
	}
	@Override
	public Integer insertVote_option(Vote_option vote_option) {
		return vote_optionMapper.insertVote_option(vote_option);
	}
	@Override
	public int updateByPrimaryKeySelective(Vote_option vote_option) {
		return vote_optionMapper.updateByPrimaryKeySelective(vote_option);
	}
	@Override
	public int deleteByPrimaryKey(Long voId) {
		return vote_optionMapper.deleteByPrimaryKey(voId);
	}
}
