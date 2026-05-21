# AWS Snowflake Serverless Data Pipeline

## 📌 Overview

This project implements a serverless data pipeline using Amazon Web Services (AWS) and Snowflake. The pipeline ingests JSON data from an external API, processes it using AWS Lambda, and loads it into Snowflake using Snowpipe for further analysis.

---

## 🧱 Architecture

API → EventBridge → Lambda (Ingestion) → DynamoDB → Lambda (Processing) → S3 → Snowpipe → Snowflake

### Workflow:

1. Data is fetched from an external API using an API key.
2. Amazon EventBridge triggers the first AWS Lambda function every 5 minutes.
3. The first Lambda function ingests the data and stores it in DynamoDB.
4. A second Lambda function processes the data from DynamoDB.
5. The processed data is stored in an Amazon S3 bucket as JSON files.
6. Snowpipe continuously monitors the S3 bucket for new data.
7. Data is automatically loaded into Snowflake tables for analysis.

---

## ⚙️ Technologies Used

* Python
* AWS Lambda
* Amazon S3
* Snowflake
* boto3 (AWS SDK for Python)
* requests (HTTP library for API calls)

---

## 🚀 How It Works

1. AWS Lambda fetches JSON data from an external API using the requests library.
2. The data is uploaded to an S3 bucket.
3. S3 triggers an event that sends a message to SQS.
4. Snowpipe reads new data from the S3 stage.
5. Data is loaded into Snowflake tables for analysis.

---


## 🛠️ Setup Instructions

### Clone the repository

git clone https://github.com/Athul-Thekkepat/aws-snowflake-data-pipeline.git

cd aws-snowflake-data-pipeline
