package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Vote_itemMapper;
import com.entity.Vote_optionMapper;
import com.entity.Vote_subject;
import com.entity.Vote_subjectMapper;
import com.entity.Vote_userMapper;
import com.service.IVote_subjectService;

/**
 * @version 时间：2018年7月7日 上午11:26:58
 *
 */
@Service("vote_subjectService")
public class Vote_subjectService implements IVote_subjectService {
	private Vote_itemMapper vote_itemMapper;
	private Vote_optionMapper vote_optionMapper;
	private Vote_subjectMapper vote_subjectMapper;
	private Vote_userMapper vote_userMapper;
	
	public Vote_itemMapper getVote_itemMapper() {
		return vote_itemMapper;
	}
	@Autowired
	public void setVote_itemMapper(Vote_itemMapper vote_itemMapper) {
		this.vote_itemMapper = vote_itemMapper;
	}

	public Vote_optionMapper getVote_optionMapper() {
		return vote_optionMapper;
	}
	@Autowired
	public void setVote_optionMapper(Vote_optionMapper vote_optionMapper) {
		this.vote_optionMapper = vote_optionMapper;
	}

	public Vote_subjectMapper getVote_subjectMapper() {
		return vote_subjectMapper;
	}
	@Autowired
	public void setVote_subjectMapper(Vote_subjectMapper vote_subjectMapper) {
		this.vote_subjectMapper = vote_subjectMapper;
	}

	public Vote_userMapper getVote_userMapper() {
		return vote_userMapper;
	}
	@Autowired
	public void setVote_userMapper(Vote_userMapper vote_userMapper) {
		this.vote_userMapper = vote_userMapper;
	}

	public List<Vote_subject> selectAll() {
		return vote_subjectMapper.selectAll();
	}
	@Override
	public List<Vote_subject> selectByVsTitle(String vsTitle) {
		return vote_subjectMapper.selectByVsTitle(vsTitle);
	}
	@Override
	public Vote_subject selectByPrimaryKey(Long vsId) {
		return vote_subjectMapper.selectByPrimaryKey(vsId);
	}
	@Override
	public Integer insertVote_subject(Vote_subject vote_subject) {
		return vote_subjectMapper.insertVote_subject(vote_subject);
	}
	@Override
	public int deleteByPrimaryKey(Long vsId) {
		return vote_subjectMapper.deleteByPrimaryKey(vsId);
	}
	@Override
	public int updateByPrimaryKeySelective(Vote_subject vote_subject) {
		return vote_subjectMapper.updateByPrimaryKeySelective(vote_subject);
	}
}
