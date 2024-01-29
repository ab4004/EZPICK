package com.ezpick.lol.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "USER_TBL")
public class User {

	@Id
	@Column(name = "user_id", nullable = false, columnDefinition = "varchar(40)")
	private String userId;
	
	@Column(name = "user_password", nullable = false, columnDefinition = "varchar(64)")
	private String userPassword;
	
	@Column(name = "user_name", nullable = false, columnDefinition = "nvarchar(20)")
	private String userName;
	
	@Column(name = "user_nickname", nullable = false, columnDefinition = "nvarchar(16)", unique = true)
	private String userNickname;
	
	@Column(name = "user_email", nullable = false, columnDefinition = "varchar(30)", unique = true)
	private String userEmail;
	
	@CreatedDate
	@Column(name = "user_reg_date", updatable = false)
	private LocalDateTime userRegDate;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "user_role")
	private RoleType userRole;
}
