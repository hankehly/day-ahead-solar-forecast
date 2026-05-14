#!/usr/bin/env bash
# Download NREL PVDAQ parquet data (~17 GB) from the OEDI public S3 bucket.
# Requires the AWS CLI: https://aws.amazon.com/cli/

set -euo pipefail

SRC="s3://oedi-data-lake/pvdaq/parquet/"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${REPO_ROOT}/data/oedi-data-lake/pvdaq/parquet"

mkdir -p "${DEST}"

echo "Syncing ${SRC} -> ${DEST}"
aws s3 sync "${SRC}" "${DEST}" --no-sign-request
