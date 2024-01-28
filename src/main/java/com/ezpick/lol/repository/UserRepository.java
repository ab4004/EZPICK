package com.ezpick.lol.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

	boolean existsByUserId(String userId);

	boolean existsByUserNickname(String userNickname);

	boolean existsByUserEmail(String userEmail);

	Optional<User> findByUserEmail(String userEmail);

	Optional<User> findByUserNameAndUserEmail(String userName, String userEmail);
}