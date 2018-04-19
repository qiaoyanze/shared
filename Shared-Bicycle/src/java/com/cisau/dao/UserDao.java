package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.User;
import com.cisau.model.UserInfo;

public interface UserDao {

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	int insertUserInfo(UserInfo userInfo);
	
	int updateUser(User user);

	int updateUserInfo(UserInfo userInfo);

	/**
	 * 根据账号查询用户
	 * 
	 * @param account
	 * @return
	 */
	User queryUserByAccount(@Param("account") String account);

	UserInfo queryUserInfoByAccount(@Param("account") String account);

	int countUsers();

	/**
	 * 分页查询所有用户
	 * 
	 * @param pageSize
	 * @param pageOffset
	 * @return
	 */
	List<User> queryUsers(@Param("pageOffset") int pageOffset, @Param("pageSize") int pageSize);
}
