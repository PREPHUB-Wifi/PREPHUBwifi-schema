#!/usr/bin/env bash
export $(cat .env | xargs)
PROJECT_NAME=${PROJECT_NAME:-'prephubwifi'}
IMAGE_NAME=${IMAGE_NAME:-'db'}
EX_PORT=${EX_PORT:-'25432'}
sudo docker build --build-arg EX_PORT=$EX_PORT -t $PROJECT_NAME"/"$IMAGE_NAME .
