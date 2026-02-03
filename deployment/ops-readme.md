# 部署操作指南

本目录包含了部署系统所需的所有文件。

## 目录结构

- `images/`: 包含后端和前端的 Docker 镜像文件 (.tar)
- `docker-compose.yml`: 容器编排配置文件
- `startup.sh`: 一键启动脚本
- `shutdown.sh`: 一键停止脚本

## 部署步骤

### 1. 环境准备
确保服务器已安装：
- Docker (版本 20.10+)
- Docker Compose (版本 2.0+)

### 2. 配置修改
**重要**：在启动前，请务必检查并修改 `docker-compose.yml` 文件：

- **数据库连接**：
  - 修改 `DB_MASTER_URL` 中的 IP 地址、端口和数据库名。
  - 修改 `DB_MASTER_USERNAME` 和 `DB_MASTER_PASSWORD`。
  - 如果数据库部署在宿主机上，可以使用 `host.docker.internal` (已配置映射) 或直接使用宿主机 IP。

- **Redis 连接**：
  - 修改 `REDIS_HOST`、`REDIS_PORT` 和 `REDIS_PASSWORD`。

- **端口映射**：
  - 默认后端端口：48089
  - 默认前端端口：48088
  - 如需修改，请调整 `ports` 部分 (格式: `宿主机端口:容器端口`)。

### 3. 启动服务
在当前目录下运行启动脚本：

```bash
# 赋予执行权限 (仅第一次需要)
chmod +x startup.sh shutdown.sh

# 启动服务
./startup.sh
```

脚本会自动加载 `images/` 目录下的镜像，并启动容器。

### 4. 验证
访问前端页面：
http://<服务器IP>:48088

查看日志：
```bash
docker-compose logs -f
```

### 5. 停止服务
```bash
./shutdown.sh
```
