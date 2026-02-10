-- SELECT * FROM products;
-- SELECT * FROM staff;
-- SELECT * FROM users;

-- SELECT 'Hello SQL!';
-- SELECT 'Hello SQL!'; -- 대시두개가 주석임

-- SELECT 12+7; 

-- SELECT 'Hello, SQL' AS 인사;

/*

SELECT 'FIND'AS 'First'
		 ,'Insight' AS 'Second' 
		 ,'With SQL' AS 'Third';
		 
-- SELECT 28+891;
-- SELECT 19*27;
-- SELECT 'I love SQL!';
SELECT 
		37+172 AS 'Plus', 
		25*78  AS 'Times',
		'I love SQL!' AS 'Result';

SELECT *
  FROM users
  LIMIT 3
  ;
  
SELECT *
	FROM orderdetails
	; 
  	  
SELECT *
	FROM users
	LIMIT 7
	;
	
SELECT
	'id','user_id','order_date'
	FROM Orders
	;
	
SELECT *
	FROM users
	WHERE country !='Korea';  

SELECT *
	FROM users
	WHERE country ='Korea' AND id=10;  

SELECT *
	FROM users
	WHERE created_at BETWEEN '2010-01-01' AND '2012-01-01';


SELECT *
	FROM users
	WHERE created_at >= '2010-12-01' AND '2011-01-01';


SELECT *
	FROM users
	WHERE country = 'Korea' OR country = 'UK' OR country = 'USA';  

		

SELECT *
	FROM users
	WHERE country IN ('KOREA','UK','USA');  
	  

SELECT *
	FROM users
	WHERE country NOT IN ('KOREA','UK','USA');  
	  
	  	  

SELECT *
	FROM users
	WHERE country LIKE 'S%';  

SELECT *
	FROM users
	WHERE country LIKE 'K_';
	
SELECT *
	FROM users
	WHERE country NOT LIKE 'S%';
	
SELECT *
	FROM users
	WHERE created_at IS NOT NULL ;
	*/
-- --
SELECT 
	created_at,phone,city,country
	FROM users
	WHERE country ='Mexico';

-- ! 컬럼명을 별칭해주는것이기때문에 SELECT구문에 쓴다.
SELECT *, (price-discount_price)AS discount_amount
	FROM products
	WHERE id <= 20 AND price >= 30; 
			
SELECT * 
	FROM users
	WHERE country NOT IN ('KOREA','Canada','Belgium');  
	
-- 4번문제가 컬럼명의 name쓰면 자동으로 다 대문자로 바뀌던데 왜그런걸까 
-- ! 예약어이서 name이 .....
SELECT 
	id,NAME,price
	FROM products
	WHERE name LIKE 'N%';

SELECT *
	FROM Orders
 	WHERE order_date NOT BETWEEN '2015-07-01' AND '2015-10-31';

SELECT*
	FROM users
	;
SELECT * 
  FROM users ORDER BY id DESC;
  
SELECT * 
  FROM users ORDER BY city desc;
  
  
SELECT *
  FROM users ORDER BY 1 DESC;
      
SELECT 
  username,phone,city,country,id	 
  FROM users ORDER BY 1 ASC;
  
        
SELECT 
  city,id	 
  FROM users ORDER BY city DESC, id asc ;


SELECT * 
  	FROM products ORDER BY price DESC;

SELECT *	 
  FROM orders ORDER BY order_date DESC ;

SELECT *	 
  FROM orderdetails ORDER BY product_id DESC, quantity ASC;
  
SELECT COUNT(id) AS cnt FROM orderdetails;


SELECT DISTINCT country AS countries  FROM users;

SELECT *
	FROM products;

SELECT MIN(price) 
	FROM products;
	
SELECT Max(discount_price) 
	FROM products;	
  
SELECT sum(price) 
	FROM products;
-- check 라운드함수 사용법체크
 	  
SELECT round(AVG(price),2) AS avgPrice 
	FROM products;
	
	
SELECT SUBSTR(created_at,1, 10) from users;	
	
	
SELECT SUBSTR(created_at,1, 10)AS DAY,
		 SUBSTR(created_at,1, 7)AS MONTH,
		 created_at	
		    from users;	  
  

SELECT LENGTH(username)as len, username from users order by len;


-- --

SELECT  round(sum(price),2) AS 합계 
	FROM products;

SELECT  round(AVG(price),2) AS 평균
	FROM products
	WHERE id<=30;	

-- 3번체크--
SELECT count(DISTINCT username)  AS 유저수
	FROM users
	WHERE substr(created_at,1 ,7) BETWEEN '2010-10' AND '2010-12';
	
SELECT *
	FROM users;
		
