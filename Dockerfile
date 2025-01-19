FROM hiromuhota/webspoon:latest
USER root
COPY pdi-ce-9.4.0.0-343.zip .
RUN unzip pdi-ce-9.4.0.0-343.zip -d . && rm pdi-ce-9.4.0.0-343.zip 
RUN cp -r ./data-integration/* /usr/local/tomcat/webapps/spoon/ && rm -rf ./data-integration
RUN apt update && apt install -y cron nano-tiny
