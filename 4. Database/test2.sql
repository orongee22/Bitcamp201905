--1 ���缭���ǰ��̿䱸�ϴ´�������������SQL �����ۼ��Ͻÿ�.
--(1) ������ȣ��1�ε������̸�
select bookname from book 
where bookid=1;

--(2) ������20,000���̻��ε������̸�
select bookname from book
where price>=20000;

--(3) ���������ѱ��ž�(�������ǰ���ȣ��1�����γ����ۼ�)
select saleprice from orders 
where custid=1; -- �ѱ��ž�?

--(4) �������̱����ѵ����Ǽ�(�������ǰ���ȣ��1�����γ����ۼ�)
select bookid from orders where custid=1;

--2 ���缭���ǿ�ڿͰ濵�ڰ��䱸�ϴ´�������������SQL �����ۼ��Ͻÿ�.
--(1) ���缭���������Ѱ���
select bookname from book;

--(2) ���缭��������������ϴ����ǻ����Ѱ���
select distinct publisher from book;

--(3) �������̸�, �ּ�
select name, address fr om customer;

--(4) 2014��7��4��~7��7�ϻ��̿��ֹ������������ֹ���ȣ
select orderid from orders 
where orderdate between '2014/07/04' and '2014/07/07';

--(5) 2014��7��4��~7��7�ϻ��̿��ֹ����������������ѵ������ֹ���ȣ
select orderid from orders 
where orderdate not between '2014/07/04' and '2014/07/07';

--(6) ���̡��衯���ΰ����̸����ּ�
select name, address from customer 
where name like '��%';

--(7) ���̡��衯���̰��̸��̡��ơ��γ����°����̸����ּ�
select name,address from customer 
where name like '��%��';