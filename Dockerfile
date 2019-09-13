FROM openresty/openresty:1.15.8.2-1-alpine-fat
LABEL maintainer="Tayyab Talha <mtayyabtalha@gmail.com>"

ENV DEFAULT_UPSTREAM="" \
   REDIS_HOST="127.0.0.1" \
   REDIS_PORT="6379" \
   RESOLVER="8.8.8.8" \
   DEBUG="0" 
RUN mkdir -p /var/log/nginx/ && \
    touch /var/log/nginx/error.log && \
    touch /var/log/nginx/access.log && \
    mkdir /nginx 

COPY nginx.conf /nginx
EXPOSE 80
CMD ["nginx", "-p", "/nginx/", "-c", "nginx.conf"]


