package com.ezpick.lol.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false, columnDefinition = "varchar(40)")
	private String user_id;
	
	@Column(nullable = false, columnDefinition = "varchar(16)")
	private String user_password;
	
	@Column(nullable = false, columnDefinition = "nvarchar(20)")
	private String user_name;
	
	@Column(nullable = false, columnDefinition = "nvarchar(16)", unique = true)
	private String user_nickname;
	
	@Column(nullable = false, columnDefinition = "varchar(11)")
	private String user_phone;
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime user_reg_date;
	
	@Enumerated(EnumType.STRING)
	private RoleType user_role;
	
}
