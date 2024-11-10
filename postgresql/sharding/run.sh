# 첫 번째 샤드 실행
docker run --name shard1 -e POSTGRES_USER=postgres_user -e POSTGRES_PASSWORD=postgres_password -e POSTGRES_DB=postgres_db -p 5432:5432 -d pgshard

# 두 번째 샤드 실행
docker run --name shard2 -e POSTGRES_USER=postgres_user -e POSTGRES_PASSWORD=postgres_password -e POSTGRES_DB=postgres_db -p 5433:5432 -d pgshard

# 세 번째 샤드 실행
docker run --name shard3 -e POSTGRES_USER=postgres_user -e POSTGRES_PASSWORD=postgres_password -e POSTGRES_DB=postgres_db -p 5434:5432 -d pgshard


docker run -d -p 5432:5432 --name citus_master citusdata/citus
docker run -d -p 5433:5432 --name citus_worker1 citusdata/citus
docker run -d -p 5434:5432 --name citus_worker2 citusdata/citus

docker exec -it citus_master psql -U postgres -c "SELECT master_add_node('worker1', 5432);"
docker exec -it citus_master psql -U postgres -c "SELECT master_add_node('worker2', 5432);"

-- 마스터 노드에 접속 후 테이블 생성 및 분할 키 설정
CREATE TABLE users (id BIGINT, name TEXT);
SELECT create_distributed_table('users', 'id');

-- 데이터 삽입 시 자동으로 워커 노드에 분산 저장됨
INSERT INTO users VALUES (1, 'Alice'), (2, 'Bob');