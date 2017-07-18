package com.java.dao;

import java.util.List;
import java.util.Map;

import com.java.entity.User;

public interface UserDao {

	 /**
     * 用户查询
     * @param map
     * @return用户集合
     */
    public List<User> find(Map<String, Object> map);
    
    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);
    
    /**
     * 新增用户
     * @param user
     * @return
     */
    public int add(User user);
    
    /**
     * 更新用户
     * @param user
     * @return
     */
    public int update(User user);
    
    /**
     * 删除用户
     * @param id
     */
    public int delete(Integer id);
    
    /**
     * 登录用户
     * @param user
     * @return
     */
    public User login(User user);
}
