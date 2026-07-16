# AuctionGo — 피규어 컬렉션 · 경매 플랫폼

> 비크리(Vickrey) 방식 C2C 경매를 지원하는 피규어 컬렉션 거래 플랫폼

> 본 리포지토리는 5인 팀 프로젝트로 진행되었으며, **본인은 팀장 · 인증/계정 도메인**을 담당했습니다. 아래 문서는 담당 영역을 중심으로 정리했습니다.

<br>

## 프로젝트 개요

| 항목 | 내용 |
|---|---|
| 기간 | 2026.04.20 ~ 2026.05.11 (3주) |
| 인원 | 5인 팀 프로젝트 |
| 담당 역할 | 팀장 · 인증/계정 도메인 |
| 기술 스택 | Java · JSP/Servlet · Oracle · MyBatis |

기획부터 구현까지 체계적으로 진행해본 첫 프로젝트입니다. 비즈니스 로직을 DB 프로시저에 집중시키는 팀 설계 방향 아래, 회원 인증과 계정 관리 도메인을 담당했습니다.

<br>

## 기술 스택

![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=openjdk&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-orange?style=flat-square)
![Servlet](https://img.shields.io/badge/Servlet-black?style=flat-square)
![MyBatis](https://img.shields.io/badge/MyBatis-000000?style=flat-square)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)

<br>

## 담당 기능 (Core Features — 인증 · 계정 도메인)

- **로그인 / 회원가입** — 검증 로직을 DB 프로시저에 집중시키고, 에러코드로 분기 처리
- **아이디 · 비밀번호 찾기** — 이메일 인증번호 발급 + 만료시각 검증
- **마이페이지** — 9개 영역 사이드바 전환, 탈퇴를 제외한 전 기능 구현
- **네이버 로그인 (OAuth2)** — 프로젝트 종료 후 추가 연동

<br>

## Screenshots

<!-- 실제 서비스 스크린샷 삽입 위치 -->
<!-- ![로그인](./docs/images/auctiongo-login.png) -->
<!-- ![마이페이지](./docs/images/auctiongo-mypage.png) -->

<br>

## 회고

- **강제하지 않는 리더십** — 공유 문서로 업무를 배분하고 진행 상황을 조율하며, 강제하지 않고도 역할을 하게 만드는 법을 배웠습니다.
- **머지 충돌 반복 경험** — 잦은 머지 충돌을 겪은 뒤, 다음 프로젝트에서는 컨벤션 규칙을 처음부터 강제했습니다.
- **기획부터 구현까지, 첫 완주** — 콘솔 · DB 위주의 단순 프로젝트만 경험하다 처음으로 기획부터 구현까지 전체 흐름을 경험한 프로젝트였습니다.
