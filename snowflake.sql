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