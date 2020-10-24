# PuB
> **포스트 코로나에 대비한 비대면 서비스 전자도서관 웹** <br>
공공과 책을 결합한 단어(Public + Book)

## Getting started
> 2020년 코로나 사태가 발생하게 되면서 **포스트 코로나**라는 키워드가 우리나라뿐만 아니라 전 세계적인 이슈로 떠오르고 있습니다.<br>
이런 포스트 코로나시대가 도래하면서 외부공간에서 타인과의 접촉을 피하는 사회적 거리두기가 점차 확대됨과 동시에 부정을 의미하는 un과 접촉을 의미하는 contact 의 합성어인 **언택트**라는 단어가 세계를 관통하는 트랜드가 되었습니다.<br>
이러한 포스트 코로나에 대비해 핵심 화두인 “언택트”에 이바지하고자 하며 비대면서비스를 확대하려는 노력에 발 맞춰 비대면 서비스를 활용한 도서 대출 서비스를 기획하고자 합니다.

## Team
* PM - 문영선
* PL - 박범석
* PE - 나소현
* PE - 유성근
* QA - 손양원

## Prerequisties
* JAVA - JDK 1.8.0_251(JDK 1.8이상 권장)
* IDE - Eclipse IDE for Enterprise Java Developers(2019-06 (4.12.0)) 
* Tomcat - Apache Tomcat 9.0.30
* Oracle - OracleXE184_Win64
* STS - Spring Tools 3 (Standalone Edition) 3.9.11.RELEASE
* Lombok - 1.18.16

## Installation Process
[참고]https://drive.google.com/drive/folders/1YLuwS1mqK5jttIC5Q7nIEAp9fEqJGZT-?usp=sharing <br>
[구글 문서https://drive.google.com/file/d/1aUkubv1K_yQ9fLQUTRl4V55kSzaYFyjg/view?usp=sharing

## Getting Started
### 1. Oracle 18c 사용자 생성 (cnd 콘솔창에서)
```
C:>sqlplus /as sysdba

SQL>create tablespace javaoracle datafile 'C:\app\user\product\18.0.0\oradata\XE\테이블스페이스명.dbf' size 200M;

SQL>alter session set "_oracle_script"=true; //18c에서 오라클 사용자 생성을 11g와 같은 이전에 쓰던 방식으로 돌려준다. 비번 변경과는 관계 없다.

SQL> create user pub // 계정 생성
2  identified by pub // 패스워드 생성
3  default tablespace javaoracle // 위에서 생성한 테이블스페이스 명
4  quota UNLIMITED ON javaoracle; // 테이블 스페이스의 제한량 무한대

SQL> GRANT connect, resource TO pub;
```
### 2. 톰캣 서버를 생성합니다.
### 3. 파일을 클론합니다. (import -> GIT)
### 4. 정리.sql에서 테이블을 생성합니다.
### 5. eBookController 187라인을 적절히 수정합니다. 
```
InputStream is=new FileInputStream(new File("C:/Users/User/Downloads/book.pdf"));
```

## MAIN PAGE
![main](https://user-images.githubusercontent.com/51254596/97086534-d0c15480-165e-11eb-8c29-2632c20a7733.png)

## References
* 국가전자도서관
* 경기도사이버도서관



