#!/bin/sh
PROJECT_ID="vsmart-iiot-223813"
BUCKET_ID="ml_assets"
JOB_NAME='keras_job'
JOB_DIR='gs://$BUCKET_ID/keras-job-dir'
REGION="us-central1"
gcloud config set project $PROJECT_ID
gcloud ai-platform jobs submit training $JOB_NAME \
  --package-path trainer/ \
  --module-name trainer.task \
  --region $REGION \
  --python-version 3.5 \
  --runtime-version 1.13 \
  --job-dir $JOB_DIR \
  --stream-logs
