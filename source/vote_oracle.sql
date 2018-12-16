--确定之后，序列化表单来修改。
--管理员和普通用户的区别，可修改所有的发布
--哪个用户发布的，只可以修改自己的发布

--在item表，根据sid分组查询oid,如果oid有多少个，表示已投过几次票。如果已投过，下次点击投票，item表不增加item项。
--在item表查询sid的个数，有多少个sid，就是多少个人投过。
--每一个oid投票的人数，就是在item表根据oid查uid的个数，并按sid分组，一个组是一个人。

--显示时，在subject表查询所有的sid，在item表查询sid的个数，有多少个sid，就是多少个人投过。在option表，根据sid查有多个少选项。
--如果使用c forcach遍历只能有一个subjectlist,需要subject.title，subject.option.length,选项个数option_num和投票数vote_num是查询出来的，属性里没有，所以必须保存到属性里，全部放到Map里封装数据，

--修改时，根据用户uid查询当前用户的所有sid

  
  drop table vote_user cascade constraints ;
  drop table vote_subject cascade constraints ;
  drop table vote_option cascade constraints ;
  drop table vote_item cascade constraints ;
  
  create table vote_user(
      vu_user_id  number(11) primary key ,
      vu_user_name varchar2(100),
      vu_password varchar2(100),
      vu_status number(10)
  ) ;
  
  create table vote_subject(
    vs_id  number(11) primary key,
    vs_title varchar2(200),
    vs_type number(10)
  ) ;
  
  create table vote_option(
    vo_id number(11) primary key,
    vs_id  number(11),
    vo_option varchar2(200),
    vo_order number(10)
  ) ;
  
  alter table vote_option add constraint fk_op_01
    foreign key(vs_id) references vote_subject(vs_id) ;
  
  create table vote_item(
     vi_id number(11) primary key,
     vu_user_id number(11) ,
     vs_id number(11),
     vo_id number(11)
  ) ;
  
   alter table vote_item add constraint fk_it_01
    foreign key(vu_user_id) references vote_user(vu_user_id) ;
    
   alter table vote_item add constraint fk_it_02
    foreign key(vs_id) references vote_subject(vs_id) ;
    
   alter table vote_item add constraint fk_it_03
    foreign key(vo_id) references vote_option(vo_id) ;
    
    
  