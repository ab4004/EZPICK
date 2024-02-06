package com.ezpick.lol.dto;

import com.ezpick.lol.repository.CheckEmail;
import com.ezpick.lol.repository.NicknameUpdate;
import com.ezpick.lol.repository.PasswordUpdate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

	@NotBlank(message = "아이디는 필수 입력 항목입니다")
	@Size(min = 5, max = 40, message = "아이디는 5자 이상 40자 이하로 입력하세요")
	@Pattern(regexp = "^[a-z0-9]+$", message = "아이디는 영문 소문자와 숫자로만 입력하세요")
	private String userId;

	@NotBlank(message = "비밀번호는 필수 입력 항목입니다", groups = PasswordUpdate.class)
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,16}$", message = "비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.", groups = PasswordUpdate.class)
	private String userPassword;

	@NotBlank(message = "이름은 필수 입력 항목입니다")
	@Size(min = 2, max = 20, message = "이름은 2자 이상 20자 이하로 입력하세요")
	@Pattern(regexp = "^[a-zA-Z가-힣]*$", message = "이름은 한글, 영문 대/소문자만 사용 가능합니다. (특수기호, 공백 사용 불가)")
	private String userName;

	@NotBlank(message = "닉네임은 필수 입력 항목입니다", groups = NicknameUpdate.class)
	@Size(min = 2, max = 16, message = "닉네임은 2자 이상 16자 이하로 입력하세요", groups = NicknameUpdate.class)
	@Pattern(regexp = "^[a-zA-Z가-힣0-9]*$", message = "닉네임은 한글, 영문 대/소문자만 사용 가능합니다. (특수기호, 공백 사용 불가)", groups = NicknameUpdate.class)
	private String userNickname;

	@NotBlank(message = "이메일은 필수 입력 항목입니다", groups = CheckEmail.class)
	@Email(message = "유효한 이메일 주소를 입력하세요", groups = CheckEmail.class)
	private String userEmail;
}
