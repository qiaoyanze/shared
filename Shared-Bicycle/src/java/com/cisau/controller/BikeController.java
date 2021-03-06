package com.cisau.controller;

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
import com.cisau.service.BikeService;

@Controller
@RequestMapping(value = "bike")
public class BikeController {

	private Logger logger = LogManager.getLogger(getClass());
	
	@Autowired
	private BikeService bikeService;

	@GetMapping(value = "{bikeCode}")
	@ResponseBody
	public ResponseEntity queryByCode(@PathVariable("bikeCode") String bikeCode) {
		Bike bike = this.bikeService.queryByCode(bikeCode);
		if (bike == null) {
			return new ResponseEntity(500, "没有此单车");
		}
		
		return new ResponseEntity(200, "", bike);
	}
	
	@GetMapping(value = "list")
	public String list(Model model) {
		Pager pager = this.bikeService.list();
		model.addAttribute("pager", pager);
		return "bike/list";
	}
	
	@GetMapping(value = "repair/list")
	public String repairList(Model model) {
		Pager pager = this.bikeService.repairList();
		model.addAttribute("pager", pager);
		return "bike/repairList";
	}

	@PostMapping(value = "add")
	@ResponseBody
	public ResponseEntity add(Bike bike) {
		if (bike == null) {
			return new ResponseEntity(500, "添加单车失败");
		}

		try {
			int i = this.bikeService.insert(bike);
			if (i <= 0) {
				return new ResponseEntity(500, "添加单车失败");
			}
		} catch (Exception e) {
			logger.error("添加单车[{}]异常", bike.getBikeCode(), e);
			return new ResponseEntity(500, "添加单车失败");
		}

		return new ResponseEntity(200, "添加单车成功");
	}
	
	@PostMapping(value = "update")
	@ResponseBody
	public ResponseEntity update(Bike bike,HttpSession session) {
		if (bike == null) {
			return new ResponseEntity(500, "操作失败");
		}

		try {
			User user = (User) session.getAttribute(CommonConstants.LOGIN_USER);
			int i = this.bikeService.update(bike,user.getAccount());
			if (i <= 0) {
				return new ResponseEntity(500, "操作失败");
			}
		} catch (Exception e) {
			logger.error("修改单车[{}]信息异常", bike.getBikeCode(), e);
			return new ResponseEntity(500, "操作失败");
		}

		return new ResponseEntity(200, "操作成功");
	}
}
