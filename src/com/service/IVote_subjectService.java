package com.service;

import java.util.List;

import com.entity.Vote_subject;

/**
 * @version 时间：2018年7月7日 上午11:20:07
 *
 */
public interface IVote_subjectService {
	List<Vote_subject> selectAll();
	List<Vote_subject> selectByVsTitle(String vsTitle);
	Vote_subject selectByPrimaryKey(Long vsId);
	Integer insertVote_subject(Vote_subject vote_subject);
	int deleteByPrimaryKey(Long vsId);
	int updateByPrimaryKeySelective(Vote_subject vote_subject);
}
