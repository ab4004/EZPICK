package com.ezpick.lol.domain;


import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
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
@Table(name="BOARD_TBL")
public class Board {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private int board_seq; //게시글 번호
	
	@Column(nullable = false, columnDefinition = "nvarchar(200)")
	private String board_title; //제목
	
	@Column(nullable = false, columnDefinition = "nvarchar(20)")
	private String board_writer; //작성자
	
	@Lob
	@Column(nullable = false, columnDefinition = "nvarchar(2000)")
	private String board_contentt; //내용
	
	@CreatedDate //JPA에서 엔티티의 생성 시간을 처리
	@Column(updatable = false)
	private LocalDateTime board_wrt_date; //작성일
	
	@LastModifiedDate //최종수정 시간을 자동으로 처리
	private LocalDateTime board_crt_date; //수정일
	
	@ColumnDefault("0")
	private int board_likes;
	
	@ColumnDefault("0")
	private int board_hates;
	
	@ColumnDefault("0")
	private int board_hits;
	
	private int category_no;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")
	private User user;
	
}
