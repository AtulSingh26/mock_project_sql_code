CREATE OR REPLACE PIPE part_supply_pipe
  AUTO_INGEST = TRUE
  AS COPY INTO PART_SUPPLY_SUPPLIER FROM (
  SELECT    $1:PARTKEY,
            $1:PART_NAME,
            $1:MFGR,
            $1:BRAND,
            $1:TYPE,
            $1:SIZE,
            $1:CONTAINER,
            $1:RETAILPRICE,
            $1:PART_COMMENT,
            $1:SUPPKEY,
            $1:AVAILQTY,
            $1:SUPPLYCOST,
            $1:PART_SUPPLIER_COMMENT,
            $1:SUPPLIER_NAME,
            $1:ADDRESS,
            $1:SUPPLIER_NATION,
            $1:PHONE,
            $1:ACCTBAL,
            $1:SUPPLIER_COMMENT
  
  FROM @MOCK_S3_EXTERNAL_STAGE/processed_data/part_supply )
  FILE_FORMAT = PARQUET_FORMAT
  ON_ERROR = 'CONTINUE'
  PATTERN = '.*.parquet';

  show pipes;

  select current_timestamp;