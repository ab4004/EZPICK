package com.ezpick.lol.service;

import java.time.LocalDateTime;
import java.util.Optional;

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

	@Transactional // 회원가입
	public void register(User user) {
		user.setUserRole(RoleType.USER);
		user.setUserRegDate(LocalDateTime.now());
		userRepository.save(user);
	}

	@Transactional // 아이디 중복확인
	public boolean checkUserId(String userId) {
		return userRepository.existsByUserId(userId);
	}

	@Transactional // 닉네임 중복확인
	public boolean checkUserNickname(String userNickname) {
		return userRepository.existsByUserNickname(userNickname);
	}

	@Transactional // 이메일 중복확인
	public boolean checkUserEmail(String userEmail) {
		return userRepository.existsByUserEmail(userEmail);
	}

	@Transactional(readOnly = true)
	public User getUser(String userId) { // 아이디 정보 확인 후 로그인
		// 검색 결과가 있으면 findUser에 반환된 값 대입하고, 없을 경우 new User()로 빈 객체 반환
		User findUser = userRepository.findById(userId).orElseGet(() -> new User());
		return findUser;
	}

	@Transactional(readOnly = true) // 아이디 찾기
	public String findId(String userEmail) {
		User findUser = userRepository.findByUserEmail(userEmail).orElseGet(() -> new User());
		return findUser.getUserId();
	}

	@Transactional(readOnly = true)
	public User findPassword(String userId, String userEmail) {
		User findUser = userRepository.findByUserIdAndUserEmail(userId, userEmail).orElseGet(() -> new User());
		return findUser;
	}

	@Transactional
	public boolean updatePassword(String userId, String userEmail, String newPassword) {
		User findUser = findPassword(userId, userEmail);

		if (findUser != null) {
			findUser.setUserPassword(newPassword);
			userRepository.save(findUser);
			return true;
		}
		return false;
	}
}
