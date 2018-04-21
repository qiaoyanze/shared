package com.cisau.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.alibaba.druid.util.StringUtils;
import com.cisau.common.model.Pager;
import com.cisau.common.model.ResponseEntity;
import com.cisau.model.PlaceDict;
import com.cisau.service.PlaceDictService;

@Controller
@RequestMapping(value = "location")
public class LocationController {

	private Logger logger = LogManager.getLogger(getClass());

	@Autowired
	private PlaceDictService placeDictService;

	@GetMapping(value = "dicts")
	@ResponseBody
	public List<PlaceDict> dicts() {
		List<PlaceDict> dicts = this.placeDictService.queryDicts();
		if (null == dicts) {
			dicts = new ArrayList<>();
		}
		return dicts;
	}

	@GetMapping(value = "info")
	public String info() {
		return "location/info";
	}

	@GetMapping(value = "list")
	public String list(Model model) {
		Pager pager = this.placeDictService.list();
		model.addAttribute("pager", pager);
		return "location/list";
	}

	@GetMapping(value = "{name}")
	@ResponseBody
	public ResponseEntity name(@PathVariable("name") String name) {
		if (StringUtils.isEmpty(name)) {
			return new ResponseEntity(500, "位置不能为空");
		}

		PlaceDict dict = this.placeDictService.queryByName(name);
		if (dict == null) {
			return new ResponseEntity(200, "");
		} else {
			return new ResponseEntity(500, "已存在该位置");
		}
	}

	@PostMapping(value = "add")
	@ResponseBody
	public ResponseEntity add(PlaceDict dict) {
		if (dict == null) {
			return new ResponseEntity(500, "添加位置失败");
		}

		try {
			int i = this.placeDictService.insert(dict);
			if (i <= 0) {
				return new ResponseEntity(500, "添加位置失败");
			}
		} catch (Exception e) {
			logger.error("添加位置[{}]异常", dict.getName(), e);
			return new ResponseEntity(500, "添加位置失败");
		}

		return new ResponseEntity(200, "添加位置成功");
	}

	@PostMapping(value = "del")
	@ResponseBody
	public ResponseEntity del(String name) {
		if (StringUtils.isEmpty(name)) {
			return new ResponseEntity(500, "删除失败");
		}

		try {
			this.placeDictService.delete(name);
		} catch (Exception e) {
			logger.error("删除位置[{}]异常", name, e);
			return new ResponseEntity(500, "删除失败");
		}

		return new ResponseEntity(200, "删除成功");
	}
}
