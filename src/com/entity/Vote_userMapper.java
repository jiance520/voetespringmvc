package com.entity;

import java.util.Map;

/**
 * @version 时间：2018年7月8日 下午7:39:23
 *
 */
public interface Vote_userMapper {
	int insert(Vote_user vote_user);
	Vote_user selectLogin(Map map);
	Vote_user selectByUserName(String vuUserName);
}
