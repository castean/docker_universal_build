FROM node:22.13.1
WORKDIR /app
COPY init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]