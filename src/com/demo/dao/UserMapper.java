package com.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.pojo.User;

public interface UserMapper {
	/*
	 * �鿴�û���Ϣ
	 */
	List<User> getUser();
	/*
	 * ����id��ѯ�û���Ϣ
	 */
	User getUserById(int id); 
	/*
	 * �޸��û���Ϣ
	 */
	int updateUser(User user);
	/*
	 * ɾ���û���Ϣ
	 */
	int delUser(int id);
	/*
	 * ����û���Ϣ
	 */
	int addUser(User user);
	/*
	 * ��ѯRole��User��������� id��չʾ
	 */
	List<User> getUserByRole();
	/*
	 * һ�Զ�Ľ��ӳ��
	 */
	User getAddressListById(@Param("id")Integer id);
	/*
	 * �� �û��� id �޸��û�������
	 */
	int updateUserByName(@Param("userName")String name,@Param("id")Integer id);
}
