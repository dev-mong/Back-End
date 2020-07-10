--report

create table report(
    idx number(4) PRIMARY KEY,
    sname varchar2(20) not null,
    sno varchar2(10) not null,
    reportfile varchar2(100) not null
);

create sequence report_seq;

insert into report values (report_seq.nextval, '홍길동', '1234','/file/123412341234_report.ppt');

select * from report;