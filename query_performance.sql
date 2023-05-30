
drop table partsupp;


SELECT DISTINCT 
  CUSTKEY,
  CUSTOMER,
  CUST_ADDRESS ,
  NATIONKEY,
  PHONE,
  CUST_ACCTBAL
 
  from CUSTOMER;




  SELECT 
  CUSTKEY,
  CUSTOMER,
  CUST_ADDRESS ,
  NATIONKEY,
  PHONE,
  CUST_ACCTBAL

  from CUSTOMER

  GROUP by 1,2,3,4,5,6;



  SELECT  
  CUSTKEY,
  ORDERKEY,
  ORDER_COMMENT
  FROM ORDER_SUMMARY;



  SELECT  
  ORDERKEY
  FROM ORDER_SUMMARY
  GROUP BY 1;




   SELECT  NATIONKEY,
    NATION AS  NATION_NAME,
     REGIONKEY,
     REGION AS REGION_NAME
     FROM ORDER_SUMMARY





       SELECT  
     REGIONKEY,
     REGION AS REGION_NAME
    FROM ORDER_SUMMARY
    GROUP BY 1,2;MOCK_PROJECT_DB.CURATED.NATION


     SELECT  
     *
    FROM ORDER_SUMMARY
    WHERE
    ORDERKEY=1605959;


    delete from order_summary where orderkey=84010 and region IS NULL;

    UPDATE  ORDER_SUMMARY   
    SET REGION='ASIA'
    WHERE ORDERKEY=1605959 AND REGIONKEY=2 AND REGION IS NULL






     SELECT  
     ORDERKEY,
     CUSTKEY,
     ORDERSTATUS,
     TOTALPRICE,
     ORDERDATE,
     ORDERPRIORITY,
     CLERK,
     SHIPPRIORITY,
     NATIONKEY,
     REGIONKEY,
     ORDER_COMMENT
     from MOCK_PROJECT_DB.RAW.ORDER_SUMMARY


     select part_comment,partkey from part_supply_supplier group by part_comment,partkey;
      select count(partkey) from part_supply_supplier group by partkey;


      select ((orderdate::string)::DATE) from order_summary
      where orderdate  regexp '../../....'

      alter orderdate 


      select orderdate from order_summary
       where orderdate  regexp '../../....'
      where orderdate  regexp '....-..-..'
      
      order by orderdate
      where orderdate = '29/02/2020'

      SELECT try_to_date(orderdate::date,'MMddyyyy') as refund_date
      from orders


      

MOCK_PROJECT_DB.CURATED.PARTKEY_COMMENT


    UPDATE  ORDER_SUMMARY   
    SET orderdate='2020-02-29'
    WHERE ORDERDATE='29/02/2020'




-- vvvip
    
    update order_summary set  orderdate = TO_DATE(orderdate, 'DD/MM/YYYY') where orderdate  regexp '../../....' ;

CREATE TASK mytask_hour
WAREHOUSE = mywh
SCHEDULE = 'USING CRON 0 9-17 * * SUN America/Los_Angeles'
AS
UPDATE order_summary SET  orderdate = TO_DATE(orderdate, 'DD/MM/YYYY') WHERE orderdate  REGEXP '../../....' ;


show tasks
MOCK_PROJECT_DB.CURATED.CUSTOMER_ORDER_COMMENTMOCK_PROJECT_DB.CURATED.CUSTOMER_ORDER_COMMENTMOCK_PROJECT_DB.CURATED.CUSTOMER_ORDER_COMMENTMOCK_PROJECT_DB.CURATED.CUSTOMER_ORDER_COMMENT


SELECT  
     SUPPKEY,
     SUPPLIER_NAME,
     ADDRESS,
     SUPPLIER_NATION,
     PHONE,
     ACCTBAL AS SUPP_ACC_BAL,
     SUPPLIER_COMMENT

     from MOCK_PROJECT_DB.RAW.PART_SUPPLY_SUPPLIER
     group by 1,2,3,4,5,6,7



select distinct cnt
from
(SELECT  
  CUSTKEY,
  ORDERKEY,
  ORDER_COMMENT, count(*) as cnt
  from order_summary
  group by 1,2,3 );

  select distinct partkey from MOCK_PROJECT_DB.RAW.part_supply_supplier
    minus
  select distinct partkey from MOCK_PROJECT_DB.RAW.line_item_supply
 



select distinct cnt from
  (select partkey,PART_COMMENT,count(*) as cnt from part group by partkey, PART_COMMENT ORDER BY 2 DESC)


  SELECT  
     PARTKEY,
     PARTNAME,
     MFGR,
     BRAND,
     TYPE,
     SIZE,
     AVAILQTY,
     CONTAINER,
     RETAILPRICE
     
     
    FROM  part_supply_supplier
    group by 1,2,3,4,5,6,7,8,9
    order by  11  desc;

    select  partkey , part_comment, count(part_comment)  from part_supply_supplier group by partkey,part_comment  order by 1 desc;


    

    



    SELECT * FROM PART


    DROP TABLE PART_COMMENT


    select count(*) from orders;    

       select shipdate from line_item_supply WHERE shipdate REGEXP '../../....'
       select shipdate from line_item_supply WHERE shipdate REGEXP '....-..-..'


       
       select commitdate from line_item_supply WHERE commitdate REGEXP '../../....'
       select RECEIPTDATE
 from line_item_supply WHERE RECEIPTDATE
 REGEXP '../../....' 

      
      UPDATE line_item_supply SET  shipdate = TO_DATE(shipdate, 'DD/MM/YYYY') WHERE shipdate  REGEXP '../../....' ;

      UPDATE 







    select distinct partkey from part 




select distinct orderpriority from orders 


select orderkey, orderpriority from orders where orderpriority  in  ('1-URGENT','2-HIGH','3-MEDIUM','4-NOT SPECIFIED','5-LOW');









select distinct partkey from part
minus
select distinct partkey from lineitem;





select  partkey from lineitem
minus
select  partkey from part 





select distinct suppkey from  supplier 
minus
select distinct suppkey from lineitem



select count(*) from lineitem where discount>=100 and discount<0;



select * from order_summary where cust_acctbal<0;















-- Top 3 Customer every quarterly   Order + customer + nation + region    --------------------------























     ---- 4. Ship mode trends every year for last 5 years region wise

     EXPLAIN USING TEXT
     SELECT 
     DLI.SHIP_MODE , year(DLI.SHIP_DATE), DR.REGION_NAME , COUNT(*) AS CNT
     FROM 
     DIM_LINE_ITEM  DLI , 
     DIM_REGION DR,  
     FACT_PART_SUPPLIER FPS
     WHERE
     DLI.PART_ID=FPS.PART_ID AND DR.REGION_ID=FPS.REGION_ID
     GROUP BY DLI.SHIP_MODE , year(DLI.SHIP_DATE), DR.REGION_NAME
     ORDER BY DLI.SHIP_MODE , year(DLI.SHIP_DATE), DR.REGION_NAME ;



     






     
     




     


