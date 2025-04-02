CREATE DATABASE sm_platform;

USE sm_platform;

CREATE TABLE users (
   user_id INT PRIMARY KEY,
   user_name VARCHAR(50) NOT NULL UNIQUE,
   full_name VARCHAR(50) NOT NULL,
   platform VARCHAR(15),
   date_of_birth DATE,
   gender varchar(10),
   email VARCHAR(30)
);
CREATE TABLE posts ( 
   post_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT,
   caption VARCHAR(50),
   is_public VARCHAR(10),
   posted_at DATE,
   likes_count INT,
   comments_count INT,
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE comments (
   comment_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT ,
   post_id INT,
   content VARCHAR(100),
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE likes (
   like_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT,
   post_id INT,
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(post_id) REFERENCES posts(post_id)
   );
CREATE TABLE shares (
   share_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT,
   post_id INT,
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(post_id) REFERENCES posts(post_id)
);
CREATE TABLE hashtags (
   hashtag_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT,
   hashtags VARCHAR(50) NOT NULL,
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE notifications (
   notification_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT NOT NULL,
   content TEXT NOT NULL,
   is_read VARCHAR(5),
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE user_active_status (
   user_id INT,
   status VARCHAR(10),
   last_seen VARCHAR(10),
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);
INSERT INTO users(user_id, user_name, full_name, platform, date_of_birth, gender, email) VALUES
(101,"jino_46","jino jebarson","INSTAGRAM","2003-02-18","male","jino630@gmail.com"),
(102,"nithish.-.kumar","nithish kumar","FACEBOOK","2002-08-21","male","nithishvj@gmail.com"),
(103,"mugil_410","mugilan","INSTAGRAM","2003-07-21","male","mugilan410@gmail.com"),
(104,"sify rxnjxn","sify ranjan","TWITTER","2002-07-19","male","sifyrxn@gmail.com"),
(105,"naresh._.25","naresh kumar","FACEBOOK","2003-01-02","male","naresh712@gmail.com");
INSERT INTO posts(user_id, caption, is_public, posted_at, likes_count, comments_count) VALUES
(101,"TAKE THE RISK OR LOSE THE CHANCE","NO","2020-02-24",250,15),
(102,"RELAXING WITH A CUP OF TEA","NO","2018-05-28",220,10),
(103,"CHECK IT OUT","YES","2012-09-21",310,25),
(104,"FEELING STRONG","NO","2018-04-12",450,50),
(105,"CHALLENGE ACCEPTED","YES","2022-01-23",210,5);
INSERT INTO comments(user_id, post_id, content) VALUES
(101,1,"you're so inspiring"),
(102,2,"this looks delicious"),
(104,4,"looking great");
INSERT INTO likes(user_id, post_id) VALUES
(101,1),
(102,4),
(103,2),
(104,5),
(101,5);
INSERT INTO shares(user_id, post_id) VALUES
(101,1),
(102,2),
(101,3),
(105,2),
(101,2);
INSERT INTO hashtags(user_id, hashtags) VALUES
(101,"#inspiration"),
(102,"#foodie"),
(103,"#shopping"),
(104,"#fitness"),
(105,"#10yearchallenge");
INSERT INTO notifications(user_id, content, is_read)VALUES
(101,"Naresh Kumar liked your post","NO"),
(103,"Jino Jebarson mentioned you in a post","YES"),
(105,"Sify Ranjan started following you","YES");
INSERT INTO user_active_status(user_id, status, last_seen)VALUES
(101,"ACTIVE","NULL"),
(102,"OFFLINE","2hrs ago"),
(103,"ACTIVE","NULL"),
(104,"OFFLINE","8hrs ago"),
(105,"OFFLINE","5hrs ago");  

-- Retrieve users by platform
DELIMITER $$
CREATE PROCEDURE getusersbyplatform(IN platform_name VARCHAR(15))
BEGIN
SELECT * FROM users WHERE platform=platform_name;
END $$
DELIMITER ;
CALL getusersbyplatform("INSTAGRAM");

 -- Retrieve posts from a specific user
 DELIMITER $$
 CREATE PROCEDURE getpostbyusers(IN username VARCHAR(15))
 BEGIN
     SELECT a.user_id,a.post_id,a.caption,a.posted_at,b.user_name
     FROM posts AS a
     JOIN users AS b ON a.user_id=B.user_id
     WHERE b.user_name=username;
END$$
DELIMITER ;
CALL getpostbyusers("jino_46");

-- Retrieve the avg likes_count for the users
DELIMITER $$
CREATE PROCEDURE getusersavglikecounts(IN user_no INT)
BEGIN
    SELECT AVG(likes_count) AS avg_likes,b.user_id,b.user_name
    FROM posts  as a
    JOIN users AS b ON a.user_id=b.user_id WHERE a.user_id=user_no GROUP BY a.user_id;
END$$
DELIMITER ;
CALL getusersavglikecounts(101);

DELIMITER$$
-- Retrieve posts liked by user
DELIMITER $$
CREATE PROCEDURE getpostslikebyuser(IN user_no INT)
BEGIN
    SELECT a.like_id,a.user_id,a.post_id
    FROM likes AS a  
    JOIN users AS b ON a.user_id=b.user_id 
    WHERE a.user_id=user_no;
END$$
DELIMITER ;
CALL getpostslikebyuser(101);

-- Retrieve all active users
DELIMITER $$
CREATE PROCEDURE getactiveusers(IN user_status VARCHAR(10))
BEGIN
    SELECT * FROM user_active_status
    WHERE status=user_status;
END$$
DELIMITER ;
CALL getactiveusers("ACTIVE")

-- Retrieve all the inactive users and their last active details
DELIMITER $$
CREATE PROCEDURE getinactiveusers(IN username VARCHAR(15))
BEGIN
    SELECT a.user_id,a.user_name,b.status,b.last_seen
    FROM users AS a
    JOIN user_active_status AS b ON a.user_id=b.user_id
    WHERE status="OFFLINE" AND last_seen is NOT NULL;
END$$
DELIMITER ;
CALL getinactiveusers("OFFLINE")

-- Retrieve all the users and hashtags
DELIMITER $$
CREATE PROCEDURE gethashtagsbyusers(IN hashtag_name VARCHAR(20))
BEGIN
    SELECT a.user_id,a.user_name,a.full_name,b.hashtags
    FROM users AS a
    JOIN hashtags AS b ON a.user_id=b.user_id 
    WHERE b.hashtags=hashtag_name;
END$$
DELIMITER ;
CALL gethashtagsbyusers("#shopping")

-- Retrieve users having comments
DELIMITER $$
CREATE PROCEDURE getusersbycomments(IN user_no INT)
BEGIN
   SELECT a.user_id,a.user_name,a.full_name,a.gender,b.content
   FROM users AS a
   JOIN comments AS b ON a.user_id=b.user_id WHERE a.user_id=user_no;
END$$
DELIMITER ;
CALL getusersbycomments(102);

-- Retrieve the users who read the notifications
DELIMITER $$
CREATE PROCEDURE getusersbynotifications(IN messages VARCHAR(30))
BEGIN
    SELECT a.user_id,a.user_name,b.content,b.is_read
    FROM users AS a
	JOIN notifications AS b ON a.user_id=b.user_id
    WHERE  is_read= messages;
END$$
DELIMITER ;
CALL getusersbynotifications("yes");

-- Count the users by platform
DELIMITER $$
CREATE PROCEDURE getuserscountbyplatform (IN platform_name VARCHAR(15))
BEGIN
    SELECT COUNT(user_id),platform
    FROM users WHERE platform=platform_name GROUP BY platform;
END$$
DELIMITER ;
CALL getuserscountbyplatform("FACEBOOK");

-- Retrieve users comments between 10 to 100
DELIMITER $$
CREATE PROCEDURE getuserscommentsrange(IN comment_range INT)
BEGIN
    SELECT a.user_id,a.user_name,b.comments_count
    FROM users AS a
    JOIN posts AS b ON a.user_id=b.user_id WHERE b.comments_count=comment_range;
END$$
DELIMITER ;
CALL getuserscommentsrange(15);

-- Retrieve the username by pattern
DELIMITER $$
CREATE PROCEDURE getusersbypattern(IN pattern VARCHAR(20))
BEGIN
SELECT * FROM users
WHERE user_name LIKE pattern;
END $$
DELIMITER ;
CALL getusersbypattern("s%");

-- Retrieve the limited records from users table
DELIMITER $$
CREATE PROCEDURE getlimitedusers(IN limitcount INT)
BEGIN
    SELECT * FROM users 
     LIMIT limitcount;
END$$
DELIMITER ;

CALL getlimitedusers(3);
CALL getusersbyplatform("INSTAGRAM");
CALL getpostbyusers("jino_46");
CALL getusersavglikecounts(101);
CALL getpostslikebyuser(101);
CALL getactiveusers("ACTIVE");
CALL getinactiveusers("OFFLINE");
CALL gethashtagsbyusers("#shopping");
CALL getusersbycomments(102);
CALL getusersbynotifications("yes");
CALL getuserscountbyplatform("FACEBOOK");
CALL getuserscommentsrange(15);
CALL getusersbypattern("s%");
CALL getlimitedusers(3);
-- ----------------------------------------------------------------
