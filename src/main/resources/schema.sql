-- 如果数据库存在，则删除
drop database if exists svcms;
-- 创建数据库
create database svcms default character set utf8 collate utf8_unicode_ci;
-- 如果比哦存在，则删除表
drop table if exists svcms.card;
-- 创建卡牌表
create table svcms.card(
    id int primary key not null auto_increment COMMENT '卡牌id',
    card_name varchar(20) not null COMMENT '卡牌名字',
    card_cost int not null COMMENT '卡牌费用',
    card_level varchar(20) not null comment '卡牌等级',
    card_type varchar(20) not null comment '卡牌类型',
    card_faction varchar(20) not null comment '卡牌阵营',
    card_atk int not null comment '卡牌攻击力',
    card_hp int not null comment '卡牌生命值',
    card_power varchar(100) not null comment '卡牌特性',
    card_intro varchar(250) not null comment '卡牌简介'
) engine=InnoDB comment '卡牌信息表';

-- 插入一条数据
insert into card values(null,'永劫欲求者‧关德温',6,'传说','随从','死灵法师',4,5,'
	进化前 永恒的秘药‧剎那的剧毒入场曲 增加1张命运抉择 所指定的卡片到手牌中。 攻击时 回复自己的PP 1点。进化后 攻击时 回复自己的PP 1点。','
	进化前 日积月累的每个剎那，最终将能成为永恒。进化后 与其一辈子愚蠢地过活，还不如成为我的道具，岂不是更有用?');

-- 创建用户表
create table svcms.user(
    id int primary key not null auto_increment comment '用户id',
    username varchar(20) not null comment '用户名',
    password varchar(20) not null comment '密码'
) engine=InnoDB comment '用户信息表';

-- 使用数据库
use svcms;
-- 查看卡牌表
select * from card;
-- 查看用户表
select * from user;

-- 插入一个管理用户
insert into user values(null,'admin','123123');
