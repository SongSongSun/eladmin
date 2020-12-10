#!/bin/bash

#运维中心上传umc-portal镜像文件时设置的版本
BUILD_VERSION=$1

if [ x"$1" = x ]; then
    echo "参数错误，请传入版本号!"
    exit 1
fi

#运维中心上传umc-portal镜像文件时设置的镜像名称
PROJECT_NAME=eladmin


##需要修改的变量----开始-----------
#镜像仓库地址
REGISTRY_REPOSITORY=47.108.49.133:8001
#管理服务在宿主机上的端口
UMC_PROTAL_PORT=9000


containerid=`sudo docker ps -a |grep $PROJECT_NAME | awk '{print $1}'`

if [ -z "$containerid" ]; then
  echo "${PROJECT_NAME} container is not running"
  #删除容器
  sudo docker rm $PROJECT_NAME
else
  #停掉运行的umc_web容器
  sudo docker stop $PROJECT_NAME
  #删除容器
  sudo docker rm $PROJECT_NAME
fi

#启动容器
sudo docker run -d \
--name $PROJECT_NAME \
-p ${UMC_PROTAL_PORT}:9000  \
-e DB_HOST=47.108.49.133 \
-e DB_PWD=Plant_2994 \
-e REDIS_HOST=47.108.49.133 \
-e REDIS_PORT=8002
-v /home/song/eladmin/data:/home/eladmin/ \
$PROJECT_NAME:${BUILD_VERSION}
