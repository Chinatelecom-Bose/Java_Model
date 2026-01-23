<template>
  <div class="swagger-container">
    <iframe :src="swaggerUrl" frameborder="0" width="100%" height="100%"></iframe>
  </div>
</template>

<script setup>
// 后端Swagger UI地址
const swaggerUrl = 'http://localhost:8080/swagger-ui/index.html';
</script>

<style scoped>
.swagger-container {
  width: 100%;
  height: calc(100vh - 64px);
}
</style>
