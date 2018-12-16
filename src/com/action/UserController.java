package com.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Vote_user;
import com.service.IVote_userService;

/**
 * @version 时间：2018年7月8日 下午8:33:29
 *
 */
@Controller
public class UserController {
	private IVote_userService ius;

	public IVote_userService getIus() {
		return ius;
	}
	@Autowired
	public void setIus(IVote_userService ius) {
		this.ius = ius;
	}
	@RequestMapping("RegisterAction")
	public String registerAction(Long vuUserId,String vuUserName,String vuPassword){
		Vote_user vote_user = null;
		vote_user = ius.selectByUserName(vuUserName);
		if(vote_user==null){
			vote_user = new Vote_user();
			vote_user.setVuUserId(vuUserId);
			vote_user.setVuUserName(vuUserName);
			vote_user.setVuPassword(vuPassword);
			vote_user.setVuStatus((long) 1);
			int num = ius.insert(vote_user);
			return "redirect:/login.jsp";
		}
		else{
			return "redirect:/register.jsp";
		}
	}

//	@RequestMapping("RegisterAction")
//	public ModelAndView registerAction(ModelAndView mav){
//		Map modelMap = new HashMap();
//		mav.addAllObjects(modelMap);
//		mav.setViewName("login");
//		return mav;
//	}
}
