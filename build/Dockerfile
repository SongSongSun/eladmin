#FROM 47.108.49.133:8001/library/jdk:8
FROM 47.108.49.133:8001/common/jdk:alpine8
WORKDIR /home/eladmin

#解决中文乱码问题
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ADD config .
ADD eladmin-system-2.6.jar eladmin-system-2.6.jar

EXPOSE 9000
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENTRYPOINT ["java","-jar","eladmin-system-2.6.jar"]