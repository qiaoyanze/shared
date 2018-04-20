package com.cisau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cisau.model.RepairInfo;
import com.cisau.model.User;
import com.cisau.model.UserInfo;

public interface UserDao {

	int insertUser(User user);

	int insertUserInfo(UserInfo userInfo);

	int insertRepairInfo(RepairInfo repairInfo);

	int updateUser(User user);

	int updateUserInfo(UserInfo userInfo);

	int updateRepairInfo(RepairInfo repairInfo);

	User queryUserByAccount(@Param("account") String account);

	UserInfo queryUserInfoByAccount(@Param("account") String account);

	RepairInfo queryRepairInfoByAccount(@Param("account") String account);

	int countUsers(int role);

	List<User> queryUsers(@Param("role") int role, @Param("pageOffset") int pageOffset,
			@Param("pageSize") int pageSize);

	int countRepairUsers(int role);

	List<User> queryRepairUsers(@Param("role") int role, @Param("pageOffset") int pageOffset,
			@Param("pageSize") int pageSize);

	int countNearBike(String place);

	List<User> queryNearBikes(@Param("place") String place, int pageOffset, int pageSize);
}
