package com.ctbc.system.service.impl;

import com.ctbc.common.config.ProjectConfig;
import com.ctbc.common.constant.Constants;
import com.ctbc.common.exception.ServiceException;
import com.ctbc.common.utils.DateUtils;
import com.ctbc.common.utils.SecurityUtils;
import com.ctbc.common.utils.StringUtils;
import com.ctbc.common.utils.file.FileUploadUtils;
import com.ctbc.system.mapper.SysFileMapper;
import com.ctbc.system.service.ISysFileService;
import com.ctbc.system.domain.SysFile;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 通用文件管理Service业务层处理
 * 
 * @author javaxiaobear
 */
@Service
public class SysFileServiceImpl implements ISysFileService {
    
    private static final Logger log = LoggerFactory.getLogger(SysFileServiceImpl.class);
    private static final String SYSTEM_FILE_ROOT = "system_file";

    @Autowired
    private SysFileMapper sysFileMapper;

    /**
     * 查询文件
     *
     * @param id 文件主键
     * @return 文件
     */
    @Override
    public SysFile selectSysFileById(Long id) {
        return sysFileMapper.selectSysFileById(id);
    }

    /**
     * 查询文件列表
     *
     * @param sysFile 文件
     * @return 文件
     */
    @Override
    public List<SysFile> selectSysFileList(SysFile sysFile) {
        return sysFileMapper.selectSysFileList(sysFile);
    }

    /**
     * 根据业务类型和业务ID查询文件列表
     */
    @Override
    public List<SysFile> selectFilesByBusiness(String businessType, Long businessId) {
        return sysFileMapper.selectFilesByBusiness(businessType, businessId);
    }

    /**
     * 查询RAG文档列表
     */
    @Override
    public List<SysFile> selectRagDocuments(Long knowledgeBaseId) {
        return sysFileMapper.selectRagDocuments(knowledgeBaseId);
    }

    /**
     * 查询用户头像
     */
    @Override
    public SysFile selectUserAvatar(Long userId) {
        return sysFileMapper.selectUserAvatar(userId);
    }

    /**
     * 根据内容哈希查询文件
     */
    @Override
    public SysFile selectFileByContentHash(String contentHash) {
        return sysFileMapper.selectFileByContentHash(contentHash);
    }

    /**
     * 统计文件数量
     */
    @Override
    public int countSysFiles(SysFile sysFile) {
        return sysFileMapper.countSysFiles(sysFile);
    }

    /**
     * 统计业务类型文件数量
     */
    @Override
    public int countFilesByBusinessType(String businessType) {
        return sysFileMapper.countFilesByBusinessType(businessType);
    }

    /**
     * 统计文件总大小
     */
    @Override
    public Long sumFileSizeByBusinessType(String businessType) {
        return sysFileMapper.sumFileSizeByBusinessType(businessType);
    }

    /**
     * 新增文件
     *
     * @param sysFile 文件
     * @return 结果
     */
    @Override
    public int insertSysFile(SysFile sysFile) {
        sysFile.setCreateTime(DateUtils.getNowDate());
        sysFile.setCreateBy(SecurityUtils.getUsername());
        return sysFileMapper.insertSysFile(sysFile);
    }

    /**
     * 修改文件
     *
     * @param sysFile 文件
     * @return 结果
     */
    @Override
    public int updateSysFile(SysFile sysFile) {
        sysFile.setUpdateTime(DateUtils.getNowDate());
        sysFile.setUpdateBy(SecurityUtils.getUsername());
        return sysFileMapper.updateSysFile(sysFile);
    }

    /**
     * 更新文件状态
     */
    @Override
    public int updateFileStatus(Long id, Integer status) {
        return sysFileMapper.updateFileStatus(id, status);
    }

    /**
     * 更新处理进度
     */
    @Override
    public int updateProcessProgress(Long id, Integer progress, String errorMessage) {
        return sysFileMapper.updateProcessProgress(id, progress, errorMessage);
    }

    /**
     * 增加下载次数
     */
    @Override
    public int incrementDownloadCount(Long id) {
        return sysFileMapper.incrementDownloadCount(id);
    }

