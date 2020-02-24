package com.csye6225.noteapp.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csye6225.noteapp.model.UserEntity;
import com.csye6225.noteapp.repository.UserRepository;

@Service
public class UserDao implements UserDaoInterface {

	@Autowired
	UserRepository userRepository;

	public UserEntity findUser(String email) {
		return userRepository.findUser(email);
	}

	public UserEntity save(UserEntity users) {
		return userRepository.save(users);
	}

}
