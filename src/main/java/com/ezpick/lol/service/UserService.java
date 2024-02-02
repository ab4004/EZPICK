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

	@Transactional(readOnly = true) // 비밀번호, 닉네임을 변경을 위한 유저 찾기
	public User findUser(String userId, String userEmail) {
		User findUser = userRepository.findByUserIdAndUserEmail(userId, userEmail).orElseGet(() -> new User());
		return findUser;
	}

	@Transactional // 인증받고 확인이 되야 수정이 가능
	public boolean updatePassword(String userId, String userEmail, String newPassword) {
		User findUser = findUser(userId, userEmail);

		if (findUser != null) {
			findUser.setUserPassword(newPassword);
			userRepository.save(findUser);
			return true;
		}
		return false;
	}

	@Transactional
	public boolean updateNickname(String userId, String userEmail, String newNickname) {
		User findUser = findUser(userId, userEmail);

		if (findUser != null) {
			findUser.setUserNickname(newNickname);
			userRepository.save(findUser);
			return true;
		}
		return false;
	}

	// ifPresent는 Optional객체의 값이(findById) 존재할경우에만 실행
	// 비어있지않은 경우에는 아무런 동작도 실행하지않음 NullPointException 방지가능
	@Transactional
	public void deleteUser(String userId) {
		userRepository.findById(userId).ifPresent(user -> userRepository.delete(user));
	}
}
