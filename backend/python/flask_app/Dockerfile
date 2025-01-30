FROM python:3.12.1-slim
WORKDIR /app
COPY init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]