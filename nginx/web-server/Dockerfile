# NGINX의 최신 이미지를 사용
FROM nginx:latest

# 로컬의 nginx.conf 파일을 컨테이너의 NGINX 설정 파일로 복사
COPY ./nginx.conf /etc/nginx/nginx.conf

# 로컬의 html 폴더를 컨테이너 내의 NGINX 웹 루트로 복사
COPY ./html /usr/share/nginx/html