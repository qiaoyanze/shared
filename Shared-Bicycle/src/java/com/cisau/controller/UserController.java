package com.cisau.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cisau.common.constants.CommonConstants;
import com.cisau.common.model.Pager;
import com.cisau.common.model.ResponseEntity;
import com.cisau.model.Bike;
import com.cisau.model.User;
import com.cisau.model.UserInfo;
import com.cisau.service.BikeService;
import com.cisau.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	private Logger logger = LogManager.getLogger(getClass());

	@Autowired
	private UserService userService;
	@Autowired
	private BikeService bikeService;

	@GetMapping(value = "list")
	public String userManage(Model model) {
		Pager pager = this.userService.list();
		model.addAttribute("pager", pager);
		return "user/list";
	}

	@PostMapping(value = "update")
	@ResponseBody
	public ResponseEntity update(UserInfo userinfo) {
		try {
			int i = this.userService.updateUserInfo(userinfo);
			if (i <= 0) {
				return new ResponseEntity(500, "操作失败");
			}
		} catch (Exception e) {
			logger.error("更新用户[{}]的状态异常", userinfo.getAccount(), e);
			return new ResponseEntity(500, "操作失败");
		}

		return new ResponseEntity(200, "操作成功");
	}

	@GetMapping(value = "info/{account}")
	public String info(@PathVariable("account") String account, Model model) {
		UserInfo info = this.userService.info(account);
		model.addAttribute("info", info);
		return "user/info";
	}

	@GetMapping(value = "enough/banlance")
	@ResponseBody
	public ResponseEntity enoughBanlance(HttpSession session) {
		User user = (User) session.getAttribute(CommonConstants.LOGIN_USER);
		UserInfo info = this.userService.info(user.getAccount());
		if (info.getBalance() == null || BigDecimal.ONE.compareTo(info.getBalance()) == 1) {
			return new ResponseEntity(500, "余额不足1元，请充值后租车");
		}
		return new ResponseEntity(200, "");
	}

	@GetMapping(value = "balance/{account}")
	public String blance(@PathVariable("account") String account, Model model) {
		UserInfo info = this.userService.info(account);
		model.addAttribute("balance", info.getBalance());
		return "user/balance";
	}

	@GetMapping(value = "nearbike")
	public String nearBike(HttpSession session, Model model) {
		User user = (User) session.getAttribute(CommonConstants.LOGIN_USER);
		Bike bike = this.bikeService.queryRentingBike(user.getAccount());
		model.addAttribute("bike", bike);
		return "user/nearBike";
	}

	@GetMapping(value = "nearbike/list")
	public String nearBikeList(String place, Model model) {
		Pager pager = this.userService.nearBikeList(place);
		model.addAttribute("pager", pager);
		return "user/nearBikeList";
	}

	@GetMapping(value = "myrepair/list")
	public String repairBikeList(Model model, HttpSession session) {
		User user = (User) session.getAttribute(CommonConstants.LOGIN_USER);
		Pager pager = this.userService.myRepairBikeList(user.getAccount());
		model.addAttribute("pager", pager);
		return "user/myRepairList";
	}
}
