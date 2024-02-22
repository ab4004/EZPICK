package com.ezpick.lol.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table
public class Pdb {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;	
	
	// 유저가 예측한 픽
	@Column
	private int pick;	
	
	// 적중 횟수
	@Column
	private int hits;			
		
	// 예측 유저 이름
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	private User userId;
		
	//---------------------------------------------------
	
		
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookid")
	private Book book;
	
	
	
	
}
