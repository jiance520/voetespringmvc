package com.service;

import java.util.List;

import com.entity.Vote_option;

/**
 * @version 时间：2018年7月7日 上午11:19:25
 *
 */
public interface IVote_optionService {
	Integer selectOptionNumByVsId(Long vsId);
	List<Vote_option> selectOptionsByVsId(Long vsId);
	Integer insertVote_option(Vote_option vote_option);
	int updateByPrimaryKeySelective(Vote_option vote_option);
	int deleteByPrimaryKey(Long voId);
}
