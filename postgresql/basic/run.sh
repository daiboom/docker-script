#!/bin/bash

# 1. 이미지 이름과 컨테이너 이름 설정
IMAGE_NAME="postgres-image"
CONTAINER_NAME="postgres-container"

# 2. Dockerfile을 사용하여 이미지를 빌드
echo "PostgreSQL 도커 이미지 빌드합니다..."
echo "--------------------------------------"
docker build -t $IMAGE_NAME .

# 3. 기존에 실행 중인 동일 이름의 컨테이너가 있으면 중지 및 삭제
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo ""
    echo "기존 PostgreSQL 컨테이너가 발견되었습니다..."
    echo "기존 PostgreSQL 컨테이너를 중지합니다..."
    docker stop $CONTAINER_NAME
    echo "--------------------------------------"
    echo "기존 PostgreSQL 컨테이너를 삭제합니다..."
    docker rm $CONTAINER_NAME
    echo "--------------------------------------"
fi

# 4. 새로운 PostgreSQL 컨테이너 실행
echo "새로운 PostgreSQL 컨테이너를 시작중..."
docker run -d \
  --name $CONTAINER_NAME \
  -e POSTGRES_USER=postgres_user \
  -e POSTGRES_PASSWORD=postgres_user_password \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -v ~/pgdata:/var/lib/postgresql/data \
  $IMAGE_NAME

# 5. 실행된 컨테이너 상태 확인
echo "--------------------------------------"
echo "PostgreSQL 컨테이너를 시작합니다."
echo $CONTAINER_NAME

docker ps -f name=$CONTAINER_NAME