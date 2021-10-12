FROM arm64v8/nginx:mainline

RUN apt update && apt install -y software-properties-common apt-transport-https wget gnupg \
    && wget -q http://www.webmin.com/jcameron-key.asc -O- | apt-key add - \
    && add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
RUN apt install -y nginx-plus-module-geoip2
RUN apt update \
    && apt -y install webmin
RUN nginx -V

ENV TZ America/New_York
COPY nginx.conf /nginx.conf
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;" ]
