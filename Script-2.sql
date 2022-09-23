create database gleb;
use gleb;

CREATE TABLE IF NOT EXISTS `friends` (
  `id` INT NOT NULL,
  `recipoent_id` INT NOT NULL,
  `sender_id` INT NOT NULL,
  `messages` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
 
 CREATE TABLE IF NOT exists `user` (
  `id` INT NOT NULL,
  `login` VARCHAR(25) NULL,
  `password` VARCHAR(25) NULL,
  `friends_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  `group_chat_id` INT NOT NULL,
  `group_chat_profileid` INT NOT NULL,
  PRIMARY KEY (`id`));
 
 CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL,
  `fio` VARCHAR(45) NULL,
  `city` VARCHAR(50) NULL,
  `ststus` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
 
 CREATE TABLE IF NOT EXISTS `group_chat` (
  `id` INT NOT NULL,
  `name_groups` VARCHAR(45) NULL,
  `messages` VARCHAR(125) NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  `messages` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `seive` (
  `media_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`media_id`));
  
 CREATE TABLE IF NOT EXISTS `media` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `photo` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `photocol` VARCHAR(45) NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `video` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
 CREATE TABLE IF NOT EXISTS `comens` (
  `id` INT NOT NULL,
  `coments` VARCHAR(45) NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id`));
 

-- user_friends
alter table user
add constraint foreign key (friends_id) references friends (id);  
alter table friends
add constraint foreign key (sender_id) references user (id); 
 
-- user_group_chat
alter table user
add constraint foreign key (group_chat_id) references group_chat (id);

-- profile_post
alter table post
add constraint foreign key (profile_id) references profile (id);

-- profile_seive_media
alter table seive
add constraint foreign key (media_id) references media (id);
alter table seive
add constraint foreign key (profile_id) references profile (id);

-- media_video_photo_comens
alter table video
add constraint foreign key (media_id) references media (id);
alter table comens
add constraint foreign key (media_id) references media (id);
alter table photo
add constraint foreign key (media_id) references media (id);