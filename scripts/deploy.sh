#!/bin/bash
# Despliegue manual a Cloud Run desde el código fuente local.
set -euo pipefail

PROJECT_ID="${PROJECT_ID:-lonegeekranger}"
REGION="${REGION:-southamerica-west1}"
SERVICE="${SERVICE:-chartico}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$(cd "$SCRIPT_DIR/.." && pwd)"

gcloud run deploy "$SERVICE" \
  --project "$PROJECT_ID" \
  --region "$REGION" \
  --source . \
  --allow-unauthenticated \
  --port 8080 \
  --cpu 1 \
  --memory 512Mi \
  --min-instances 0 \
  --max-instances 3

gcloud run services describe "$SERVICE" \
  --project "$PROJECT_ID" --region "$REGION" \
  --format 'value(status.url)'
