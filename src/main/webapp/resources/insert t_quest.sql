insert into T_QUEST (goods_id, quest_type, quest_class, quest_title, quest_text, anser1, anser2, anser3, anser4, option1, option2, option3, option4, update_user, delete_flag)
values (44444444, '1', '1', 'title4', 'text4444444444', 'anser1111', 'anser2222', 'anser3333', 'anser4444', 'option1111', 'option2222', 'option3333', 'option4444', 'admin', '0');

delete from T_GOODS;
insert into T_GOODS(goods_id,goods_name,company_id,	update_user) values (11111111, '人寿险', '10000000', 'admin');
insert into T_GOODS(goods_id,goods_name,company_id,	update_user) values (22222222, '重大疾病险', '10000000', 'admin');
insert into T_GOODS(goods_id,goods_name,company_id,	update_user) values (33333333, '养老险', '10000000', 'admin');
insert into T_GOODS(goods_id,goods_name,company_id,	update_user) values (44444444, '车险', '10000000', 'admin');
insert into T_GOODS(goods_id,goods_name,company_id,	update_user) values (55555555, '财产险', '10000000', 'admin');