package com.entity;


/**
 * @version 时间：2018年7月8日 下午7:38:25
 *
 */
public interface Vote_itemMapper {
	Integer selectVoteNumByVsId(Long vsId);
	Integer selectVoteNumByVsId2(Long vsId);
	Integer insertItem(Vote_item vote_item);
	Integer selectOptionNumByVoId(Long voId);
	int deleteByVoId(Long voId);
}