    /**
     * 批量删除文件
     *
     * @param ids 需要删除的文件主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysFileByIds(Long[] ids) {
        if (ids == null || ids.length == 0) {
            return 0;
        }

        Set<Long> allIds = new HashSet<>();
        List<SysFile> allFiles = new ArrayList<>();
        Deque<Long> queue = new ArrayDeque<>();

        for (Long id : ids) {
            if (id != null) {
                queue.addLast(id);
            }
        }

        while (!queue.isEmpty()) {
            Long id = queue.removeFirst();
            if (id == null || !allIds.add(id)) {
                continue;
            }

            SysFile current = selectSysFileById(id);
            if (current == null) {
                continue;
            }
            allFiles.add(current);

            if (Integer.valueOf(1).equals(current.getIsFolder())) {
                List<SysFile> children = sysFileMapper.selectFilesByParentId(id, null);
                if (children != null) {
                    for (SysFile child : children) {
                        if (child != null && child.getId() != null) {
                            queue.addLast(child.getId());
                        }
                    }
                }
            }
        }

        for (SysFile sysFile : allFiles) {
            if (sysFile == null || Integer.valueOf(1).equals(sysFile.getIsFolder())) {
                continue;
            }
            deletePhysicalIfExists(sysFile);
        }

        List<SysFile> folders = new ArrayList<>();
        for (SysFile sysFile : allFiles) {
            if (sysFile != null && Integer.valueOf(1).equals(sysFile.getIsFolder())) {
                folders.add(sysFile);
            }
        }
        folders.sort((a, b) -> {
            String aUrl = normalizeUrl(a.getFileUrl());
            String bUrl = normalizeUrl(b.getFileUrl());
            return Integer.compare(bUrl.length(), aUrl.length());
        });

        for (SysFile folder : folders) {
            deletePhysicalIfExists(folder);
        }

        return sysFileMapper.deleteSysFileByIds(allIds.toArray(new Long[0]));
    }

    /**
     * 删除文件信息
     *
     * @param id 文件主键
     * @return 结果
     */
    @Override
    public int deleteSysFileById(Long id) {
        return deleteSysFileByIds(new Long[] { id });
    }

    /**
     * 物理删除文件
     */
    @Override
    public int deleteSysFilePhysically(Long id) {
        return sysFileMapper.deleteSysFilePhysically(id);
    }

    /**
     * 批量物理删除文件
     */
    @Override
    public int deleteSysFilePhysicallyByIds(Long[] ids) {
        return sysFileMapper.deleteSysFilePhysicallyByIds(ids);
    }

    /**
     * 清理已删除的文件记录
     */
    @Override
    public int cleanDeletedFiles(Integer days) {
        return sysFileMapper.cleanDeletedFiles(days);
    }

    /**
     * 查询重复文件
     */
    @Override
    public List<SysFile> selectDuplicateFiles() {
        return sysFileMapper.selectDuplicateFiles();
    }

    /**
     * 查询孤立文件
     */
    @Override
    public List<SysFile> selectOrphanFiles() {
        return sysFileMapper.selectOrphanFiles();
    }

    /**
     * 上传文件
     */
    @Override
    public SysFile uploadFile(MultipartFile file, String businessType, Long businessId, Long parentId) {
        try {
            // 计算文件哈希值
            String contentHash = calculateFileHash(file);
            
            // 检查文件是否已存在
            SysFile existingFile = selectFileByContentHash(contentHash);
            if (existingFile != null) {
                log.info("文件已存在，返回现有文件信息: {}", existingFile.getFileName());
                return existingFile;
            }

            Long normalizedParentId = parentId != null ? parentId : 0L;
            String baseDir = ProjectConfig.getProfile();
            if (normalizedParentId > 0) {
                String folderRel = resolveFolderRelativeDir(normalizedParentId);
                Path folderPath = Paths.get(ProjectConfig.getProfile(), folderRel.split("/"));
                Files.createDirectories(folderPath);
                baseDir = folderPath.toString();
            }

            String fileName = normalizeUrl(FileUploadUtils.upload(baseDir, file));
            String fileUrl = fileName;

            // 创建文件记录
            SysFile sysFile = new SysFile();
            sysFile.setParentId(normalizedParentId);
            sysFile.setFileName(file.getOriginalFilename());
            sysFile.setOriginalName(file.getOriginalFilename());
            sysFile.setFileType(getFileExtension(file.getOriginalFilename()));
            sysFile.setFileSize(file.getSize());

            // 构建实际文件路径（用于文件系统访问）
            // fileName格式：/profile/2025/09/28/xxx.docx
            // 需要转换为：../upload/2025/09/28/xxx.docx（相对于bearjia-admin目录）
            String actualFileName = fileName.substring(Constants.RESOURCE_PREFIX.length());
            String filePath = "../upload" + actualFileName; // 使用相对于bearjia-admin的路径
            sysFile.setFilePath(filePath);
            sysFile.setFileUrl(fileUrl);
            sysFile.setContentHash(contentHash);
            sysFile.setMimeType(file.getContentType());
            sysFile.setBusinessType(businessType != null ? businessType : "common");
            sysFile.setBusinessId(businessId);
            sysFile.setStatus("1");
            sysFile.setProcessProgress(100);
            sysFile.setDownloadCount(0);

            insertSysFile(sysFile);
            return sysFile;

        } catch (Exception e) {
            log.error("文件上传失败", e);
            throw new ServiceException("文件上传失败: " + e.getMessage());
        }
    }

