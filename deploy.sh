#!/bin/bash

# format to use:
# ./deploy.sh <cloud run name> <database name> <memory> <gcloud project>

export ENV_VARS=$(paste -sd, .env)
gcloud run deploy $1 \
            --quiet \
            --image "eu.gcr.io/$4/vendure:latest" \
            --region "northamerica-northeast2-c" \
            --platform "managed" \
            --allow-unauthenticated \
            --project=$4 \
            --set-env-vars=$ENV_VARS \
            --add-cloudsql-instances="$4:northamerica-northeast2-c:$2" \
            --memory=$3
