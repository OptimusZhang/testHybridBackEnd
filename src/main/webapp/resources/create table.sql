--drop table T_GOODS;
create table T_GOODS(
	goods_id    int(8) not null primary key auto_increment,
	goods_name  char(40) not null,
	goods_type  char(1) not null default '1',
	company_id  char(8),
	update_date datetime NOT NULL DEFAULT NOW(),
	update_user char(8) not null,
	delete_flag char(1) not null default '0'
);

--drop table T_QUEST;
create table T_QUEST(
goods_id    int(8) not null,
quest_id    int(8) not null primary key auto_increment,
quest_type  char(1) not null default '1',
quest_class char(1) not null default '1',
quest_title char(40) not null,
quest_text  char(255) not null,
anser1      char(40),
anser2      char(40),
anser3      char(40),
anser4      char(40),
option1     char(80),
option2     char(80),
option3     char(80),
option4     char(80),
disp_flag   char(1) not null default '1',
update_date datetime NOT NULL DEFAULT NOW(),
update_user char(8),
delete_flag char(1)
);