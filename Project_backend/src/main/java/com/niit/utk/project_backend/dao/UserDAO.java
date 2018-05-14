package com.niit.utk.project_backend.dao;

import com.niit.utk.project_backend.model.User;

public interface UserDAO {
	
	public boolean addUser(User user);
	public User getUser(int userId);
	public boolean deleteUser(int userId);
	public boolean updateUser(User user);
	public User findbyUserId(String id);

}
