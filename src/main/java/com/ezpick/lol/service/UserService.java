package com.ezpick.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.RoleType;
import com.ezpick.lol.domain.User;
import com.ezpick.lol.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public void register(User user) {
		user.setUser_role(RoleType.USER);
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	public User getUser(String id) {
		User findUser = userRepository.findById(id).orElseGet(() -> {
			return new User();
		});
		return findUser;
	}
}
