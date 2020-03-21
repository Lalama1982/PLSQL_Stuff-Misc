create table products (
product_id number(6),
product_name nvarchar2(125))
/
insert into products values(10,'product-1');
/
create or replace procedure query_prod(twhr varchar2) is
    stmt varchar2(100);
    pname varchar2(20);

begin
    stmt := 'select product_name from products where product_id = :2';
    execute immediate stmt into pname using twhr;
    dbms_output.put_line(pname);

end;
/
set serveroutput on size 30000;
execute query_prod('10');
/
---- here even though the product id is "number", passing of an argument as "varchar2" will not cause an error.