package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.User;

public interface UserDao {

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	int insert(User user);

	/**
	 * 根据账号查询用户
	 * 
	 * @param account
	 * @return
	 */
	User queryByAccount(String account);

	int countUsers();
	
	/**
	 * 分页查询所有用户
	 * 
	 * @param pageSize
	 * @param pageOffset
	 * @return
	 */
	List<User> queryUsers(@Param("pageSize") int pageSize, @Param("pageOffset") int pageOffset);
}
