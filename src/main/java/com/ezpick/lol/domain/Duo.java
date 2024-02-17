package com.ezpick.lol.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
@Table(name = "DUO_TBL")
public class Duo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "duo_seq", nullable = false)
	private int duoSeq;

	@Column(name = "duo_nickname", nullable = false)
	private String duoNickname;

	@Column(name = "duo_content", columnDefinition = "nvarchar(80)")
	private String duoContent;

	@CreatedDate
	@Column(name = "duo_wrt_date", updatable = false)
	private LocalDateTime duoWrtDate;

	@Column(name = "duo_re_time")
	private int duoReTime;

	@Column(name = "duo_position", columnDefinition = "varchar(8)")
	private String duoPosition;

	@Column(name = "duo_game_type", columnDefinition = "varchar(8)")
	private String duoGameType;

	@Column(name = "duo_tier", columnDefinition = "varchar(8)")
	private String duoTier;
}
