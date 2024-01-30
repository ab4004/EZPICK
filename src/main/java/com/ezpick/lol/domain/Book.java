package com.ezpick.lol.domain;

import java.time.LocalDateTime;
import java.time.YearMonth;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Book {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   private int id;
		
	   @Column(nullable = false)
	   private YearMonth date;
	   
	   @Column(nullable = false)
	   private LocalDateTime time;
	   
	   @Column
	   private String status;
	   
	   @Column
	   private String round;
	   
	   @Column(nullable = false)
	   private String homeTeam;
	   
	   
	   @Column(nullable = false)
	   private String awayTeam;
	   	   
	   @Column(nullable = true)
	   private Integer homeScore;	   
	   
	   @Column(nullable = true)
	   private Integer awayScore;	 
	   
	   @Column(nullable = false)
	   private String versus;
	     
	   @Column(length = 200)
	   private String link;

	   @Column(length = 50)
	   private String stadium;

}
