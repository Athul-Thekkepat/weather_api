CREATE OR REPLACE DATABASE WEATHERR_DB;
USE DATABASE WEATHERR_DB;

CREATE TABLE WEATHER_DATA(
    data variant
);

Create or replace stage my_s3_stage
URL = 's3://weather-data-bucket-athul/'
Credentials = (
    AWS_KEY_ID = os.getenv('AWS_KEY_ID')
    AWS_SECRET_KEY = os.getenv('AWS_SECRET_KEY')
);

LIST @my_s3_stage;

COPY INTO WEATHER_DATA
FROM @my_s3_stage
FILE_FORMAT = (TYPE = 'JSON');

SELECT * FROM WEATHER_DATA;

SELECT 
    data:city::String as city,
    data:temperature::FLOAT as temp,
    data:description::String as description,
    data:time::TIMESTAMP AS report_time
FROM WEATHER_DATA;
SELECT * FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(
    TABLE_NAME=>'WEATHER_DATA',
    START_TIME=>DATEADD(HOURS,-1,CURRENT_TIMESTAMP())
));

create or replace pipe my_pipe
AUTO_INGEST = False
as
copy into weather_data
from @my_s3_stage
file_format = (TYPE='JSON');

ALTER PIPE my_pipe REFRESH;

LIST @my_s3_stage;

SELECT DATA FROM WEATHER_DATA LIMIT 2;