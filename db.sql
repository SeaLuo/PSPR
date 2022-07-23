
create database nspim;

create table users
(
userid integer auto_increment not null,
username varchar(32) unique not null,
password char(64) not null,
nickname varchar(32),
picture mediumblob ,
phoneNumber char(11),
email varchar(64),
regdate timestamp default current_timestamp,
primary key (userid)
);

create table groups
(
groupid integer auto_increment not null,
groupname varchar(32) not null,
regdate timestamp default current_timestamp,
primary key (groupid)
);

create table group_members
(
memberid integer auto_increment not null,
groupid integer not null,
userid integer not null,
role integer default 0,
nickname varchar(32),
primary key (memberid)
);

create table friends
(
userid integer not null,
friendid integer not null,
remarkname varchar(32)
);

create table friend_message
(
messageid integer auto_increment not null,
senderid integer not null,
recieverid integer not null,
types integer not null,
messdate timestamp default current_timestamp,
content MEDIUMTEXT, 
pathname varchar(128),
lasttime integer,
spathname varchar(128),
primary key (messageid)
);

create table offline_friend_message
(
 messageid integer not null,
 senderid integer not null,
 recieverid integer not null,
 types integer not null,
 messdate timestamp default current_timestamp,
 content MEDIUMTEXT,
 pathname varchar(128),
 sendstate integer not null,
 lasttime integer,
 primary key (messageid)
 );


create table group_message
(
messageid integer auto_increment not null,
senderid integer not null,
groupid integer not null,
types integer not null,
messdate timestamp default current_timestamp,
content MEDIUMTEXT, 
pathname varchar(128),
lasttime integer,
spathname varchar(128),
primary key (messageid)
);

create table offline_group_message
(
 messageid integer not null,
 senderid integer not null,
 groupid integer not null,
 types integer not null,
 messdate timestamp default current_timestamp,
 content MEDIUMTEXT,
 pathname varchar(128),
 sendstate integer default 0,
 lasttime integer,
 primary key (messageid)
 );

create table offline_groupmessage_user_record
(
messageid integer not null,
userid integer not null,
state integer default 0
);

create table user_check
(
number integer auto_increment not null,
username varchar(32),
identify tinyint,
phoneNumber char(11),
email varchar(64),
checkcode char(5),
checkdate integer,
primary key (number)
);

/*控制转发次数*/
create table transfer_control
(
messageid integer not null,
transferCount integer not null,
primary key (messageid)
);


/*消息流转映射表*/
create table message_transfer_index
(
messageid integer not null,
original integer not null,
messageid1 integer not null,
original1 integer not null,
messageid2 integer not null,
original2 integer not null
);


create table friend_cycle
(
    friendcycleid integer auto_increment not null,
    senderid int          not null,
    sendtime varchar(128) null,
    text     varchar(256) null,
    picpath  varchar(128) null,
    type integer not null,
	picjsonitem  varchar(300) null,
    primary key (friendcycleid)
);

create table friend_cycle_whitelist
(
    friendcycleid integer not null,
    userid integer not null
);

create table friend_cycle_blacklist
(
    friendcycleid integer not null,
    userid integer not null
);





