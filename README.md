롤 전적 검색 및 커뮤니티 등 기능이 추가된 사이트

## 기획의도
 
>_1. 기존 이용할 수 있는 전적 검색 사이트나 해당 게임 관련 뉴스, 해당 게임의 프로 경기 일정 확익 및 예매 사이트가 분산되어있다._

>_2. 복잡한 UI로 인해 찾고자 하는 기능을 바로 찾아가는 데 어려움이 발생_

__유저들이 한 곳에서 복합적인 기능을 누릴 수 있도록 롤 관련 종합 웹사이트를 기획__


## 구현내용

__1. 전적 검색 :__ 유저의 닉네임을 입력하여 조회하고 조회한 유저의 전적 등의 정보를 보여줍니다.

![전적검색](https://github.com/ab4004/EZPICK/blob/master/%EC%A0%84%EC%A0%81%EA%B2%80%EC%83%89.gif)

---

__2. 회원 가입 및 로그인, ID/PW 찾기, 정보 수정__

![로그인](https://github.com/ab4004/EZPICK/blob/master/%EB%A1%9C%EA%B7%B8%EC%9D%B8.png)

---

__3. 듀오찾기 :__ 같이 게임을 즐길 유저를 찾습니다.

![전적검색](https://github.com/ab4004/EZPICK/blob/master/%EB%93%80%EC%98%A4%EC%B0%BE%EA%B8%B0.gif)

---

__4. 커뮤니티__

![커뮤니티](https://github.com/ab4004/EZPICK/blob/master/%EC%BB%A4%EB%AE%A4%EB%8B%88%ED%8B%B0.png)

---

__5. 경기 & 예매 :__ 프로 경기의 일정을 확인하고 예매할 수 있습니다.

![경기&예매](https://github.com/ab4004/EZPICK/blob/master/%EA%B2%BD%EA%B8%B0%EC%9D%BC%EC%A0%95.png)

---

__6. 승부 예측 :__ 프로 경기의 승부 예측을 진행할 수 있고, 많은 예측을 성공하면 랭킹이 높아집니다.

![승부예측1](https://github.com/ab4004/EZPICK/blob/master/%EC%8A%B9%EB%B6%80%EC%98%88%EC%B8%A11.png)

![승부예측2](https://github.com/ab4004/EZPICK/blob/master/%EC%8A%B9%EB%B6%80%EC%98%88%EC%B8%A12.png)

---

__7. 뉴스 :__ 롤 관련 뉴스 기사들을 확인할 수 있습니다.

![뉴스](https://github.com/ab4004/EZPICK/blob/master/%EB%89%B4%EC%8A%A4.png)


## < 실제 실행 시 참고 >
* 데이터베이스 관련 임시 스키마 작성 :

create user 'admin'@'%' identified by 'admin1234';

grant all privileges on *.* to 'admin'@'%';

CREATE DATABASE ezpick_db CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

---

* Riot API 사용을 위한 Key 발급(https://developer.riotgames.com/) 및 사용 방법 :

위 링크의 사이트로 들어가 로그인 후 Key 발급

프로젝트 파일 안에 src/main/java 위치 열고, 이후 com.ezpick.lol.service 패키지 안에 있는 RiotService.java에서 API_KEY 상수의 값을 발급 받은 Key 값 입력
