#!/bin/bash

export HOST=$1
export SESSION=$2
export RUNS=$3
export MEASUREMENT="Baseline"

export PATH=/usr/sbin:$PATH

pg_post() {
  curl -d@- "$HOST/api/v2/session/$SESSION/$*"
}

echo Measurement|pg_post trigger
echo $MEASUREMENT|pg_post measurement

for i in $(seq $RUNS); do
  echo Run|pg_post trigger
  sleep 2
  echo StopRun|pg_post trigger
  sleep 0.2
done

echo StopMeasurement|pg_post trigger

