CREATE OR REPLACE PIPE line_item_pipe
  AUTO_INGEST = TRUE
  AS copy into LINE_ITEM_SUPPLY from (
    SELECT   $1:ORDERKEY,
             $1:PARTKEY,
             $1:SUPPKEY,
             $1:LINENUMBER,
             $1:QUANTITY,
             $1:EXTENDEDPRICE,
             $1:DISCOUNT,
             $1:TAX,
             $1:RETURNFLAG,
             $1:LINESTATUS,
             $1:SHIPDATE,
             $1:COMMITDATE,
             $1:RECEIPTDATE,
             $1:SHIPINSTRUCT,
             $1:SHIPMODE,
             $1:LINE_ITEM_COMMENT
             
from @MOCK_S3_EXTERNAL_STAGE/processed_data/line_item/
    ) 
    FILE_FORMAT = PARQUET_FORMAT
    ON_ERROR = 'CONTINUE'
    PATTERN = '.*.parquet';

    show pipes;