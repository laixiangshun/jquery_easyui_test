package com.java.dao;

import java.util.List;
import java.util.Map;

import com.java.entity.User;

public interface UserDao {

	 /**
     * �û���ѯ
     * @param map
     * @return�û�����
     */
    public List<User> find(Map<String, Object> map);
    
    /**
     * ��ȡ�ܼ�¼��
     * @param map
     * @return��ȡ��total��
     */
    public Long getTotal(Map<String, Object> map);
    
    /**
     * �����û�
     * @param user
     * @return
     */
    public int add(User user);
    
    /**
     * �����û�
     * @param user
     * @return
     */
    public int update(User user);
    
    /**
     * ɾ���û�
     * @param id
     */
    public int delete(Integer id);
    
    /**
     * ��¼�û�
     * @param user
     * @return
     */
    public User login(User user);
}
