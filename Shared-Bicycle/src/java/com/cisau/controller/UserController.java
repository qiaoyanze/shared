package com.cisau.controller;

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

import com.cisau.common.model.Pager;
import com.cisau.common.model.ResponseEntity;
import com.cisau.model.User;
import com.cisau.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	private Logger logger = LogManager.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	@GetMapping(value = "{account}")
	@ResponseBody
	public ResponseEntity userQuery(@PathVariable("account") String account) {
		User user = this.userService.queryByAccount(account);
		if (user == null) {
			return new ResponseEntity(200, "账号没有注册");
		} else {
			return new ResponseEntity(500, "账号已注册");
		}
	}
	
	@GetMapping(value = "list")
	public String userManage(Model model) {
		Pager pager = this.userService.list();
		model.addAttribute("pager", pager);
		return "user/list";
	}
	
	@PostMapping(value = "status")
	@ResponseBody
	public ResponseEntity status(String account,int status) {
		User user = new User();
		user.setAccount(account);
		user.setStatus(status);
		try {
			int i = this.userService.updateUser(user );
			if (i <= 0) {
				return new ResponseEntity(500, "操作失败");
			}
		} catch (Exception e) {
			logger.error("更新用户[{}]的状态异常", account, e);
			return new ResponseEntity(500, "操作失败");
		}
		
		return new ResponseEntity(200, "操作成功");
	}
}
