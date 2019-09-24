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
    card_level int not null comment '卡牌等级',
    card_type varchar(20) not null comment '卡牌类型',
    card_faction varchar(20) not null comment '卡牌阵营',
    card_atk int not null comment '卡牌攻击力',
    card_hp int not null comment '卡牌生命值',
    card_power varchar(100) not null comment '卡牌特性',
    card_intro varchar(250) not null comment '卡牌简介'
) engine=InnoDB comment '卡牌信息表';

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