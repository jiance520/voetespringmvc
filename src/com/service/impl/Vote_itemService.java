package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Vote_item;
import com.entity.Vote_itemMapper;
import com.service.IVote_itemService;

/**
 * @version 时间：2018年7月7日 上午11:20:56
 *
 */
@Service("vote_itemService")
public class Vote_itemService implements IVote_itemService{
	private Vote_itemMapper vote_itemMapper;
//	private Vote_optionMapper vote_optionMapper;
//	private Vote_subjectMapper vote_subjectMapper;
//	private Vote_userMapper vote_userMapper;

	public Vote_itemMapper getVote_itemMapper() {
		return vote_itemMapper;
	}
	@Autowired
	public void setVote_itemMapper(Vote_itemMapper vote_itemMapper) {
		this.vote_itemMapper = vote_itemMapper;
	}
	@Override
	public Integer selectVoteNumByVsId(Long vsId) {
		return vote_itemMapper.selectVoteNumByVsId(vsId);
	}
	@Override
	public Integer selectVoteNumByVsId2(Long vsId) {
		return vote_itemMapper.selectVoteNumByVsId2(vsId);
	}
	@Override
	public Integer insertItem(Vote_item vote_item) {
		return vote_itemMapper.insertItem(vote_item);
	}
	@Override
	public Integer selectOptionNumByVoId(Long voId) {
		return vote_itemMapper.selectOptionNumByVoId(voId);
	}
	@Override
	public int deleteByVoId(Long voId) {
		return vote_itemMapper.deleteByVoId(voId);
	}	
}