    /**
     * 上传RAG文档
     */
    @Override
    public SysFile uploadRagDocument(MultipartFile file, Long knowledgeBaseId) {
        return uploadFile(file, "rag", knowledgeBaseId, 0L);
    }

    /**
     * 上传用户头像
     */
    @Override
    public SysFile uploadUserAvatar(MultipartFile file, Long userId) {
        return uploadFile(file, "avatar", userId, 0L);
    }

    /**
     * 上传系统附件
     */
    @Override
    public SysFile uploadSystemAttachment(MultipartFile file, Long relatedId) {
        return uploadFile(file, "attachment", relatedId, 0L);
    }

    /**
     * 检查文件是否存在
     */
    @Override
    public boolean isFileExists(String contentHash) {
        return selectFileByContentHash(contentHash) != null;
    }

    /**
     * 获取文件下载URL
     */
    @Override
    public String getDownloadUrl(Long id) {
        SysFile file = selectSysFileById(id);
        if (file != null) {
            return file.getFileUrl();
        }
        return null;
    }

    /**
     * 获取文件预览URL
     */
    @Override
    public String getPreviewUrl(Long id) {
        SysFile file = selectSysFileById(id);
        if (file != null) {
            return file.getFileUrl();
        }
        return null;
    }

    /**
     * 计算文件内容哈希值
     */
    @Override
    public String calculateFileHash(MultipartFile file) {
        try {
            return DigestUtils.md5Hex(file.getInputStream());
        } catch (IOException e) {
            log.error("计算文件哈希值失败", e);
            throw new ServiceException("计算文件哈希值失败");
        }
    }

    /**
     * 获取文件扩展名
     */
    private String getFileExtension(String fileName) {
        if (StringUtils.isEmpty(fileName)) {
            return "";
        }
        int lastDotIndex = fileName.lastIndexOf('.');
        if (lastDotIndex > 0 && lastDotIndex < fileName.length() - 1) {
            return fileName.substring(lastDotIndex + 1).toLowerCase();
        }
        return "";
    }

    /**
     * 查询文件夹树结构
     */
    @Override
    public List<SysFile> selectFolderTree(Long parentId, String businessType) {
        return sysFileMapper.selectFolderTree(parentId, businessType);
    }

    /**
     * 查询指定文件夹下的内容
     */
    @Override
    public List<SysFile> selectFilesByParentId(Long parentId, String businessType) {
        return sysFileMapper.selectFilesByParentId(parentId, businessType);
    }

    /**
     * 创建文件夹
     */
    @Override
    public SysFile createFolder(String folderName, Long parentId, String businessType, Long businessId) {
        String normalizedFolderName = normalizeFolderName(folderName);
        Long normalizedParentId = parentId != null ? parentId : 0L;
        if (checkFolderNameExists(normalizedParentId, normalizedFolderName, businessType, null)) {
            throw new ServiceException("文件夹名称已存在");
        }

        String parentRel = resolveFolderRelativeDir(normalizedParentId);
        String folderRel = parentRel + "/" + normalizedFolderName;
        Path folderPath = Paths.get(ProjectConfig.getProfile(), folderRel.split("/"));
        try {
            Files.createDirectories(folderPath);
        } catch (IOException e) {
            throw new ServiceException("创建文件夹失败: " + e.getMessage());
        }

        SysFile folder = new SysFile();
        folder.setParentId(normalizedParentId);
        folder.setIsFolder(1);
        folder.setFileName(normalizedFolderName);
        folder.setOriginalName(normalizedFolderName);
        folder.setBusinessType(businessType);
        folder.setBusinessId(businessId);
        folder.setFilePath(folderRel);
        folder.setFileUrl(Constants.RESOURCE_PREFIX + "/" + folderRel);
        folder.setStatus("1");
        folder.setCreateTime(DateUtils.getNowDate());

        try {
            folder.setCreateBy(SecurityUtils.getUsername());
        } catch (Exception e) {
            // 忽略获取用户信息失败的情况
        }

        sysFileMapper.createFolder(folder);
        return folder;
    }

    private void deletePhysicalIfExists(SysFile sysFile) {
        Path physicalPath = resolvePhysicalPath(sysFile);
        if (physicalPath == null) {
            return;
        }
        try {
            if (Integer.valueOf(1).equals(sysFile.getIsFolder())) {
                deleteRecursively(physicalPath);
            } else {
                Files.deleteIfExists(physicalPath);
            }
        } catch (IOException e) {
            throw new ServiceException("删除文件失败: " + e.getMessage());
        }
    }

