  
  DROP TABLE IF EXISTS vote_item ;
  DROP TABLE IF EXISTS vote_option ;
  DROP TABLE IF EXISTS vote_subject ;
  DROP TABLE IF EXISTS vote_user ;
  
  CREATE TABLE vote_user(
      vu_user_id  INT PRIMARY KEY AUTO_INCREMENT,
      vu_user_name VARCHAR(100),
      vu_password VARCHAR(100),
      vu_status INT
  ) ;
  
  CREATE TABLE vote_subject(
    vs_id  INT PRIMARY KEY AUTO_INCREMENT,
    vs_title VARCHAR(200),
    vs_type INT
  ) ;
  
  CREATE TABLE vote_option(
    vo_id INT PRIMARY KEY AUTO_INCREMENT,
    vs_id  INT,
    vo_option VARCHAR(200),
    vo_order INT
  ) ;
  
  ALTER TABLE vote_option ADD CONSTRAINT fk_op_01
    FOREIGN KEY(vs_id) REFERENCES vote_subject(vs_id) ;
  
  CREATE TABLE vote_item(
     vi_id INT PRIMARY KEY AUTO_INCREMENT ,
     vu_user_id INT ,
     vs_id INT ,
     vo_id INT
  ) ;
  
   ALTER TABLE vote_item ADD CONSTRAINT fk_it_01
    FOREIGN KEY(vu_user_id) REFERENCES vote_user(vu_user_id) ;
    
   ALTER TABLE vote_item ADD CONSTRAINT fk_it_02
    FOREIGN KEY(vs_id) REFERENCES vote_subject(vs_id) ;
    
   ALTER TABLE vote_item ADD CONSTRAINT fk_it_03
    FOREIGN KEY(vo_id) REFERENCES vote_option(vo_id) ;
    
    
  