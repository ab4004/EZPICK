package com.ezpick.lol.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezpick.lol.domain.Duo;
import com.ezpick.lol.repository.DuoRepository;

@EnableScheduling
@Service
public class DuoService {

	@Autowired
	private DuoRepository duoRepository;

	@Transactional
	public void findDuo(Duo duo) {
		duo.setDuoWrtDate(LocalDateTime.now());
		duoRepository.save(duo);
	}

	@Transactional(readOnly = true)
	public List<Duo> duoList() {
		return duoRepository.findAll((Sort.by(Sort.Direction.DESC, "duoWrtDate")));
	}

	@Scheduled(fixedDelay = 60000)
	@Transactional
	public void deleteDuoList() {
		LocalDateTime ago = LocalDateTime.now().minusMinutes(15);
		List<Duo> expired = duoRepository.findByDuoWrtDateIsBefore(ago);
		duoRepository.deleteAll(expired);
	}
}
