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

		String nickName = duo.getDuoNickname();

		if (!nickName.contains("#")) {
			nickName += "#KR1";
		} else if (nickName.endsWith("#")) {
			nickName += "KR1"; //#으로 끝나면 KR1을 덧붙임
		} 
		duo.setDuoNickname(nickName);
		duoRepository.save(duo);
	}

	@Transactional(readOnly = true)
	public List<Duo> duoList() {
		return duoRepository.findAll((Sort.by(Sort.Direction.DESC, "duoWrtDate")));
	}

	@Transactional(readOnly = true)
	public List<Duo> searchDuo(String gameType, String tier, String position) {
		return duoRepository.findByDuoGameTypeAndDuoTierAndDuoPosition(gameType, tier, position,
				Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 게임타입과 포지션만 선택
	public List<Duo> tierNull(String gameType, String position) {
		return duoRepository.findByDuoGameTypeAndDuoPosition(gameType, position,
				Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 티어와 포지션만 선택
	public List<Duo> gameTypeNull(String tier, String position) {
		return duoRepository.findByDuoTierAndDuoPosition(tier, position, Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 게임타입과 티어만 선택
	public List<Duo> positionNull(String gameType, String tier) {
		return duoRepository.findByDuoGameTypeAndDuoTier(gameType, tier, Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 게임타입만 선택
	public List<Duo> selectGameType(String gameType) {
		return duoRepository.findByDuoGameType(gameType, Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 티어만 선택
	public List<Duo> selectTier(String tier) {
		return duoRepository.findByDuoTier(tier, Sort.by(Sort.Direction.DESC, "duoWrtDate"));
	}

	@Transactional(readOnly = true) // 포지션만 선택
	public List<Duo> selectPosition(String position) {
		return duoRepository.findByDuoPosition(position, Sort.by(Sort.Direction.DESC, "duoWrtDate"));
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