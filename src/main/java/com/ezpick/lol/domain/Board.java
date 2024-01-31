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
	@Column(name = "board_seq", nullable = false)
	private int boardSeq; //게시글 번호
	
	@Column(name = "board_title", nullable = false, columnDefinition = "nvarchar(200)")
	private String boardTitle; //제목
	
	@Column(name = "board_writer", nullable = false, columnDefinition = "nvarchar(20)")
	private String boardWriter; //작성자
	
	@Lob
	@Column(name = "board_content", nullable = false, columnDefinition = "nvarchar(2000)")
	private String boardContent; //내용
	
	@CreatedDate //JPA에서 엔티티의 생성 시간을 처리
	@Column(name = "board_wrt_date", updatable = false)
	private LocalDateTime boardWrtDate; //작성일
	
	@LastModifiedDate //최종수정 시간을 자동으로 처리
	@Column(name = "board_crt_date")
	private LocalDateTime boardCrtDate; //수정일
	
	@ColumnDefault("0")
	@Column(name = "board_likes")
	private int boardLikes;
	
	@ColumnDefault("0")
	@Column(name = "board_hates")
	private int boardHates;
	
	@ColumnDefault("0")
	@Column(name = "board_hits")
	private int boardHits;
	
	@Column(name = "category_no")
	private int categoryNo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "board_writer", referencedColumnName = "user_nickname", insertable = false, updatable = false)
	private User user;
}
