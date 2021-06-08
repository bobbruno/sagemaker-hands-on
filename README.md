# Hands on With SageMaker (including EMR Connectivity)

This repository contains a number of examples of using SageMaker Studio, including connecting to an EMR cluster for 
data processing with PySpark.

## Setup

The template and required EMR setup scripts are in the `env-setup` folder. Notice that the template expects the scripts
to be previously copied to an S3 bucket, defined under `Mappings|Studio|s3params|S3Bucket`. Please adjust this
mapping and copy the .sh scripts to the path specified under `Mappings|Studio|s3params|S3Key` in the bucket before
deploying the template. 

## Notebooks

The following examples are available in the notebooks folder:
- Batch Transform: collection of examples related to SageMaker Batch Transform, taken from
  [Amazon SageMaker Examples](https://github.com/aws/amazon-sagemaker-examples)
- Hyperparameter Tuning: collection of examples related to Hyperparameter Tuning, taken from
  [Amazon SageMaker Examples](https://github.com/aws/amazon-sagemaker-examples)
- Spark EMR-MLeap: connect to EMR using the pyspark magic, do data exploration, train a model using Spark ML and 
  deploy to SageMaker;
- Spark EMR-SageMaker: similar to the above, but EMR is used only for data preparation, all training and deployment is
implemented in SageMaker.