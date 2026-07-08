package com.tap.DAOInterface;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {
		
	int  addUser(User u);
	void updateUser(User u);
	void deleteUpadte(int id);
	User getUser(int id);
	List<User> getAllUser();
	User getUserByEmail(String email);
	void updateLastLogin(int id);
	

}
