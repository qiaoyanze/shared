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
import com.cisau.model.RepairInfo;
import com.cisau.service.RepairService;

@Controller
@RequestMapping(value = "repair")
public class RepairController {

	private Logger logger = LogManager.getLogger(getClass());

	@Autowired
	private RepairService repairService;

	@GetMapping(value = "list")
	public String list(Model model) {
		Pager pager = this.repairService.list();
		model.addAttribute("pager", pager);
		return "repair/list";
	}
	
	@PostMapping(value = "update")
	@ResponseBody
	public ResponseEntity update(RepairInfo repairInfo) {
		if (repairInfo == null) {
			return new ResponseEntity(500, "操作失败");
		}

		try {
			int i = this.repairService.update(repairInfo);
			if (i <= 0) {
				return new ResponseEntity(500, "操作失败");
			}
		} catch (Exception e) {
			logger.error("审批维修人[{}]异常", repairInfo.getAccount(), e);
			return new ResponseEntity(500, "操作失败");
		}

		return new ResponseEntity(200, "操作成功");
	}
	
	@GetMapping(value = "info/{account}")
	public String info(@PathVariable("account") String account, Model model) {
		RepairInfo info = this.repairService.info(account);
		model.addAttribute("info", info);
		return "repair/info";
	}
}
