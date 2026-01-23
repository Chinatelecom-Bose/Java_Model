# 使用官方的OpenJDK 21镜像作为基础镜像
FROM eclipse-temurin:21-jre-alpine

# 维护者信息
LABEL maintainer="CTBC Team <ctbc@example.com>"

# 设置工作目录
WORKDIR /app

# 复制后端构建产物
COPY ctbc-admin/target/ctbc-admin.jar app.jar

# 复制配置文件
# COPY ctbc-admin/src/main/resources/application.yml /app/config/application.yml
# COPY ctbc-admin/src/main/resources/application-druid.yml /app/config/application-druid.yml

# 暴露端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=/app/config/"]