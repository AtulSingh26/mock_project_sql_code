-- How many order were shipped using  L_SHIPINSTRUCT = COLLECT COD

MOCK_PROJECT_DB.CONSUMPTION



select * from MOCK_PROJECT_DB.CONSUMPTION.SHIP_MODE_TRENDS_EVERY_YEAR_FOR_LAST_5_YEARS_REGION_WISE;




SELECT D_C.CUST_NAME , COUNT(a.TOTAL_ORDER) AS TOTAL_COUNT

FROM (
SELECT DISTINCT Fct_order.CUST_ID  , D_O.ORDER_DATE,
 COUNT(D_O.ORDER_ID) OVER(PARTITION BY  D_O.ORDER_DATE order by COUNT(a.TOTAL_ORDER)) AS TOTAL_ORDER

FROM 
DIM_ORDERS   D_O,
FACT_ORDER_CUSTOMER  Fct_order

where   D_O.ORDER_ID  = Fct_order.order_id
) a  , DIM_CUSTOMER D_C
where a.cust_id = D_C.CUST_ID
group by D_C.CUST_NAME

SELECT current_account() as YOUR_ACCOUNT_LOCATOR, current_region() as YOUR_SNOWFLAKE_REGION_ID;



select DISTINCT cust_name AS CUSTOMER_NAME,cust_key,
year_  AS YEAR,
NATION_NAME AS NATION,
which_QUATER ,
summ AS TOTLA_ORDER_VALUE from
(
select DISTINCT b.cust_key,
b.cust_name,
b.year_ ,
NATION_NAME ,
b.which_QUATER ,
b.summ,
dense_rank() over(partition by b.year_,NATION_NAME, b.WHICH_QUATER order by b.summ desc) as rank_
from
(
select a.cust_key,a.cust_name, year_, a.NATION_NAME , which_QUATER, sum(order_totalprice) over(partition by 
a.cust_key, a.cust_name, year_ ,a.NATION_NAME , WHICH_QUATER ) as summ
from
(select DC.cust_KEY, cust_name, YEAR(ORDER_DATE) as year_, NATION_NAME  ,
CASE
    WHEN MONTH(order_date) <4 THEN '1ST_QUARTER'
    WHEN MONTH(order_date) <7 THEN '2ND_QUARTER'
    WHEN MONTH(order_date) <10 THEN '3RD_QUARTER'
    ELSE '4TH_QUARTER' 
    END AS WHICH_QUATER,
    ORDER_TOTALPRICE
from  MOCK_PROJECT_DB.CONSUMPTION.DIM_CUSTOMER DC, MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS DO ,  MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER FOC , MOCK_PROJECT_DB.CONSUMPTION.DIM_NATION DN
WHERE DC.CUST_ID=FOC.CUST_ID AND
 DO.ORDER_ID=FOC.ORDER_ID AND 
 DN.NATION_ID=FOC.NATION_ID) a
) b
) where RANK_<4 ORDER BY YEAR_,NATION_NAME, WHICH_QUATER, RANK_


----- 

select cust_name AS CUSTOMER_NAME,
year_  AS YEAR,
NATION_NAME AS NATION,
which_QUATER ,
summ AS TOTLA_ORDER_VALUE from
(
select DISTINCT b.cust_key,
b.cust_name,
b.year_ ,
NATION_NAME ,
b.which_QUATER ,
b.summ,
dense_rank() over(partition by b.year_,NATION_NAME, b.WHICH_QUATER order by b.summ desc) as rank_
from
(
select a.cust_key,a.cust_name, year_, a.NATION_NAME , which_QUATER, sum(order_totalprice) over(partition by 
a.cust_key, a.cust_name, year_ ,a.NATION_NAME , WHICH_QUATER ) as summ
from
(select DC.cust_KEY, cust_name, YEAR(ORDER_DATE) as year_, NATION_NAME  ,
CASE
    WHEN MONTH(order_date) <4 THEN '1ST_QUARTER'
    WHEN MONTH(order_date) <7 THEN '2ND_QUARTER'
    WHEN MONTH(order_date) <10 THEN '3RD_QUARTER'
    ELSE '4TH_QUARTER' 
    END AS WHICH_QUATER,
    ORDER_TOTALPRICE
from  MOCK_PROJECT_DB.CONSUMPTION.DIM_CUSTOMER DC, MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS DO ,  MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER FOC , MOCK_PROJECT_DB.CONSUMPTION.DIM_NATION DN
WHERE DC.CUST_ID=FOC.CUST_ID AND
 DO.ORDER_ID=FOC.ORDER_ID AND 
 DN.NATION_ID=FOC.NATION_ID) a
) b
) where RANK_<4 ORDER BY YEAR_,NATION_NAME, WHICH_QUATER, RANK_


