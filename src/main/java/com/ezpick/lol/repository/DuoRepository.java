package com.ezpick.lol.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ezpick.lol.domain.Duo;

@Repository
public interface DuoRepository extends JpaRepository<Duo, Integer> {
	
	List<Duo> findByDuoWrtDateIsBefore(LocalDateTime dateTime);
	
	List<Duo> findByDuoGameTypeAndDuoTierAndDuoPosition(String gameType, String tier, String position);

}
