package com.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.*;

/**
 * @version 时间：2018年7月9日 下午5:38:53
 *
 */
public class Test {

	public static void main(String[] args) {
		AbstractApplicationContext aac = new ClassPathXmlApplicationContext("applicationContext.xml");
		Map userMap = new HashMap();
		userMap.put("vuUserName", "a");
		userMap.put("vuPassword", "b");
//		IVote_userService ius = (IVote_userService)aac.getBean("vote_userService");
//		IVote_itemService iis = (IVote_itemService)aac.getBean("vote_itemService");
//		IVote_optionService iis = (IVote_optionService)aac.getBean("vote_optionService");
//		System.out.println(iis.selectVoteNumByVsId((long) 1));
		String vsTitle = "最好";
		System.out.println(userMap);
	}

}
