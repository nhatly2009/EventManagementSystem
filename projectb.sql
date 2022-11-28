DROP DATABASE IF EXISTS `projectb`;
CREATE DATABASE  IF NOT EXISTS `projectb`;
USE `projectb`;


CREATE TABLE `admin` (
    `admin_username` VARCHAR(45) NOT NULL,
    `admin_password` VARCHAR(100) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `admin` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3');

CREATE TABLE `student` (
    `student_id` int(11) NOT NULL AUTO_INCREMENT,
    `student_username` VARCHAR(45) NOT NULL,
    `student_password` VARCHAR(100) NOT NULL,
    `student_email` VARCHAR(45) DEFAULT NULL,
    `student_fullname` VARCHAR(45) DEFAULT NULL,
    `student_phone` VARCHAR(12) DEFAULT NULL,
    `student_major` VARCHAR(45) DEFAULT NULL,
    `student_image` VARCHAR(255) DEFAULT NULL,
    `student_status` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`student_id`),
    UNIQUE KEY `student_username_UNIQUE` (`student_username`)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `student` VALUES (1001,'account01','e10adc3949ba59abbe56e057f20f883e','account1@gmail.com','Account Number 1','0919000111','Engineering','uploadImages\\student\\account01.jpg','Available');
INSERT INTO `student` VALUES (1002,'account02','e10adc3949ba59abbe56e057f20f883e','account2@gmail.com','Account Number 2','0919000111','Nursing','uploadImages\\student\\account02.jpg','Available');
INSERT INTO `student` VALUES (1003,'account03','e10adc3949ba59abbe56e057f20f883e','account3@gmail.com','Account Number 3','0919000111','Law','uploadImages\\student\\account03.jpg','Available');
INSERT INTO `student` VALUES (1004,'account04','e10adc3949ba59abbe56e057f20f883e','account4@gmail.com','Account Number 4','0919000111','Business','uploadImages\\student\\account04.jpg','Available');
INSERT INTO `student` VALUES (1005,'account05','e10adc3949ba59abbe56e057f20f883e','account5@gmail.com','Account Number 5','0919000111','Engineering',"uploadImages\\student\\account05.jpg",'Available');
INSERT INTO `student` VALUES (1006,'account06','e10adc3949ba59abbe56e057f20f883e','account6@gmail.com','Account Number 6','0919000111','Business','uploadImages\\student\\account06.jpg','Available');
INSERT INTO `student` VALUES (1007,'account07','e10adc3949ba59abbe56e057f20f883e','account7@gmail.com','Account Number 7','0919000111','Nursing','uploadImages\\student\\account07.jpg','Available');
INSERT INTO `student` VALUES (1008,'account08','e10adc3949ba59abbe56e057f20f883e','account8@gmail.com','Account Number 8','0919000111','Engineering','uploadImages\\student\\account08.jpg','Available');
INSERT INTO `student` VALUES (1009,'account09','e10adc3949ba59abbe56e057f20f883e','account9@gmail.com','Account Number 9','0919000111','Business','uploadImages\\student\\account09.jpg','Available');
INSERT INTO `student` VALUES (1010,'account10','e10adc3949ba59abbe56e057f20f883e','account10@gmail.com','Account Number 10','0919000111','Engineering','uploadImages\\student\\account10.jpg','Available');
INSERT INTO `student` VALUES (1011,'account11','e10adc3949ba59abbe56e057f20f883e','account11@gmail.com','Account Number 11','0919000111','Information Technology','uploadImages\\student\\account11.jpg','Available');
INSERT INTO `student` VALUES (1012,'account12','e10adc3949ba59abbe56e057f20f883e','account12@gmail.com','Account Number 12','0919000111','Engineering','uploadImages\\student\\account12.jpg','Available');
INSERT INTO `student` VALUES (1013,'account13','e10adc3949ba59abbe56e057f20f883e','account13@gmail.com','Account Number 13','0919000111','Web Management','uploadImages\\student\\account13.jpg','Available');
INSERT INTO `student` VALUES (1014,'account14','e10adc3949ba59abbe56e057f20f883e','account14@gmail.com','Account Number 14','0919000111','Engineering','uploadImages\\student\\account14.jpg','Available');
INSERT INTO `student` VALUES (1015,'account15','e10adc3949ba59abbe56e057f20f883e','account15@gmail.com','Account Number 15','0919000111','Business','uploadImages\\student\\account15.jpg','Available');
INSERT INTO `student` VALUES (1016,'account16','e10adc3949ba59abbe56e057f20f883e','account16@gmail.com','Account Number 16','0919000111','Information Technology','uploadImages\\student\\account16.jpg','Available');
INSERT INTO `student` VALUES (1017,'account17','e10adc3949ba59abbe56e057f20f883e','account17@gmail.com','Account Number 17','0919000111','Business','uploadImages\\student\\account17.jpg','Available');
INSERT INTO `student` VALUES (1018,'account18','e10adc3949ba59abbe56e057f20f883e','account18@gmail.com','Account Number 18','0919000111','Engineering','uploadImages\\student\\account18.jpg','Available');
INSERT INTO `student` VALUES (1019,'account19','e10adc3949ba59abbe56e057f20f883e','account19@gmail.com','Account Number 19','0919000111','Information Technology','uploadImages\\student\\account19.jpg','Available');
INSERT INTO `student` VALUES (1020,'account20','e10adc3949ba59abbe56e057f20f883e','account20@gmail.com','Account Number 20','0919000111','Nursing','uploadImages\\student\\account20.jpg','Available');

CREATE TABLE `staff` (
    `staff_id` int(11)  NOT NULL AUTO_INCREMENT,
    `staff_username` VARCHAR(45) NOT NULL,
    `staff_password` VARCHAR(100) NOT NULL,
    `staff_email` VARCHAR(45) DEFAULT NULL,
    `staff_fullname` VARCHAR(45) DEFAULT NULL,
    `staff_phone` VARCHAR(45) DEFAULT NULL,
    `staff_image` VARCHAR(100) DEFAULT NULL,
    `staff_status` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`staff_id`),
    UNIQUE KEY `staff_username_UNIQUE` (`staff_username`)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `staff` VALUES (1001,'staff01','e10adc3949ba59abbe56e057f20f883e','staff01@gmail.com','Staff Number 01','0919000111','uploadImages\\staff\\staff01.jpg','Available');
INSERT INTO `staff` VALUES (1002,'staff02','e10adc3949ba59abbe56e057f20f883e','staff02@gmail.com','Staff Number 02','0919000111','uploadImages\\staff\\staff02.jpg','Available');
INSERT INTO `staff` VALUES (1003,'staff03','e10adc3949ba59abbe56e057f20f883e','staff03@gmail.com','Staff Number 03','0919000111','uploadImages\\staff\\staff03.jpg','Available');
INSERT INTO `staff` VALUES (1004,'staff04','e10adc3949ba59abbe56e057f20f883e','staff04@gmail.com','Staff Number 04','0919000111','uploadImages\\staff\\staff04.jpg','Available');
INSERT INTO `staff` VALUES (1005,'staff05','e10adc3949ba59abbe56e057f20f883e','staff05@gmail.com','Staff Number 05','0919000111','uploadImages\\staff\\staff05.jpg','Available');

CREATE TABLE `event_type` (
    `event_type_id` int(11)  NOT NULL AUTO_INCREMENT,
    `event_type_name` VARCHAR(80) Not NULL,
    `event_type_description` VARCHAR(1000) DEFAULT NULL,
    `event_type_status` varchar(20) NOT null,
    PRIMARY KEY (`event_type_id`),
     UNIQUE KEY `event_type_name_UNIQUE` (`event_type_name`)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

insert into `event_type` values (1001,'Halloween','Halloween is a holiday that marks the day before the Western Christian feast of All Saints, or All Hallows, and initiates the season of Allhallowtide. In much of Europe and North America, celebration of Halloween is largely nonreligious..','Available');
insert into `event_type` values (1002,'Internship Cource','This is unique professional learning opportunities typically reserved for college students or recent graduates ','Available');
insert into `event_type` values (1003,'Alumni Sharing Series','The sharing session is to help you have more orientation for your future career, so 2nd, 3rd and final year students should register to attend.','Available');
insert into `event_type` values (1004,'Exchange with musician Phan Thanh Tien','Musician Phan Thanh Tien - The first Vietnamese to create a 5-string Viola Pomposa. This will be an opportunity for students who are passionate about musical instruments and vocals to have a chance to talk directly with musician Phan Thanh Tien.','Available');
insert into `event_type` values (1005,'Extracurricular Activities','Plus point when joining this event','Available');
insert into `event_type` values (1006,'Black Friday','This event is a sale day for discounted products','Available');
insert into `event_type` values (1007,'Acoustic Music','This is a music exchange for student singers','Available');
insert into `event_type` values (1008,'Weekend Market','This is a time that students can buy and sell everything at a cheaper price','Available');
CREATE TABLE `event_suggest` (
    `event_suggest_id` int(11)  NOT NULL AUTO_INCREMENT,
    `student_id` int(11) NOT NULL,
    `event_type_id` int(11) NOT NULL,
    `event_suggest_title` VARCHAR(255) NOT NULL,
    `event_suggest_location` VARCHAR(255) NOT NULL,
    `event_suggest_description` VARCHAR(1000) NOT NULL,
    `event_suggest_submit_date` DATE NOT NULL,
    `event_suggest_status` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`event_suggest_id`),
    FOREIGN KEY (student_id)  REFERENCES student (student_id),
    FOREIGN KEY (event_type_id)  REFERENCES event_type (event_type_id)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `event_suggest` VALUES (1001,'1001','1005','Extracurricular Activities Between Becamex Tokyu And EIU','Hikari Binh Duong new City','This is an opportunity for us to contribute a little to make the new city green and beautiful.','2022-09-10','Seen');
INSERT INTO `event_suggest` VALUES (1002,'1005','1005','Extracurricular Activities Between Becamex Tokyu And EIU','Hikari Binh Duong new City','This is an opportunity for us to contribute a little to make the new city green and beautiful.','2022-10-25','Pending');
INSERT INTO `event_suggest` VALUES (1003,'1006','1001','Halloween 2022','Eastern International University','Halloween has always been a holiday filled with mystery, magic and superstition. It began as a Celtic end-of-summer festival during which people felt especially close to deceased relatives and friends. For these friendly spirits, they set places at the dinner table, left treats on doorsteps and along the side of the road and lit candles to help loved ones find their way back to the spirit world.
Today’s Halloween ghosts are often depicted as more fearsome and malevolent, and our customs and superstitions are scarier too. We avoid crossing paths with black cats, afraid that they might bring us bad luck. This idea has its roots in the Middle Ages, when many people believed that witches avoided detection by turning themselves into black cats.','2022-10-25','Seen');
INSERT INTO `event_suggest` VALUES (1004,'1002','1007','Acoustic Music','Sora Gradens Binh Duong New City','This is an opportunity for us to help students unleash their passion for music.','2022-10-25','Pending');
INSERT INTO `event_suggest` VALUES (1005,'1008','1005','Extracurricular Activities','Nam Ki Khoi Nghia Street, Hoa Phu, Thu Dau Mot, Binh Duong','This is an opportunity for us to contribute a little to make the new city green and beautiful.','2022-10-25','Seen');

CREATE TABLE `event` (
    `event_id` int(11)  NOT NULL AUTO_INCREMENT,
	`event_type_id` int(11) NOT NULL,
    `event_title` VARCHAR(255) NOT NULL,
    `event_location` VARCHAR(255) NOT NULL,
    `event_description` VARCHAR(1000) NOT NULL,
    `event_date_start` DATE NOT NULL,
    `event_date_for_jointRequest` DATE NOT NULL,
    `event_image` VARCHAR(100) DEFAULT NULL,
    `staff_id` int(11) NOT NULL,
    `event_status` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`event_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
    FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `event` VALUES (1001,'1005','Extracurricular Activities Between Becamex Tokyu And EIU','Hikari Binh Duong new City','This is an opportunity for us to contribute a little to make the new city green and beautiful.','2022-11-30','2022-10-30','uploadImages\\event\\event1001.jpg','1005','Available');
INSERT INTO `event` VALUES (1002,'1005','Cổ động bóng đá CLB Becamex và CLB Kawasaki Frontale','Binh Duong Provincial Stadium','Nhân dịp kỷ niệm 50 năm quan hệ ngoại giao giữa Việt Nam - Nhật Bản, Uỷ Ban nhân dân tỉnh Bình Dương và Công ty Cổ phần câu lạc bộ bóng đá Becamex Bình Dương tổ chức trận đấu bóng đá giao hữu giữa hai đội CLB Becamex Bình Dương và CLB Kawasaki tại sân vận động tỉnh Bình Dương. 
Đây là cơ hội để các bạn trực tiếp thấy các cầu thủ chuyên nghiệp thi đấu và nâng cao tinh thần thể thao của tỉnh nhà.
 Vì vậy nhà trường huy động các bạn sinh viên tham gia cổ động cho trận đấu giao hữu.','2022-11-20','2022-10-27','uploadImages\\event\\event1002.jpg','1002','Available');
INSERT INTO `event` VALUES (1003,'1001','Halloween 2022','Eastern International University','Halloween has always been a holiday filled with mystery, magic and superstition. It began as a Celtic end-of-summer festival during which people felt especially close to deceased relatives and friends. 
For these friendly spirits, they set places at the dinner table, left treats on doorsteps and along the side of the road and lit candles to help loved ones find their way back to the spirit world.
Today’s Halloween ghosts are often depicted as more fearsome and malevolent, and our customs and superstitions are scarier too. We avoid crossing paths with black cats, afraid that they might bring us bad luck. This idea has its roots in the Middle Ages, when many people believed that witches avoided detection by turning themselves into black cats.','2022-10-30','2022-10-28','uploadImages\\event\\event1003.jpg','1003','Available');
INSERT INTO `event` VALUES (1004,'1007','Acoustic Music','Sora Gradens Binh Duong New City','This is an opportunity for us to help students unleash their passion for music.','2022-11-30','2022-10-28','uploadImages\\event\\event1004.jpg','1001','Available');
INSERT INTO `event` VALUES (1005,'1005','Extracurricular Activities','Nam Ki Khoi Nghia Street, Hoa Phu, Thu Dau Mot, Binh Duong','This is an opportunity for us to contribute a little to make the new city green and beautiful.','2022-11-30','2022-10-28','uploadImages\\event\\event1005.jpg','1004','Available');
INSERT INTO `event` VALUES (1006,'1008','Black Friday','School yard','Black Friday 2022 is finally here, deal-seekers! If you haven\'t been shopping for the last month, now\'s the time to start seeing what all your favorite stores are going to be offering. We\'ve rounded up the most exciting offers, so be sure to come with us before they sell out!','2022-12-09','2022-12-02','uploadImages\\event\\event1006.jpg','1001','Available');
INSERT INTO `event` VALUES (1007,'1002','Intern CVs Workshop','BBI serminar zone Block 3 EIU','As you have registered, next semester 2022-2023 you will go to practice at the company. However, to be admitted to the internship, it depends on your ability, capacity and performance in the interview, so the internship needs to be carefully prepared from writing a CV.
OCE Center will organize a workshop to guide you to write your CV at BBI serminar zone, Block 3, EIU.
This workshop is very important for your internship as well as your future job applications, so you must attend. If you have a class schedule that coincides with the above time, you can ask for permission from the teacher to be absent from school to participate.','2022-12-09','2022-12-02','uploadImages\\event\\event1007.jpg','1001','Available');


CREATE TABLE `event_joint_request` (
    `student_id` int(11) NOT NULL ,
    `event_id` int(11) NOT NULL,
    `date_sent` DATE NOT NULL,
    `event_joint_request_status` VARCHAR(45) DEFAULT NULL,
    `update_by` varchar(25) DEFAULT NULL,
    PRIMARY KEY (`event_id` , `student_id`),
    FOREIGN KEY (`student_id`)  REFERENCES `student` (`student_id`),
    -- FOREIGN KEY (`update_by`)   REFERENCES `staff` (`staff_id`), 
    FOREIGN KEY (`event_id`)    REFERENCES `event` (`event_id`)
)  ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `event_joint_request` VALUES ('1001','1001','2022-10-25','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1001','1002','2022-10-25','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1003','1003','2022-10-24','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1002','1001','2022-10-26','Accepted','Admin');
INSERT INTO `event_joint_request` VALUES ('1002','1002','2022-10-27','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1004','1003','2022-10-22','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1005','1001','2022-10-22','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1006','1001','2022-10-21','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1006','1002','2022-10-26','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1007','1001','2022-10-25','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1008','1003','2022-10-03','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1009','1002','2022-10-02','Canceled','Loading');
INSERT INTO `event_joint_request` VALUES ('1010','1002','2022-10-21','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1011','1003','2022-10-22','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1012','1003','2022-10-25','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1012','1005','2022-10-24','Cancel','Loading');
INSERT INTO `event_joint_request` VALUES ('1015','1004','2022-10-24','Pending','Loading');
INSERT INTO `event_joint_request` VALUES ('1013','1005','2022-10-25','Cancel','Loading');
INSERT INTO `event_joint_request` VALUES ('1013','1004','2022-10-20','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1015','1005','2022-10-20','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1016','1004','2022-10-22','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1010','1005','2022-10-21','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1017','1005','2022-10-25','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1018','1005','2022-10-25','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1019','1004','2022-10-26','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1015','1002','2022-10-27','Canceled','Loading');
INSERT INTO `event_joint_request` VALUES ('1020','1002','2022-10-30','Accepted','Loading');
INSERT INTO `event_joint_request` VALUES ('1009','1004','2022-10-30','Accepted','Loading');