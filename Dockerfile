FROM arm64v8/nginx:mainline
ENV TZ America/New_York

#COPY static-html-directory /usr/share/nginx/html
#COPY nginx.conf /etc/nginx/nginx.conf
COPY pki /etc/nginx

CMD [ "nginx", "-g", "daemon off;" ]
