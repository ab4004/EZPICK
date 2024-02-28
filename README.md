롤 전적 검색 및 커뮤니티 등 기능이 추가된 사이트 입니다.

* 데이터베이스 관련 임시 스키마 작성 :

create user 'admin'@'%' identified by 'admin1234';

grant all privileges on *.* to 'admin'@'%';

CREATE DATABASE ezpick_db CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
