FROM arm64v8/nginx:mainline

RUN apt update && apt install software-properties-common apt-transport-https wget \
    && wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add - \
    && sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib" \
    && apt install webmin geoip-database libgeoip1

ENV TZ America/New_York
COPY nginx.conf /nginx.conf
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "nginx", "-g", "daemon off;" ]
