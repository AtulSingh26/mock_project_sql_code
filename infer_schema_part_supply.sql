SELECT *
  FROM TABLE(
    INFER_SCHEMA(
      LOCATION=>'@MOCK_S3_EXTERNAL_STAGE/processed_data/part_supply/'
      , FILE_FORMAT=>'PARQUET_FORMAT'
      , IGNORE_CASE=>TRUE
      )
    );