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
	public void insertDuo(Duo duo) {
		duo.setDuoWrtDate(LocalDateTime.now());
		duo.setDuoReTime(15); // 글 작성될때마다 duoReTime 초기화
		duoRepository.save(duo);
	}

	@Transactional(readOnly = true)
	public List<Duo> duoList() {
		return duoRepository.findAll((Sort.by(Sort.Direction.DESC, "duoWrtDate")));
	}
	
	@Transactional(readOnly = true)
	public List<Duo> serchDuo(String gameType, String tier, String position) {
		return duoRepository.findByDuoGameTypeAndDuoTierAndDuoPosition(gameType, tier, position);
	}

	@Transactional
	@Scheduled(fixedDelay = 60000)
	public void deleteDuoList() {
		System.out.println("deleteDuoList 확인");
		LocalDateTime ago = LocalDateTime.now().minusMinutes(15);
		List<Duo> duoList = duoRepository.findByDuoWrtDateIsBefore(ago);
		duoRepository.deleteAll(duoList);
	}

	@Transactional
	@Scheduled(fixedDelay = 60000)
	public void updateDuoReTime() {
		System.out.println("updateDuoReTime 확인");
		List<Duo> duoList = duoRepository.findAll(); // 모든 Duo 엔터티 가져오기
		for (Duo duo : duoList) {
			int reTime = duo.getDuoReTime();
			if (reTime > 0) {
				duo.setDuoReTime(reTime - 1); // 1씩 차감
				duoRepository.save(duo); // 변경된 값 저장
			}
		}
	}
}