package com.ezpick.lol.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

}