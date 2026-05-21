# AWS Snowflake Serverless Data Pipeline

## 📌 Overview

This project implements a serverless data pipeline using Amazon Web Services (AWS) and Snowflake. The pipeline ingests JSON data from an external API, processes it using AWS Lambda, and loads it into Snowflake using Snowpipe for further analysis.

---

## 🧱 Architecture

API → EventBridge → Lambda (Ingestion) → DynamoDB → Lambda (Processing) → S3 → Snowpipe → Snowflake
