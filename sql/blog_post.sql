drop table if exists `t_post_category`;
drop table if exists `t_hp_category`;
drop table if exists `t_hp_post`;
drop table if exists `t_hp_calendar_content`;
drop table if exists `t_hp_calendar`;

create table if not exists `t_hp_post`(
    post_id int not null auto_increment,
    title       varchar(100),
    subtitle    varchar(100),
    content     text,
    author      varchar(100),
    date        date,
    primary key (post_id)
);

create table if not exists `t_hp_category`(
    category_id int not null auto_increment,
    category_nm varchar(20),
    image_url       varchar(200),
    primary key (category_id)
);

create table if not exists `t_post_category`(
    fk_post_id      int not null,
    fk_category_id  int not null,
    foreign key (`fk_post_id`) references `t_hp_post`(`post_id`),
    foreign key (`fk_category_id`) references `t_hp_category`(`category_id`)
);

insert into `t_hp_category`(`category_nm`, `image_url`) values
    ('잡담'     , 'post_jabdam.jpg'),
    ('개발 팁'  , 'post_devtip.jpg'),
    ('IT 동향'  , 'post_it.jpg'),
    ('게임'     , 'post_game.jpg'),
    ('사진'     , 'post_pic.jpg'),
    ('회고'     , 'post_reflect.jpg');

insert into `t_hp_post` (`post_id`,`title`, `subtitle`,`author`,`date`,`content`) values
    (1,'테스트'           ,'긴 글 테스트
    짧은 글 테스트'    ,'HardPlant' ,'2019-01-01' ,'테스트 글입니다'),
    (2,'신년 다짐'        ,'신년을 다짐한다
    이번 년도에는 살아남는 웹 개발자가 되고 싶다'      ,'HardPlant' ,'2019-01-01' ,'신년에는 잘 살아야겠다'),
    (3,'신년 회고'        ,'2018년을 회고해본다
    작년에는 어떤 일이 있었을까'  ,'HardPlant' ,'2019-01-01' ,'작년에도 잘 살아남았다'),
    (4,'오늘은 2일이다'   ,'신정 다음 날이다'      ,'HardPlant' ,'2019-01-02' ,'내일은 3일이다'),
    (5,'새해가 밝았다'    ,'새해다'               ,'HardPlant' ,'2019-01-03' ,'별똥별이 떨어진다'),
    (6,'오늘은 금요일이다'    ,'불타는 금요일이다'               ,'HardPlant' ,'2019-01-04' ,'케이크나 먹을까'),
    (7,'오늘은 토요일이다'    ,'즐거운 Step2'               ,'HardPlant' ,'2019-01-05' ,'8주차다
    오늘은 배열을 배울 것이다'),
    (8,'배열 관련 함수들'    ,'스크립트의 배열 관련 함수들'               ,'HardPlant' ,'2019-01-05' ,'.forEach()
    .filter()'),
    (9,'월요일은 찌뿌둥하다'    ,'월요병'               ,'HardPlant' ,'2019-01-06' ,'월요병 예방에는 어떤 것이 좋을까'),
    (10,'오늘은 화요일이다'    ,'화요일의 음식'               ,'HardPlant' ,'2019-01-07' ,'오늘은 만두를 먹어야겠다'),
    (11,'노카테고리 테스트' ,'카테고리가 없는 글이다','HardPlant','2019-01-08' ,'노카테고리 테스트');

insert into `t_post_category` (`fk_post_id`, `fk_category_id`) values
    (1, 1),
    (2, 1),
    (3, 6),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 2),
    (9, 1),
    (10, 1);

create table if not exists `t_hp_calendar`(
    calendar_id int not null auto_increment,
    date        date,
    primary key (`calendar_id`)
);

create table if not exists `t_hp_calendar_content`(
    calendar_content_id int not null auto_increment,
    fk_calendar_id      int not null,
    title               varchar(100),
    content             varchar(100),
    primary key (`calendar_content_id`),
    foreign key (`fk_calendar_id`) references `t_hp_calendar`(`calendar_id`)
);
