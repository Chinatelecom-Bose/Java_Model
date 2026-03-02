# 1. 确保在项目根目录下
$PROJECT_ROOT = Get-Location
Write-Host "Current working directory: $PROJECT_ROOT"
Write-Host "Using production environment configuration (./docker-compose.yml)"

# 2. 清理旧的构建（可选）
docker-compose down

# 3. 重新构建镜像（使用 Dockerfile 中的构建步骤，跳过本地前端构建）
Write-Host "Building images with docker-compose..."
docker-compose build

# 4. 创建一个输出目录
New-Item -ItemType Directory -Path dist-docker -Force

# 5. 导出镜像文件
Write-Host "Exporting images..."
docker save -o dist-docker/ctbc-admin.tar ctbc-admin:latest
docker save -o dist-docker/ctbc-ui.tar ctbc-ui:latest

# 6. 复制 docker-compose.yml 到输出目录
Copy-Item docker-compose.yml dist-docker/

Write-Host ""
Write-Host "All files are ready in 'dist-docker' directory."
Write-Host "Please upload the entire 'dist-docker' folder to your server."
Write-Host "IMPORTANT: Please modify docker-compose.yml in 'dist-docker' folder to configure your DB and Redis connection info before starting."
