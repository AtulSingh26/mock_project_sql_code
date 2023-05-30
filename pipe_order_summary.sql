
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER


  

CREATE OR REPLACE PIPE order_summary_pipe
  AUTO_INGEST = TRUE
  AS COPY INTO ORDER_SUMMARY FROM (
  SELECT    
            $1:CUSTKEY,
            $1:CUSTOMER,
            $1:CUST_ADDRESS,
            $1:PHONE,
            $1:CUST_ACCTBAL,
            $1:CUST_MKTSEGMENT,
            $1:ORDERKEY,
            $1:ORDERSTATUS,
            $1:TOTALPRICE,
            $1:ORDERDATE,
            $1:ORDERPRIORITY,
            $1:CLERK,
            $1:SHIPPRIORITY,
            $1:ORDER_COMMENT, 
            $1:NATIONKEY,
            $1:NATION,
            $1:REGIONKEY,
            $1:REGION
  FROM @MOCK_S3_EXTERNAL_STAGE/processed_data/order_summary )
  FILE_FORMAT = PARQUET_FORMAT
  ON_ERROR = 'CONTINUE'
  PATTERN = '.*.parquet';


  WITH CUSTOMER AS (
  SELECT  CUSTKEY,
          CUSTOMER,
          CUST_ADDRESS ,
          NATIONKEY,
          PHONE,
         CUST_ACCTBAL,
        CUST_MKTSEGMENT,
        ORDER_COMMENT AS CUST_COMMENT 
    FROM MOCK_PROJECT_DB.RAW.ORDER_SUMMARY
)

SELECT *  FROM CUSTOMER