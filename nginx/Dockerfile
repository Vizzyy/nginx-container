FROM arm64v8/nginx:mainline
ENV TZ America/New_York
#COPY static-html-directory /usr/share/nginx/html
COPY nginx.conf /nginx.conf
#COPY ../pki /etc/nginx
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;" ]
