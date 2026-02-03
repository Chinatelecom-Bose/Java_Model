#!/bin/bash

# 1. 确保在项目根目录下
# 获取脚本所在目录的上一级目录
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT" || exit 1

echo "Current working directory: $(pwd)"
echo "Using production environment configuration (./docker-compose.yml)"

# 2. 清理旧的构建（可选）
docker-compose down

# 3. 前端打包
echo "Building frontend locally..."
cd ctbc-ui
pnpm install
pnpm run build:prod
cd ..

# 4. 重新构建镜像
echo "Building images with docker-compose..."
docker-compose build

# 5. 创建一个输出目录
mkdir -p dist-docker

# 6. 导出镜像文件
echo "Exporting images..."
docker save -o dist-docker/ctbc-admin.tar ctbc-admin:latest
docker save -o dist-docker/ctbc-ui.tar ctbc-ui:latest

# 7. 复制 docker-compose.yml 到输出目录
cp docker-compose.yml dist-docker/

echo ""
echo "All files are ready in 'dist-docker' directory."
echo "Please upload the entire 'dist-docker' folder to your server."
echo "IMPORTANT: Please modify docker-compose.yml in 'dist-docker' folder to configure your DB and Redis connection info before starting."
