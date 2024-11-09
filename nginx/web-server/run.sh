#!/bin/bash

# Docker 이미지 빌드
docker build -t nginx-web-server .

# 기존 컨테이너가 있으면 삭제 (존재하지 않으면 에러 무시)
docker rm -f nginx-web-server 2>/dev/null || true

# Docker 컨테이너 실행
docker run --name nginx-web-server -d -p 8080:80 nginx-web-server

echo "Web server is running at http://localhost:8080"