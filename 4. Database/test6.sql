--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
--(5) 박지성이구매한도서의출판사수 aaaaaaaaa
select * from book;
select * from customer;
select * from orders;

select * from book,customer,orders where orders.custid = customer.custid and orders.bookid = book.bookid;


select custid from customer where name='박지성';

select publisher from book where bookid = (select bookid from orders where custid = (select custid from customer where name='박지성');
select custid from customer where name='박지성';

--(6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이

--(7) 박지성이구매하지않은도서의이름

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

--(8) 주문하지않은고객의이름(부속질의사용)
--(9) 주문금액의총액과주문의평균금액
--(10) 고객의이름과고객별구매액
--(11) 고객의이름과고객이구매한도서목록
--(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
--(13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름

--3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

--4 다음질의에대해DML 문을작성하시오.
--(1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
    --삽입이안될경우필요한데이터가더있는지찾아보자.
--(2) ‘삼성당’에서출판한도서를삭제해야한다.
--(3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.
--(4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.
