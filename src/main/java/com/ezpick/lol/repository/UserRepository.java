package com.ezpick.lol.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

	boolean existsByUserId(String userId); //아이디 중복확인

	boolean existsByUserNickname(String userNickname); //닉네임 중복확인

	boolean existsByUserEmail(String userEmail); //이메일 중복확인

	Optional<User> findByUserEmail(String userEmail); //아이디 찾기

	Optional<User> findByUserIdAndUserEmail (String userId, String userEmail); //비밀번호 찾기
}