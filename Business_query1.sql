
-- Top 3 Customers for every region 
-- Business Query 1


EXPLAIN USING TEXT 

SELECT DIM_CUSTOMER.CUST_NAME AS CUSTOMER_NAME,
       a.TOTAL_ORDER_VALUE,
       a.REGION ,a.rn

FROM (

SELECT sum(Fct_order.ORDER_TOTALPRICE) as TOTAL_ORDER_VALUE , Fct_order.cust_id AS CUSTOMER_ID , dim_region.REGION_NAME AS REGION , dense_rank() over(partition by dim_region.REGION_NAME order by sum(Fct_order.ORDER_TOTALPRICE) DESC ) as rn

FROM MOCK_PROJECT_DB.CONSUMPTION.FACT_ORDER_CUSTOMER  Fct_order , MOCK_PROJECT_DB.CONSUMPTION.DIM_REGION dim_region

where dim_region.region_id = FCT_ORDER.REGION_ID 

group by Fct_order.cust_id , dim_region.REGION_NAME

) a   , MOCK_PROJECT_DB.CONSUMPTION.DIM_CUSTOMER AS DIM_CUSTOMER
where a.rn<=3 and DIM_CUSTOMER.CUST_ID= a.CUSTOMER_ID  ;











--    mahesh          ---------------------------------------------------------------------------------


explain using text SELECT * FROM (
SELECT a.CUST_NAME,a.REGION_NAME, a.TOTAL_ORDER ,dense_rank() OVER(PARTITION BY a.REGION_NAME ORDER BY a.TOTAL_ORDER DESC  ) AS RANK_
FROM
(SELECT CUST_KEY, CUST_NAME , REGION_NAME,
 SUM(ORDER_TOTALPRICE)  AS TOTAL_ORDER
 FROM  DIM_CUSTOMER DC,
 FACT_ORDER_CUSTOMER FOC,
 DIM_REGION DR
 WHERE DC.CUST_ID=FOC.CUST_ID AND FOC.REGION_ID=DR.REGION_ID
 GROUP BY CUST_KEY, CUST_NAME , REGION_NAME
 ) a
)b
WHERE RANK_<4 















