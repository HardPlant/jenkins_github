-- 쿼리 1
-- 게시글 리스트

select   post_id
        ,title
        ,subtitle
        ,content
        ,author
        ,date
  from
        t_hp_post pst;

-- 쿼리 2
-- 게시글 카테고리

select   category_id
        ,category_nm
        ,image_url
  from
        t_hp_category ctg;

-- 쿼리 2.5
-- 게시글의 카테고리, 이미지

select   pst.title
		,category_nm
        ,image_url
  from
        t_post_category pst_ctg
        join
            t_hp_post pst
        on pst_ctg.fk_post_id = pst.post_id
        join
            t_hp_category ctg
        on pst_ctg.fk_category_id = ctg.category_id
where pst.post_id = 1

-- 쿼리 3
-- 게시글 리스트, 카테고리 (카테고리 없으면 '카테고리 없음' 출력)
select   pst.date
        ,ctg.category_nm
        ,pst.title
        ,pst.content
  from
        t_post_category pst_ctg
        join
            t_hp_post pst
        on pst_ctg.fk_post_id = pst.post_id
        join
            t_hp_category ctg
        on pst_ctg.fk_category_id = ctg.category_id
union all
select   pst.date
        ,'없음' category_nm
        ,pst.title
        ,pst.content
  from
        t_hp_post pst
where not exists(
    select pst.date
        ,'없음' category_nm
        ,pst.title
        ,pst.content
    from 
        t_post_category pst_ctg
    where pst.post_id = pst_ctg.fk_post_id
);
-- 쿼리 4
-- 캘린더, 캘린더 일정 출력
select   cld.date
        ,c_content.title
        ,c_content.content
  from
        t_hp_calendar cld
        join
            t_hp_calendar_content c_content
        on cld.calendar_id = c_content.fk_calendar_id;
-- 쿼리 5
-- 카테고리별 게시글 통계
select category_nm,
       count(title),
       round((count(title) / (select count(title)
                                      from
                                    (select   pst.date
                                                    ,ctg.category_nm
                                                    ,pst.title
                                                    ,pst.content
                                            from
                                                    t_post_category pst_ctg
                                                    join
                                                        t_hp_post pst
                                                    on pst_ctg.fk_post_id = pst.post_id
                                                    join
                                                        t_hp_category ctg
                                                    on pst_ctg.fk_category_id = ctg.category_id
                                            union all
                                            select   pst.date
                                                    ,'없음' category_nm
                                                    ,pst.title
                                                    ,pst.content
                                            from
                                                    t_hp_post pst
                                            where not exists(
                                                select pst.date
                                                    ,'없음' category_nm
                                                    ,pst.title
                                                    ,pst.content
                                                from 
                                                    t_post_category pst_ctg
                                                where pst.post_id = pst_ctg.fk_post_id
                                            )) tb)) * 100 
				  , 0)
  from (select   pst.date
                ,ctg.category_nm
                ,pst.title
                ,pst.content
          from
                t_post_category pst_ctg
                join
                    t_hp_post pst
                on pst_ctg.fk_post_id = pst.post_id
                join
                    t_hp_category ctg
                on pst_ctg.fk_category_id = ctg.category_id
        union all
        select   pst.date
                ,'없음' category_nm
                ,pst.title
                ,pst.content
        from
                t_hp_post pst
        where not exists(
            select pst.date
                ,'없음' category_nm
                ,pst.title
                ,pst.content
            from 
                t_post_category pst_ctg
            where pst.post_id = pst_ctg.fk_post_id
        )) tb
group by category_nm;

-- 쿼리 6
-- 제한된 글 수 가져오기, 최신 순으로
select   post_id
        ,title
        ,subtitle
        ,author
        ,date
    from
        t_hp_post pst
order by date desc
limit 5

-- 쿼리 7
-- 7일 내 글의 갯수

set @date='2019-01-04';

select date
        ,count(date) cnt
    from t_hp_post
    where date <= @date
    AND DATE_SUB(@date, INTERVAL 7 DAY) <= date
group by date