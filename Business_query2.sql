-- Top 3 Customer every half-yearly
-- Business query 2


EXPLAIN USING TEXT SELECT D_C.CUST_NAME , a.year as YEAR  , a.TOTAL_ORDER_VALUE AS TOTAL_ORDER_VALUE  , a.which_half_year

FROM (
WITH DIM_ORDERS AS (

 SELECT * , 
 CASE WHEN month(ORDER_DATE) < 7
 THEN 'FIRST_HALF'
 ELSE 'SECOND_HALF' 
 END  WHICH_HALF_YEAR
 FROM MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS
) 
SELECT Fct_order.CUST_ID , year(D_O.ORDER_DATE) AS YEAR , D_O.WHICH_HALF_YEAR,SUM(Fct_order.ORDER_TOTALPRICE) AS TOTAL_ORDER_VALUE , dense_rank() OVER(PARTITION BY year(D_O.ORDER_DATE),D_O.WHICH_HALF_YEAR ORDER BY SUM(Fct_order.ORDER_TOTALPRICE) DESC ) AS RN 

FROM DIM_ORDERS D_O , MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER Fct_order 
WHERE D_O.ORDER_ID = Fct_order.ORDER_ID 
group by Fct_order.CUST_ID,year(D_O.ORDER_DATE) , D_O.WHICH_HALF_YEAR

) a  , MOCK_PROJECT_DB.CONSUMPTION.DIM_CUSTOMER AS D_C
where a.rn <=3 and D_C.CUST_ID = a.CUST_ID

order by a.year,a.which_half_year












--- MAHESH  ---------------------------------------------------------------------------------------------------


select * from
(
select DISTINCT b.cust_key, b.cust_name, b.year_ , b.which_half ,b.summ, dense_rank() over(
partition by b.year_, b.which_half order by b.summ desc) as rank_
from
(
select a.cust_key, a.cust_name, year_ , which_half, sum(order_totalprice) over(partition by 
a.cust_key, a.cust_name, year_ , which_half ) as summ
from
(select DC.cust_KEY, cust_name, YEAR(ORDER_DATE) as year_,
CASE
    WHEN MONTH(order_date) <7 THEN 'FIRST_HALF'
    ELSE 'SECOND_HALF' 
    END AS WHICH_HALF,
    ORDER_TOTALPRICE
from  DIM_CUSTOMER DC, DIM_ORDERS DO ,  FACT_ORDER_CUSTOMER FOC
WHERE DC.CUST_ID=FOC.CUST_ID AND DO.ORDER_ID=FOC.ORDER_ID) a
) b
) where RANK_<4 ORDER BY YEAR_, WHICH_HALF, RANK_




















