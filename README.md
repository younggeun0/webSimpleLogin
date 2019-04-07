# ✔ 로그인(Web Toy Project)

* **HTML, CSS, JS를 이용한 로그인, 회원가입 구현**
  * 로그인, 회원가입 입력값 검증
	* Model 1 예제 DBCP 이용
		* DB에서 아이디 비번 확인 후 로그인 처리
		* 이름으로 환경인사 보내기

![01](https://github.com/younggeun0/younggeun0.github.io/blob/master/_posts/img/toyProjects/webSimpleLogin/01.png?raw=true)

* **DB 설계**

```sql
CREATE TABLE simple_login_user (
  id VARCHAR2(30) CONSTRAINT pk_simple_login_user PRIMARY KEY,
  password VARCHAR2(100) NOT NULL,
  name VARCHAR2(15) NOT NULL,
  tel VARCHAR2(13) NOT NULL,
  zipcode VARCHAR2(5) NOT NULL,
  address1 VARCHAR2(200) NOT NULL,
  address2 VARCHAR2(200)
);


INSERT INTO simple_login_user (id, password, name, tel, zipcode, address1, address2)
VALUES ('admin', '1234', 'young', '010-0000-0000', '12345', '어딘가', '테스트');

SELECT * FROM simple_login_user;

COMMIT;
```

* Tomcat `server.xml`에서 DBCP 사용 설정

```html
<Context docBase="webSimpleLogin" path="/webSimpleLogin"  reloadable="true"  source="org.eclipse.jst.jee.server:webSimpleLogin">
     <Resource name="jdbc/webSimpleLogin" auth="Container"
           type="javax.sql.DataSource"  driverClassName="oracle.jdbc.OracleDriver"
           url="jdbc:oracle:thin@localhost:1521:orcl"  username="scott" password="tiger"
           maxTotal="20" maxIdle="10" maxWaitMillis="-1"/>
</Context>
```

## 시연

![02](https://github.com/younggeun0/younggeun0.github.io/blob/master/_posts/img/toyProjects/webSimpleLogin/02.png?raw=true)
