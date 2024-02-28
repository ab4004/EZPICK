package com.ezpick.lol.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezpick.lol.domain.Book;
import com.ezpick.lol.domain.Pdb;
import com.ezpick.lol.domain.User;
import com.ezpick.lol.dto.ResponseDTO;
import com.ezpick.lol.service.BookService;
import com.ezpick.lol.service.PredService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PredController {

	@Autowired
	private PredService predService;

	@Autowired
	private BookService bookService;

	// 승부예측 메인 화면
	@GetMapping("/pred")
	public String pred(Model model, @RequestParam(required = false) LocalDateTime startDate,
			@RequestParam(required = false) LocalDateTime endDate) {
	
		List<Book> pred = predService.date(startDate, endDate);
	
		model.addAttribute("pred", pred);
		model.addAttribute("rank", predService.createRank());
		model.addAttribute("totalMatch", bookService.getTotalMatch());


		return "pred/pred";
	}

//-----------------------------------------------------------------------------------------------

	// 홈 팀 승리 예측 버튼
	@PostMapping("/pred/pickHome")
	public @ResponseBody ResponseDTO<?> pickHome(@RequestBody Book book, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Book books = bookService.getBook(book.getId());

		if (user != null) {
			List<Pdb> existingPdb1 = predService.getPdbByUserIdAndBook(user, books);

			if (existingPdb1.size() != 0) {
				Pdb existingPdb = predService.getPdbByUserIdAndBook(user, books).get(0);
				// 이미 예측이 존재하는 경우
				if (existingPdb.getPick() == 1) {
					// 이미 예측이 홈 팀이면서, 경기 번호가 같을 경우
					return new ResponseDTO<>(HttpStatus.OK.value(), "이미 홈 팀을 선택하였습니다.");
				} else if (existingPdb.getPick() == 2) {
					// 원정 팀에서 홈 팀으로 승리 예측을 변경하려는 경우
					existingPdb.setPick(1); // 홈 팀으로 변경함
					predService.pickHome(existingPdb); // 업데이트
					return new ResponseDTO<>(HttpStatus.OK.value(), "홈 팀으로 선택을 변경하였습니다.");
				}
			} else {
				// 새로운 예측을 추가하는 경우
				Pdb newPdb = new Pdb();
				newPdb.setUserId(user);
				newPdb.setBook(books);
				newPdb.setPick(1); // 홈 팀을 선택함				
				predService.pickHome(newPdb); // 저장
				return new ResponseDTO<>(HttpStatus.OK.value(), "홈 팀을 선택하였습니다.");
			}
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인 후 이용해주시기 바랍니다.");
	}

	// 원정 팀 승리 예측 버튼
	@PostMapping("/pred/pickAway")
	public @ResponseBody ResponseDTO<?> pickAway(@RequestBody Book book, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Book books = bookService.getBook(book.getId());

		if (user != null) {
			List<Pdb> existingPdb1 = predService.getPdbByUserIdAndBook(user, books);

			if (existingPdb1.size() != 0) {
				Pdb existingPdb = predService.getPdbByUserIdAndBook(user, books).get(0);
				// 이미 동일 경기 예측한 이력이 있는 경우
				if (existingPdb.getPick() == 2) {
					// 이미 진행한 예측이 원정 팀이면서, 경기 번호가 같을 경우
					return new ResponseDTO<>(HttpStatus.OK.value(), "이미 원정 팀을 선택하였습니다.");

				} else if (existingPdb.getPick() == 1) {
					// 홈 팀에서 원정 팀으로 승리 예측을 변경하려는 경우
					existingPdb.setPick(2); // 원정 팀으로 변경함
					predService.pickAway(existingPdb); // 업데이트
					return new ResponseDTO<>(HttpStatus.OK.value(), "원정 팀으로 선택을 변경하였습니다.");
				}
			} else {
				// 해당 경기 처음 예측을 진행하는 경우
				Pdb newPdb = new Pdb();
				newPdb.setUserId(user);
				newPdb.setBook(books);
				newPdb.setPick(2); // 원정 팀을 선택함				
				predService.pickAway(newPdb); // 저장
				return new ResponseDTO<>(HttpStatus.OK.value(), "원정 팀을 선택하였습니다.");
			}
		}
		return new ResponseDTO<>(HttpStatus.BAD_REQUEST.value(), "로그인 후 이용해주시기 바랍니다.");
	}
}
