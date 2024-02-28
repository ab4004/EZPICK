package com.ezpick.lol.domain;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
@Table(name = "BOOK_TBL")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, columnDefinition = "TIMESTAMP")
	private LocalDateTime date;

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

	@ColumnDefault(value = "0")
	@Column(nullable = true)
	private int result;

	@OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
	private List<Pdb> pdb;
}
