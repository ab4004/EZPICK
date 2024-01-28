package com.ezpick.lol.service;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {

	private final JavaMailSender javaMailSender;
	private static final String senderEmail = "jsy960822@gmail.com";
	private static int number;

	public static void createNumber() {
		number = (int) (Math.random() * (90000)) + 100000;
	}

	public MimeMessage createMail(String mail) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			message.setFrom(senderEmail); // 보내는 이메일
			message.setRecipients(MimeMessage.RecipientType.TO, mail); // 보낼 이메일 설정
			message.setSubject("[ezpick] 회원가입을 위한 이메일 인증"); // 제목 설정
			String body = "";
			body += "<h3>" + "안녕하세요." + "</h3>";
			body += "<h3>" + "회원가입을 위한 요청하신 인증 번호입니다." + "</h3><br>";
			body += "<h2>" + "아래 코드를 회원가입 창으로 돌아가 입력해주세요." + "</h2>";

			body += "<div align='center' style='border:1px solid black; font-family:verdana;'>";
			body += "<h2>" + "회원가입 인증 코드입니다." + "</h2>";
			body += "<h1 style='color:blue'>" + number + "</h1>";
			body += "</div><br>";
			body += "<h3>" + "감사합니다." + "</h3>";
			message.setText(body, "UTF-8", "html");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;
	}

	public int sendMail(String mail) {
		MimeMessage message = createMail(mail);
		try {
			// 이 부분에서 수신자 이메일 주소가 비어 있는지 확인
			if (mail == null || mail.isEmpty()) {
				// 예외 처리 또는 오류 코드 반환
				return -1;
			}
			javaMailSender.send(message);
			return number;
		} catch (MailException e) {
			e.printStackTrace();
			// 메일 전송 중 예외 처리
			return -1; // 또는 다른 오류 코드를 반환
		}
	}
}