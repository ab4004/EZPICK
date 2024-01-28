package com.ezpick.lol.service;

import java.time.LocalDateTime;

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
		user.setUserRole(RoleType.USER);
		user.setUserRegDate(LocalDateTime.now());
		userRepository.save(user);
	}

	@Transactional
	public boolean checkUserId(String userId) {
		return userRepository.existsByUserId(userId);
	}

	@Transactional
	public boolean checkUserNickname(String userNickname) {
		return userRepository.existsByUserNickname(userNickname);
	}

	@Transactional
	public boolean checkUserEmail(String userEmail) {
		return userRepository.existsByUserEmail(userEmail);
	}

	@Transactional(readOnly = true)
	public User getUser(String userId) {
		// 검색 결과가 있으면 findUser에 반환된 값 대입하고, 없을 경우 new User()로 빈 객체 반환
		User findUser = userRepository.findById(userId).orElseGet(() -> {
			return new User();
		});
		return findUser;
	}

	@Transactional(readOnly = true)
	public String findId(String userEmail) {
		User findUser = userRepository.findByUserEmail(userEmail).orElseGet(() -> new User());
		return findUser.getUserId();
	}

	@Transactional(readOnly = true)
	public String findPassword(String userName, String userEmail) {
		User findUser = userRepository.findByUserNameAndUserEmail(userName, userEmail).orElseGet(() -> new User());
		return findUser.getUserPassword();
	}
}
