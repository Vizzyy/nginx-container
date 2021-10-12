FROM arm64v8/nginx:mainline
ENV TZ America/New_York
COPY nginx.conf /nginx.conf
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;" ]
