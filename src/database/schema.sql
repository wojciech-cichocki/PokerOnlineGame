USE poker;

DROP TABLE GAME_USER;
DROP DATABASE IF EXISTS POKER;



CREATE DATABASE IF NOT EXISTS POKER;
CREATE TABLE IF NOT EXISTS ACCOUNT(
	login VARCHAR(30) PRIMARY KEY,
    username VARCHAR(30),
    password CHAR(40),
    tokens INT(24)
    );
  
ALTER TABLE ACCOUNT MODIFY username VARCHAR(30) NOT NULL;
ALTER TABLE ACCOUNT MODIFY login VARCHAR(30) NOT NULL;
ALTER TABLE ACCOUNT MODIFY password VARCHAR(40) NOT NULL;
ALTER TABLE ACCOUNT MODIFY tokens INT(24) NOT NULL;


ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_UNIQUE UNIQUE (username, login); 
/*SELECT SHA1('aadfasd'), length(SHA1('asdasaa'));*/

CREATE TABLE IF NOT EXISTS GAME(
	id INT(32)  AUTO_INCREMENT PRIMARY KEY,
	player_login VARCHAR(30),
	game_result ENUM('lose', 'draw', 'win'),
	tokens INT(24)
    );

-- add foreign keyconstraints
ALTER TABLE GAME ADD FOREIGN KEY (player_login) REFERENCES ACCOUNT(login); 
 
-- query 
SELECT COUNT(*) FROM ACCOUNT WHERE ACCOUNT.login = "b" AND ACCOUNT.password = "c";

INSERT INTO GAME(player_login, game_result, tokens) VALUES
	('login', 'win', 100)