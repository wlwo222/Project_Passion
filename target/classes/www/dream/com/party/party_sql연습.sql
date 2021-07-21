select *
  from s_party;

--카테션 프로덕트. 정보 건수의 곱하기로 건수가 만들어 져서... 가치없는 것이야
select *
  from s_party p, s_contact_point cp;
--join
select *
  from s_party p, s_contact_point cp
 where p.user_id = cp.user_id;
--Outer
select *
  from s_party p, s_contact_point cp
 where p.user_id = cp.user_id(+);
select *
  from s_party p left outer join s_contact_point cp on p.user_id = cp.user_id;
--회장님의 정보와 연락처 정보를 조회
select name, birth_dt, sex, descrim, contact_point_type, info
  from s_party p left outer join s_contact_point cp on p.user_id = cp.user_id
 where p.user_id ='admin';
 
 
 
BEGIN
  update s_contact_point
     set info = case when contact_point_type = 'address' then info'1'
                 when ACC = '4' then '2' end
   where ACC in ('3','4'); 
  dbms_output.put_line('rows updated '  || SQL%ROWCOUNT);
END;

Update cp
   set cp.info = '수정' 
 where cp.user_id = cp_v.user_id
   and cp.contact_point_type = cp_v.contact_point_type

CREATE OR REPLACE VIEW cp_v 
AS
 select cp.user_id, cp.contact_point_type, cp.info
		    from s_contact_point cp, s_party p
		   where cp.user_id = p.user_id
		     and cp.user_id = 'hong'
;

--제약조건명을 지정한 경우
CREATE OR REPLACE VIEW v_emp 
AS
select cp.user_id, cp.contact_point_type, cp.info
		    from s_contact_point cp, s_party p
		   where cp.user_id = p.user_id
		     and cp.user_id = 'hong'
      WITH CHECK OPTION CONSTRAINT emp_ck
      
<foreach collection="list" item="item" separator=";" open="DECLARE BEGIN" close="; END;">
        UPDATE s_contact_point cp SET cp.info=#{}
         <where>
        cp.contact_point_type=#{} AND cp.user_id=#{item.se_low}
         </where>
 </foreach>
      
Update s_contact_point cp
   set cp.info = '수정' 
 where cp.user_id = 'admin'
   and cp.contact_point_type = 'address';