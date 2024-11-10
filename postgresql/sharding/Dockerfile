# 1. 베이스 이미지로 공식 PostgreSQL 이미지 사용
FROM postgres:15

# 2. 환경 변수 설정 (필요에 따라 사용자 정의 가능)
ENV POSTGRES_USER=postegres_user
ENV POSTGRES_PASSWORD=postegres_user_password
ENV POSTGRES_DB=postegres

# 3. 포트 개방 (PostgreSQL 기본 포트)
EXPOSE 5432

# 4. 초기화 스크립트나 SQL 파일을 복사할 수 있음 (선택 사항)
# COPY ./init.sql /docker-entrypoint-initdb.d/

# 5. 기본적으로 제공되는 entrypoint.sh를 사용하여 PostgreSQL 실행