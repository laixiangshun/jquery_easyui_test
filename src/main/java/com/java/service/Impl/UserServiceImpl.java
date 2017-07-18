package com.java.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.UserDao;
import com.java.entity.User;
import com.java.service.UserService;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	public List<User> find(Map<String, Object> map) {
		return this.userDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return this.userDao.getTotal(map);
	}

	@Override
	public int add(User user) {
		return userDao.add(user);
	}

	@Override
	public int update(User user) {
		return userDao.update(user);
	}

	@Override
	public int delete(Integer id) {
		return userDao.delete(id);
	}

	@Override
	public User login(User user) {
		return this.userDao.login(user);
	}
	
}
