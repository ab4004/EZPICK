package com.ezpick.lol.domain;

import java.sql.Timestamp;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
@Table(name = "REPLY_TBL")
public class Reply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reply_id", nullable = false)
	private int id;
	
	@Column(name="reply_content", nullable = false, length = 200)
	private String content;
	
	@CreationTimestamp
	@Column(name = "reply_crtdate", nullable = false)
	private Timestamp replyCrtDate;
	
	@ColumnDefault(value = "0")
	@Column(name = "reply_like", nullable = false)
	private int like;
	
	@ColumnDefault(value = "0")
	@Column(name = "reply_hate", nullable = false)
	private int hate;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "boardid")
	private Board board;
}
