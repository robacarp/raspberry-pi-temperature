#!/bin/bash

set -euo pipefail

hostname=`hostname`

cpu_temp=$(
  temp \
    | grep CPU \
    | awk -F "[' =]" '{print $3}'
)

gpu_temp=$(
  temp \
    | grep GPU \
    | awk -F "[' =]" '{print $3}'
)

aws --region=us-west-2 \
  cloudwatch put-metric-data \
    --namespace "$hostname" \
    --value "$cpu_temp" \
    --metric-name cpu-temperature

aws --region=us-west-2 \
  cloudwatch put-metric-data \
    --namespace "$hostname" \
    --value "$gpu_temp" \
    --metric-name cpu-temperature
