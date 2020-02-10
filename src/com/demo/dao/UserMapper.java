package com.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.pojo.User;

public interface UserMapper {
	/*
	 * 查看用户信息
	 */
	List<User> getUser();
	/*
	 * 根据id查询用户信息
	 */
	User getUserById(int id); 
	/*
	 * 修改用户信息
	 */
	int updateUser(User user);
	/*
	 * 删除用户信息
	 */
	int delUser(int id);
	/*
	 * 添加用户信息
	 */
	int addUser(User user);
	/*
	 * 查询Role和User两表的数据 id不展示
	 */
	List<User> getUserByRole();
	/*
	 * 一对多的结果映射
	 */
	User getAddressListById(@Param("id")Integer id);
	/*
	 * 据 用户的 id 修改用户的名称
	 */
	int updateUserByName(@Param("userName")String name,@Param("id")Integer id);
}
