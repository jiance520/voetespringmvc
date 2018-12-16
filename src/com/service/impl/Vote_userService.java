package com.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Vote_user;
import com.entity.Vote_userMapper;
import com.service.IVote_userService;

/**
 * @version 时间：2018年7月7日 上午11:27:49
 *
 */
@Service("vote_userService")
public class Vote_userService implements IVote_userService{
//	private Vote_itemMapper vote_itemMapper;
//	private Vote_optionMapper vote_optionMapper;
//	private Vote_subjectMapper vote_subjectMapper;
	private Vote_userMapper vote_userMapper;
	
	public Vote_userMapper getVote_userMapper() {
		return vote_userMapper;
	}
	@Autowired
	public void setVote_userMapper(Vote_userMapper vote_userMapper) {
		this.vote_userMapper = vote_userMapper;
	}
	@Override
	public int insert(Vote_user vote_user) {
		return vote_userMapper.insert(vote_user);
	}
	@Override
	public Vote_user selectLogin(Map map) {
		return vote_userMapper.selectLogin(map);
	}
	@Override
	public Vote_user selectByUserName(String vuUserName) {
		return vote_userMapper.selectByUserName(vuUserName);
	}
	
	
}
