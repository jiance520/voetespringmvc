package com.entity;

import java.util.List;

/**
 * @version 时间：2018年7月8日 下午7:38:47
 *
 */
public interface Vote_optionMapper {
	Integer selectOptionNumByVsId(Long vsId);
	List<Vote_option> selectOptionsByVsId(Long vsId);
	Integer insertVote_option(Vote_option vote_option);
	int updateByPrimaryKeySelective(Vote_option vote_option);
	int deleteByPrimaryKey(Long voId);
}
