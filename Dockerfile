FROM nginx:1.27-alpine

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY index.html /usr/share/nginx/html/index.html
COPY simple.html /usr/share/nginx/html/simple.html

ENV PORT=8080
ENV BACKEND_ORIGIN=http://localhost:8000
