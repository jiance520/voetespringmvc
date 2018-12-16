package com.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.entity.Vote_item;
import com.entity.Vote_option;
import com.entity.Vote_subject;
import com.entity.Vote_user;
import com.interceptor.Token;
import com.service.IVote_itemService;
import com.service.IVote_optionService;
import com.service.IVote_subjectService;
import com.service.IVote_userService;

/**
 * @version 时间：2018年7月8日 下午8:09:16
 *
 */
@Controller
public class SubjectController{
	private IVote_itemService iis;
	private IVote_optionService ios;
	private IVote_subjectService iss;
	private IVote_userService ius;
	public IVote_itemService getIis() {
		return iis;
	}
	@Autowired
	public void setIis(IVote_itemService iis) {
		this.iis = iis;
	}
	public IVote_optionService getIos() {
		return ios;
	}
	@Autowired
	public void setIos(IVote_optionService ios) {
		this.ios = ios;
	}
	public IVote_subjectService getIss() {
		return iss;
	}
	@Autowired
	public void setIss(IVote_subjectService iss) {
		this.iss = iss;
	}
	public IVote_userService getIus() {
		return ius;
	}
	@Autowired
	public void setIus(IVote_userService ius) {
		this.ius = ius;
	}
	//@Token(remove=true)
	@RequestMapping("LoginAction")
	public ModelAndView loginAction(ModelAndView mav,String vuUserName,String vuPassword,HttpSession session){
		Map userMap = new HashMap();
		userMap.put("vuUserName", vuUserName);
		userMap.put("vuPassword", vuPassword);
		Vote_user vote_user = ius.selectLogin(userMap);
		HashMap modelMap = new HashMap();
		if(vote_user!=null){//读取所有的投票活动item并显示,在该表增加用户、选项、subject属性？多表连接查询？
			session.setAttribute("vote_user", vote_user);//登陆后显示
//			modelMap.put("vote_user", vote_user);
			mav.addAllObjects(modelMap);
			mav.setViewName("forward:LoadAction");
			return mav;
		}
		else{
			mav.setViewName("forward:/login.jsp");
			return mav;
		}
	}
	@RequestMapping("LoadAction")
	public ModelAndView loadAction(ModelAndView mav,HttpSession session){
		List<Vote_subject> subjectList = iss.selectAll();//显示所有投票活动
		List<Map> subjectListMap = new ArrayList();
		HashMap subjectMap = null;//这个map保存活动内容，活动选项，该活动投票人数
		for(Vote_subject vote_subject:subjectList){
			subjectMap = new HashMap();
			subjectMap.put("vote_subject", vote_subject);//选项数
			Integer optionNum = 0;
			optionNum = ios.selectOptionNumByVsId(vote_subject.getVsId());//选项数
			if(optionNum==null){
				optionNum = 0;
			}
			subjectMap.put("optionNum", optionNum);
			Integer voteNum = 0;
			if(vote_subject.getVsType()==1){
				voteNum = iis.selectVoteNumByVsId(vote_subject.getVsId());//单选投票数
			}
			else{
				voteNum = iis.selectVoteNumByVsId2(vote_subject.getVsId());//多选投票数
			}
			if(voteNum==null){
				voteNum = 0;
			}
			subjectMap.put("voteNum", voteNum);
			subjectListMap.add(subjectMap);//用来遍历显示所有投票活动和人数
		}
		HashMap modelMap = new HashMap();
		modelMap.put("subjectListMap", subjectListMap);
		mav.addAllObjects(modelMap);
		mav.setViewName("forward:/subjectlist.jsp");
		return mav;
	}
	@RequestMapping("SearchAction")
	public ModelAndView searchAction(ModelAndView mav,String vsTitle){
		List<Vote_subject> subjectList = iss.selectByVsTitle(vsTitle);
		List<Map> subjectListMap = new ArrayList();
		HashMap subjectMap = null;//这个map保存活动内容，活动选项，该活动投票人数
		for(Vote_subject vote_subject:subjectList){
			subjectMap = new HashMap();
			subjectMap.put("vote_subject", vote_subject);
			Integer optionNum = 0;
			optionNum = ios.selectOptionNumByVsId(vote_subject.getVsId());//选项数
			if(optionNum==null){
				optionNum = 0;
			}
			subjectMap.put("optionNum", optionNum);
			Integer voteNum = 0;
			if(vote_subject.getVsType()==1){
				voteNum = iis.selectVoteNumByVsId(vote_subject.getVsId());//单选投票数
			}
			else{
				voteNum = iis.selectVoteNumByVsId2(vote_subject.getVsId());//多选投票数
			}
			if(voteNum==null){
				voteNum = 0;
			}
			subjectMap.put("voteNum", voteNum);
			subjectListMap.add(subjectMap);//用来遍历显示所有投票活动和人数
		}
//		request.setAttribute("subjectListMap", subjectListMap);
		HashMap modelMap = new HashMap();
		modelMap.put("subjectListMap", subjectListMap);
		mav.addAllObjects(modelMap);
		mav.setViewName("forward:/subjectlist.jsp");
		return mav;
	}
	@RequestMapping("VoteAction")
	public ModelAndView voteAction(ModelAndView mav,Long vsId){
		Vote_subject vote_subject = iss.selectByPrimaryKey(vsId);
		List<Vote_option> vote_optionList = ios.selectOptionsByVsId(vsId);
		Integer voteNum = 0;
		if(vote_subject.getVsType()==1){
			voteNum = iis.selectVoteNumByVsId(vote_subject.getVsId());//单选投票数
		}
		else{
			voteNum = iis.selectVoteNumByVsId2(vote_subject.getVsId());//多选投票数
		}
		if(voteNum==null){
			voteNum = 0;
		}
		Map modelMap = new HashMap();
		modelMap.put("vote_subject", vote_subject);
		modelMap.put("vote_optionList", vote_optionList);
		int optionNum = 0;
		for(Vote_option vote_option:vote_optionList){
			optionNum++;
		}
		modelMap.put("voteNum", voteNum);
		modelMap.put("optionNum", optionNum);//选项数
		mav.addAllObjects(modelMap);
		mav.setViewName("forward:/vote_options.jsp");
		return mav;
	}
	//ajax增加一条投票记录
	@ResponseBody
	@RequestMapping(value="UpdateItemAction",produces={"application/json; charset=UTF-8"})
	public Object updateItemAction(Long vsId,String voIdStr,HttpSession session){
		String[] voIdArr = voIdStr.split(",");
		Vote_user vote_user = (Vote_user)session.getAttribute("vote_user");
		long vuUserId = vote_user.getVuUserId();
		Vote_item vote_item = new Vote_item();
		System.out.println("voIdArr:"+Arrays.toString(voIdArr));
		if(voIdArr!=null){
			for(int i=1; i<voIdArr.length; i++){//i=0是空值，去掉
				Long voId = Long.valueOf(voIdArr[i]);
				vote_item.setVoId(voId);
				vote_item.setVsId(vsId);
				vote_item.setVuUserId(vuUserId);
				iis.insertItem(vote_item);
				System.out.println("插入1条："+vote_item);
			}
		}
		Map modelMap = new HashMap();
		Integer voteNum = 0;
		if(vsId==1){
			voteNum = iis.selectVoteNumByVsId(vsId);//单选投票数
			System.out.println("单选投票数:"+voteNum);
		}
		else{
			voteNum = iis.selectVoteNumByVsId2(vsId);//多选投票数
			System.out.println("多选投票数:"+voteNum);
		}
		if(voteNum==null){
			voteNum = 0;
		}
		modelMap.put("voteNum", voteNum);
		String js = JSON.toJSONString(modelMap);
		return js;
	}
//	ajax查询投票数据
	@ResponseBody
	@RequestMapping(value="AjaxEchartsAction",produces={"application/json; charset=UTF-8"})
	public Object ajaxEchartsAction(Long vsId){
		Vote_subject vote_subject = iss.selectByPrimaryKey(vsId);
		List<Vote_option> vote_optionList = ios.selectOptionsByVsId(vsId);
		Integer voteNum = 0;
		Integer voteNum2 = 0;//多选投票所有选项被选的总次数，用来算占比，item表，通过vsId查option/vote。
		if(vote_subject.getVsType()==1){
			voteNum = iis.selectVoteNumByVsId(vote_subject.getVsId());//单选投票数
			voteNum2 = voteNum;
		}
		else{
			voteNum = iis.selectVoteNumByVsId2(vote_subject.getVsId());//多选投票数
			voteNum2 = iis.selectVoteNumByVsId(vote_subject.getVsId());//多选投票所有选项被选的总次数，用来算占比，item表，通过vsId查option/vote。
		}
		if(voteNum==null){
			voteNum = 0;
		}
		Map modelMap = new HashMap();
		modelMap.put("vote_subject", vote_subject);//活动对象
//		modelMap.put("vote_optionList", vote_optionList);//投票选项集合
//		int optionNum = 0;
//		for(Vote_option vote_option:vote_optionList){
//			optionNum++;
//		}
		modelMap.put("voteNum", voteNum);
		modelMap.put("voteNum2", voteNum2);
//		modelMap.put("optionNum", optionNum);
//		投票选项键值对
		List optionNumList = new ArrayList();
		List optionNameList = new ArrayList();
		List optionPercentList = new ArrayList();
		int option1Num = 0;
		int option1Percent = 0;
		String optionName = "";
		for(Vote_option vote_option:vote_optionList){
			option1Num = iis.selectOptionNumByVoId(vote_option.getVoId());
			optionNumList.add(option1Num);
			optionName = vote_option.getVoOption();
			optionNameList.add(optionName);
		}
		modelMap.put("optionNumList", optionNumList);//选项投票数集合
		modelMap.put("optionNameList", optionNameList);//投票选项名称集合
		String js = JSON.toJSONString(modelMap);
		System.out.println("modelMap:"+modelMap);
		return js;
	}
	@RequestMapping("AddSubjectAction")
	public String addSubjectAction(Vote_subject vote_subject,@RequestParam(value="voOption")String[] voOptions){
		int num = iss.insertVote_subject(vote_subject);
		Vote_option vote_option = new Vote_option();
		for(int i=0;i<voOptions.length;i++){
			vote_option.setVoOption(voOptions[i]);
			vote_option.setVoOrder((long) (i+1));
			vote_option.setVsId(vote_subject.getVsId());
			ios.insertVote_option(vote_option);
		};
		return "forward:LoadAction";
	}
	@RequestMapping("AddOptionAjax")
	public ModelAndView registerAction(ModelAndView mav){
		Map modelMap = new HashMap();
		mav.addAllObjects(modelMap);
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping("ModifyLoadAction")
	public ModelAndView modifyLoadAction(ModelAndView mav){
		List<Vote_subject> subjectList = iss.selectAll();//显示所有投票活动
		List<Map> subjectListMap = new ArrayList();
		HashMap subjectMap = null;//这个map保存活动内容，活动选项，该活动投票人数
		for(Vote_subject vote_subject:subjectList){
			subjectMap = new HashMap();
			subjectMap.put("vote_subject", vote_subject);//选项数
			Integer optionNum = 0;
			optionNum = ios.selectOptionNumByVsId(vote_subject.getVsId());//选项数
			if(optionNum==null){
				optionNum = 0;
			}
			subjectMap.put("optionNum", optionNum);
			Integer voteNum = 0;
			if(vote_subject.getVsType()==1){
				voteNum = iis.selectVoteNumByVsId(vote_subject.getVsId());//单选投票数
			}
			else{
				voteNum = iis.selectVoteNumByVsId2(vote_subject.getVsId());//多选投票数
			}
			if(voteNum==null){
				voteNum = 0;
			}
			subjectMap.put("voteNum", voteNum);
			subjectListMap.add(subjectMap);//用来遍历显示所有投票活动和人数
		}
		HashMap modelMap = new HashMap();
		modelMap.put("subjectListMap", subjectListMap);
		mav.addAllObjects(modelMap);
		mav.setViewName("forward:/subjectmodify.jsp");
		return mav;
	}
	@RequestMapping("ModifyAction")
	public ModelAndView modifyAction(ModelAndView mav,Long vsId){
		Vote_subject vote_subject = iss.selectByPrimaryKey(vsId);
		List<Vote_option> vote_optionList = ios.selectOptionsByVsId(vsId);
		
		Map modelMap = new HashMap();
		modelMap.put("vote_subject", vote_subject);
		modelMap.put("vote_optionList", vote_optionList);
		modelMap.put("vsType", vote_subject.getVsType());
		mav.addAllObjects(modelMap);
		mav.setViewName("forward:update_vote.jsp");
		return mav;
	}
	@RequestMapping("UpdateSubjectAction")
	public String updateSubjectAction(Vote_subject vote_subject,@RequestParam Map<String,String> voOptionMap
			,@RequestParam(value="voOptionAdd",required=false)String[] voOptionAdds){
		int num = iss.updateByPrimaryKeySelective(vote_subject);
		long vsId = vote_subject.getVsId();
		List<Vote_option> vote_optionList = ios.selectOptionsByVsId(vsId);//这里的需要修改或删除，还需要排序
		long orderNum = 1;//用来重新排序的数字
		for(Vote_option vote_option:vote_optionList){
			boolean flag = true;
			for(Map.Entry<String, String> map:voOptionMap.entrySet()){
				if(String.valueOf(vote_option.getVoId()).equals(map.getKey())){
					//如果找到匹配的voId，
					//如果找到的voId非空，那么可以封装这个对象，并重设voOrder排序，并更新内容。
					vote_option.setVoOption(map.getValue());
					vote_option.setVoOrder(orderNum);
					orderNum++;
					ios.updateByPrimaryKeySelective(vote_option);
					flag = false;
					break;
				}
			}
			if(flag){//如果没有在map中找到匹配内容，先删除item中的option，再删除option。
				iis.deleteByVoId(vote_option.getVoId());
				ios.deleteByPrimaryKey(vote_option.getVoId());
			}
		}
		Vote_option vote_option = new Vote_option();
		if(voOptionAdds!=null){
			for(int i=0;i<voOptionAdds.length;i++){
				vote_option.setVoOption(voOptionAdds[i]);
				vote_option.setVoOrder(orderNum);
				orderNum++;
				vote_option.setVsId(vsId);
				ios.insertVote_option(vote_option);
			};
		}
		return "forward:ModifyLoadAction";
	}
	@RequestMapping("DeleteAction")
	public String deleteAction(Long vsId){
		List<Vote_option> vote_optionList = ios.selectOptionsByVsId(vsId);//这里的需要修改或删除，还需要排序
		for(Vote_option vote_option:vote_optionList){
			iis.deleteByVoId(vote_option.getVoId());
			ios.deleteByPrimaryKey(vote_option.getVoId());
		}
		iss.deleteByPrimaryKey(vsId);
		return "forward:ModifyLoadAction";
	}
//	@RequestMapping("RegisterAction")
//	public ModelAndView registerAction(ModelAndView mav){
//		Map modelMap = new HashMap();
//		mav.addAllObjects(modelMap);
//		mav.setViewName("login");
//		return mav;
//	}
}
