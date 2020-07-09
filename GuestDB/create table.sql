--방명록 테이블
create table guestbook_message (
    message_id number(4) primary key,
    guest_name varchar2(50) not null,
    password varchar2(10) not null,
    message varchar2(2000) not null
);

create sequence message_id_seq increment by 1 start with 1; 

insert into guestbook_message 
values (message_id_seq.nextVal,'test10','9999','테스트중입니다.');
commit;

SELECT * FROM guestbook_message order by message_id desc;

SELECT rownum,message_id, guest_name, password, message 
FROM guestbook_message
order by message_id desc
;

-- rownum 조건
-- 마지막 입력 한 message 부터 출력
select  rownum rnum,message_id, guest_name, password, message
from(
    select * from guestbook_message m order by m.message_id desc
)where rownum<=6
;

--2page 4~6 
select message_id, guest_name, password, message
from (

   select  rownum rnum,message_id, guest_name, password, message
    from(
        select * from guestbook_message m order by m.message_id desc
    )where rownum<=6 -- end row
    
)where rnum>=4; --start row