    private Path resolvePhysicalPath(SysFile sysFile) {
        if (sysFile == null) {
            return null;
        }
        String url = normalizeUrl(sysFile.getFileUrl());
        if (StringUtils.isEmpty(url)) {
            return null;
        }
        String prefix = Constants.RESOURCE_PREFIX;
        if (!url.startsWith(prefix)) {
            return null;
        }
        String rel = url.substring(prefix.length());
        rel = normalizeUrl(rel);
        while (rel.startsWith("/")) {
            rel = rel.substring(1);
        }
        if (StringUtils.isEmpty(rel)) {
            return null;
        }
        return Paths.get(ProjectConfig.getProfile(), rel.split("/"));
    }

    private void deleteRecursively(Path root) throws IOException {
        if (root == null || !Files.exists(root)) {
            return;
        }
        Files.walkFileTree(root, new SimpleFileVisitor<>() {
            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                Files.deleteIfExists(file);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                Files.deleteIfExists(dir);
                return FileVisitResult.CONTINUE;
            }
        });
    }

    private String resolveFolderRelativeDir(Long folderId) {
        if (folderId == null || folderId <= 0) {
            return SYSTEM_FILE_ROOT;
        }
        SysFile folder = selectSysFileById(folderId);
        if (folder != null) {
            String url = normalizeUrl(folder.getFileUrl());
            if (StringUtils.isNotEmpty(url) && url.startsWith(Constants.RESOURCE_PREFIX + "/")) {
                String rel = normalizeUrl(url.substring((Constants.RESOURCE_PREFIX + "/").length()));
                if (StringUtils.isNotEmpty(rel)) {
                    return rel;
                }
            }
            if (StringUtils.isNotEmpty(folder.getFilePath())) {
                String rel = normalizeUrl(folder.getFilePath());
                while (rel.startsWith("/")) {
                    rel = rel.substring(1);
                }
                if (StringUtils.isNotEmpty(rel)) {
                    return rel;
                }
            }
        }
        List<SysFile> path = getFolderPath(folderId);
        if (path == null || path.isEmpty()) {
            return SYSTEM_FILE_ROOT;
        }
        StringBuilder sb = new StringBuilder(SYSTEM_FILE_ROOT);
        for (SysFile node : path) {
            if (node != null && StringUtils.isNotEmpty(node.getFileName())) {
                sb.append("/").append(node.getFileName());
            }
        }
        return normalizeUrl(sb.toString());
    }

    private String normalizeFolderName(String folderName) {
        if (StringUtils.isEmpty(folderName)) {
            throw new ServiceException("文件夹名称不能为空");
        }
        String name = folderName.trim();
        if (name.isEmpty()) {
            throw new ServiceException("文件夹名称不能为空");
        }
        if (name.contains("/") || name.contains("\\") || name.contains("..")) {
            throw new ServiceException("文件夹名称不合法");
        }
        String illegalChars = ":*?\"<>|";
        for (int i = 0; i < illegalChars.length(); i++) {
            if (name.indexOf(illegalChars.charAt(i)) >= 0) {
                throw new ServiceException("文件夹名称不合法");
            }
        }
        return name;
    }

    private String normalizeUrl(String input) {
        if (input == null) {
            return "";
        }
        return input.replace("\\", "/").replaceAll("/+", "/");
    }

    /**
     * 移动文件到指定文件夹
     */
    @Override
    public int moveFileToFolder(Long fileId, Long targetParentId) {
        return sysFileMapper.moveFileToFolder(fileId, targetParentId);
    }

    /**
     * 批量移动文件
     */
    @Override
    public int batchMoveFiles(List<Long> fileIds, Long targetParentId) {
        return sysFileMapper.batchMoveFiles(fileIds, targetParentId);
    }

    /**
     * 检查文件夹名称是否存在
     */
    @Override
    public boolean checkFolderNameExists(Long parentId, String folderName, String businessType, Long excludeId) {
        return sysFileMapper.checkFolderNameExists(parentId, folderName, businessType, excludeId);
    }

    /**
     * 获取文件夹路径
     */
    @Override
    public List<SysFile> getFolderPath(Long folderId) {
        return sysFileMapper.getFolderPath(folderId);
    }

    /**
     * 重命名文件或文件夹
     */
    @Override
    public int renameFile(Long fileId, String newName) {
        SysFile file = new SysFile();
        file.setId(fileId);
        file.setFileName(newName);
        file.setOriginalName(newName);
        file.setUpdateTime(DateUtils.getNowDate());

        try {
            file.setUpdateBy(SecurityUtils.getUsername());
        } catch (Exception e) {
            // 忽略获取用户信息失败的情况
        }

        return sysFileMapper.updateSysFile(file);
    }
}
