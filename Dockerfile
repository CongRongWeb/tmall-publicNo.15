FROM openjdk:8-jdk
LABEL maintainer=xtaylkss@163.com
ENV PARAMS="--server.port=8080 --spring.datasource.password=123456.h --spring.datasource.url=jdbc:mysql://mysql.infrastructure:3306/tmalldemodb?characterEncoding=utf-8&useSSL=false"
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
COPY target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["/bin/sh","-c","java -Xms512M -Xmx1024M -Dfile.encoding=utf8 -Djava.security.egd=file:/dev/./urandom -jar /app.jar ${PARAMS}"]
