package com.entity;

import java.util.List;

/**
 * @version 时间：2018年7月8日 下午7:39:09
 *
 */
public interface Vote_subjectMapper {
	List<Vote_subject> selectAll();
	List<Vote_subject> selectByVsTitle(String vsTitle);
	Vote_subject selectByPrimaryKey(Long vsId);
	Integer insertVote_subject(Vote_subject vote_subject);
	int deleteByPrimaryKey(Long vsId);
	int updateByPrimaryKeySelective(Vote_subject vote_subject);
}
