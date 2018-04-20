package com.cisau.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.cisau.common.constants.CommonConstants;
import com.cisau.common.model.ResponseEntity;
import com.cisau.model.User;
import com.cisau.service.UserService;

@Controller
public class LoginController {

	private Logger logger = LogManager.getLogger(getClass());

	@Autowired
	private UserService userService;

	@GetMapping(value = "register")
	public String registerPage() {
		return "register";
	}
	
	@GetMapping(value = "register/{account}")
	@ResponseBody
	public ResponseEntity userQuery(@PathVariable("account") String account) {
		User user = this.userService.queryByAccount(account);
		if (user == null) {
			return new ResponseEntity(200, "账号没有注册");
		} else {
			return new ResponseEntity(500, "账号已注册");
		}
	}

	@PostMapping(value = "register")
	@ResponseBody
	public ResponseEntity register(User user) {
		if (user == null) {
			return new ResponseEntity(500, "注册失败");
		}

		try {
			int i = this.userService.save(user);
			if (i <= 0) {
				return new ResponseEntity(500, "注册失败");
			}
		} catch (Exception e) {
			logger.error("保存用户[{}]异常", user.getAccount(), e);
			return new ResponseEntity(500, "注册失败");
		}

		return new ResponseEntity(200, "注册成功");
	}

	@GetMapping(value = "login")
	public String loginPage() {
		return "login";
	}

	@PostMapping(value = "login")
	@ResponseBody
	public ResponseEntity login(String account, String password, HttpSession session) {
		if (StringUtils.isEmpty(account) || StringUtils.isEmpty(password)) {
			return new ResponseEntity(500, "用户名和密码不能为空");
		}

		try {
			User user = this.userService.login(account, password);
			if (user == null) {
				return new ResponseEntity(500, "用户名或密码不正确");
			}

			
			if (User.ROLE_USER == user.getRole()) {
				if (2 == user.getUserInfo().getStatus()) {
					return new ResponseEntity(500, "账号已冻结，请联系管理员");
				}
				
				session.setAttribute(CommonConstants.USER_INFO, user.getUserInfo());
			}
			
			if (User.ROLE_REPAIR == user.getRole()) {
				if (user.getRepairInfo().getIsPass() == 3) {
					return new ResponseEntity(500, "审核未通过,账号不可用");
				}
				session.setAttribute(CommonConstants.REPAIR_INFO, user.getRepairInfo());
			}
			
			session.setAttribute(CommonConstants.LOGIN_USER, user);
		} catch (Exception e) {
			logger.error("查找用户[{}]异常", account, e);
			return new ResponseEntity(500, "登录失败");
		}

		return new ResponseEntity(200, "登录成功");
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.removeAttribute(CommonConstants.LOGIN_USER);
		session.removeAttribute(CommonConstants.USER_INFO);
		session.invalidate();
		return "redirect:login";
	}
}
