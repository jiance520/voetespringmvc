package com.service;

import java.util.Map;

import com.entity.Vote_user;

/**
 * @version 时间：2018年7月7日 上午11:20:22
 *
 */
public interface IVote_userService {
	int insert(Vote_user vote_user);
	Vote_user selectLogin(Map map);
	Vote_user selectByUserName(String vuUserName);
}