SELECT count(DISTINCT id) AS 유저수
 		from users	
	   WHERE LENGTH(username) < 18 ;
  
SELECT COUNT(id)  
		FROM users
		WHERE country= 'Korea';

SELECT COUNT(id)
		FROM users
		WHERE	country = 'USA';	  
  
SELECT COUNT(id)
		FROM users
		WHERE	country IN ('Korea', 'USA');
		
SELECT country, COUNT(DISTINCT id) AS 국가별회원수
FROM users
GROUP BY country;		

SELECT COUNT(DISTINCT country) FROM users;

SELECT COUNT(id) 
	FROM users
	WHERE country='Korea' AND is_marketing_agree=1;

SELECT COUNT(id) 
	FROM users
	WHERE country='UK' AND is_marketing_agree=1;	

SELECT country, is_marketing_agree AS "동의(1)", COUNT(id) AS 동의사용자 
	FROM users
	GROUP BY country, is_marketing_agree 
	ORDER BY country, 동의사용자 DESC;
	
	
SELECT username, phone, city, country, id FROM users ORDER BY 1 ASC;	


SELECT LENGTH(username)as len, username from users 



SELECT ROUND(SUM(price), 2) AS 합계 
	FROM products;
	
SELECT sum(price)
	FROM products;	

SELECT count(DISTINCT id)  AS 유저수
	FROM users
	WHERE substr(created_at,1 ,7) BETWEEN '2010-10' AND '2010-12';

SELECT *
	FROM orderdetails;
		  
  
select * 
from users
group by id;

select country , count(distinct id)as 국가별사용자수
from users
WHERE country IN('Korea', 'Spian','USA')
group by country


select country, COUNT(distinct id) AS 한국동의자수 
from users
WHERE country IN ('Korea','USA')AND  is_marketing_agree = 1;
  
SELECT *
FROM users
WHERE country='Korea';

SELECT count(DISTINCT id) AS 한국동의자수
FROM users
WHERE country = 'Korea' 
AND is_marketing_agree = 1;
	       
SELECT *
FROM users;      
		
# 		
SELECT country AS 국가 ,  is_marketing_agree AS 마케팅수신동의,  COUNT(distinct id) AS 회원수
#
FROM users
#
GROUP BY country,마케팅수신동의
#
ORDER BY country ,회원수  DESC;	  	  

SELECT *
FROM users;

SELECT country AS 국가 , city AS 도시,  COUNT(distinct id) AS 회원수
FROM users
GROUP BY country, city 
ORDER BY 국가, 회원수  DESC;

SELECT *
FROM orders;


SELECT substr(created_at,1 ,7) AS MONTH, count(distinct id) AS 가입회원수  
FROM users
GROUP BY substr(created_at,1 ,7), is_auth
ORDER BY MONTH desc;
	  	 
			
SELECT order_id, sum(quantity) AS 주문합계
FROM orderdetails	
GROUP BY order_id 
ORDER BY 주문합계 DESC;			
			
SELECT 
FROM orders
GROUP BY staff_id, user_id 
ORDER BY

SELECT substr(order_date,1 ,7) AS 월별, COUNT(DISTINCT user_id) AS 가입회원수
FROM orders	
GROUP BY	SUBSTR(order_date,1 ,7)
ORDER BY 월별DESC;


SELECT *
FROM orders;			
			
SELECT country, COUNT(DISTINCT id) AS 가입회원수
FROM users
WHERE country IN ('Korea','France','USA')
GROUP BY country;


SELECT country, COUNT(DISTINCT id) AS 가입회원수
FROM users
GROUP BY country
HAVING COUNT(DISTINCT id)>7
ORDER BY 가입회원수 DESC;


SELECT *
FROM orders
;

SELECT staff_id as 직원아이디 , COUNT(DISTINCT id) AS 주문건수 , COUNT(DISTINCT user_id) as 주문회원수
FROM orders
group by 직원아이디
having 주문건수>9 and 주문회원수<41 
order by 주문건수 DESC ;



SELECT user_id AS 회원, COUNT(DISTINCT id) AS 주문건수
	FROM orders
	GROUP BY 회원
	HAVING 주문건수>7
	ORDER BY 주문건수desc;

SELECT country as 국가, COUNT(DISTINCT city) AS 도시, COUNT(DISTINCT id) AS 회원수
FROM users
GROUP BY 국가
HAVING 도시>4 AND 회원수>2
ORDER BY 도시desc, 회원수 DESC;

/*	
SELECT country AS 국가,  COUNT(DISTINCT id) AS 회원수
FROM users
WHERE country IN ('USA','Brazil','Korea', 'Argentina','Mexico')
GROUP BY 국가
HAVING 회원수>5
ORDER BY 회원수 DESC; 
*/



	
			 	  