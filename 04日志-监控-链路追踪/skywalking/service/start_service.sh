#!/bin/sh
source /code/bin/activate &&  python3 /code/service.py &
envoy -c /etc/service-envoy.yaml --service-cluster "service${SERVICE_NAME}"