select * from MOCK_PROJECT_DB.CONSUMPTION.TOP_3_CUSTOMER_EVERY_QUARTERLY_ORDER_CUSTOMER_NATION


select cust_name AS CUSTOMER_NAME,cust_key,
year_  AS YEAR,
REGION_NAME AS REGION,
which_QUATER ,
summ AS TOTLA_ORDER_VALUE from
(
select DISTINCT b.cust_key,
b.cust_name,
b.year_ ,
REGION_NAME ,
b.which_QUATER ,
b.summ,
dense_rank() over(partition by b.year_,REGION_NAME, b.WHICH_QUATER order by b.summ desc) as rank_
from
(
select a.cust_key, a.cust_name, year_, REGION_NAME , which_QUATER, sum(order_totalprice) over(partition by 
a.cust_key, a.cust_name, year_ ,REGION_NAME , WHICH_QUATER ) as summ
from
(select DC.cust_KEY, cust_name, YEAR(ORDER_DATE) as year_, DR.REGION_NAME,
CASE
    WHEN MONTH(order_date) <4 THEN '1ST_QUARTER'
    WHEN MONTH(order_date) <7 THEN '2ND_QUARTER'
    WHEN MONTH(order_date) <10 THEN '3RD_QUARTER'
    ELSE '4TH_QUARTER' 
    END AS WHICH_QUATER,
    ORDER_TOTALPRICE
from  MOCK_PROJECT_DB.CONSUMPTION.DIM_CUSTOMER DC, MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS DO ,  MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER FOC , MOCK_PROJECT_DB.CONSUMPTION.DIM_REGION DR
WHERE DC.CUST_ID=FOC.CUST_ID AND
 DO.ORDER_ID=FOC.ORDER_ID AND 
 DR.REGION_ID=FOC.REGION_ID) a
) b
) where RANK_<4 ORDER BY YEAR_,REGION_NAME, WHICH_QUATER, RANK_


SELECT D_C.CUST_NAME ,COUNT(a.TOTAL_ORDER) AS TOTAL_ORDER

FROM (
SELECT DISTINCT Fct_order.CUST_ID  , D_O.ORDER_DATE,
 COUNT(D_O.ORDER_ID) OVER(PARTITION BY  D_O.ORDER_DATE) AS TOTAL_ORDER

FROM 
MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS   D_O,
MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER  Fct_order

where   D_O.ORDER_ID  = Fct_order.order_id
) a  , DIM_CUSTOMER D_C
where a.cust_id = D_C.CUST_ID
group by D_C.CUST_NAME,a.cust_id
order by 2 DESC limit 3


select D_R.REGION_NAME , count(DISTINCT Fct_part_supply.SUPP_ID) as TOTAL_NUMBER_OF_SUPPLIER
from MOCK_PROJECT_DB.CONSUMPTION.FACT_PART_SUPPLIER Fct_part_supply,
   MOCK_PROJECT_DB.CONSUMPTION.DIM_REGION D_R
where D_R.REGION_ID = FCT_PART_SUPPLY.REGION_ID
GROUP BY D_R.REGION_NAME
order by count(Fct_part_supply.SUPP_ID) DESC





SELECT b.part_brand , b.year , b.total_order
FROM (
SELECT a.part_brand , a.year , a.total_order ,dense_rank() over(partition by  a.year order by a.total_order DESC) as rn 
FROM (
SELECT DISTINCT D_P.PART_BRAND , year(D_O.ORDER_DATE) as year , count(D_O.ORDER_ID) over(partition by D_P.PART_BRAND , year(D_O.ORDER_DATE) ) TOTAL_ORDER 
FROM 
MOCK_PROJECT_DB.CONSUMPTION.DIM_PART D_P,
MOCK_PROJECT_DB.CONSUMPTION.DIM_LINE_ITEM D_L,
MOCK_PROJECT_DB.CONSUMPTION.DIM_ORDERS D_O
where D_P.PART_ID = D_L.PART_ID
AND   D_L.ORDER_ID = D_O.ORDER_ID
) AS  a 
) AS b 
 WHERE b.rn<6


SELECT D_L.SHIP_INSTRUCT,COUNT(ORDER_ID) TOTAL_ORDER_AS_COD 
FROM 
MOCK_PROJECT_DB.CONSUMPTION.DIM_LINE_ITEM D_L
WHERE D_L.SHIP_INSTRUCT = 'COLLECT COD'
group by D_L.SHIP_INSTRUCT


