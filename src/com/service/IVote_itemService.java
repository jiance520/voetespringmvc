package com.service;

import com.entity.Vote_item;

/**
 * @version 时间：2018年7月7日 上午11:18:57
 *
 */
public interface IVote_itemService {
	Integer selectVoteNumByVsId(Long vsId);
	Integer selectVoteNumByVsId2(Long vsId);
	Integer insertItem(Vote_item vote_item);
	Integer selectOptionNumByVoId(Long voId);
	int deleteByVoId(Long voId);
}
