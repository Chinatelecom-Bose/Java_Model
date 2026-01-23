package com.ctbc.system.controller;

import com.ctbc.common.annotation.Log;
import com.ctbc.common.config.ProjectConfig;
import com.ctbc.common.core.controller.BaseController;
import com.ctbc.common.core.domain.AjaxResult;
import com.ctbc.common.core.page.TableDataInfo;
import com.ctbc.common.enums.BusinessType;
import com.ctbc.common.utils.StringUtils;
import com.ctbc.system.domain.SysFile;
import com.ctbc.system.service.ISysFileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用文件管理Controller
 * 
 * @author ctbc
 */
@RestController
@RequestMapping("/system/file")
public class SysFileController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(SysFileController.class);

    @Autowired
    private ISysFileService sysFileService;

    @Autowired
    private ProjectConfig projectConfig;

    /**
     * 查询文件夹树结构
     */
    @GetMapping("/folderTree")
    public AjaxResult folderTree(@RequestParam(value = "parentId", defaultValue = "0") Long parentId,
                                  @RequestParam(value = "businessType", required = false) String businessType)
    {
        List<SysFile> folders = sysFileService.selectFolderTree(parentId, businessType);
        return AjaxResult.success(folders);
    }

    /**
     * 查询指定文件夹下的内容
     */
    @GetMapping("/list")
    public TableDataInfo list(SysFile sysFile)
    {
        startPage();
        List<SysFile> list = sysFileService.selectFilesByParentId(sysFile.getParentId(), sysFile.getBusinessType());
        return getDataTable(list);
    }

    /**
     * 创建文件夹
     */
    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/createFolder")
    public AjaxResult createFolder(@RequestBody SysFile sysFile)
    {
        SysFile folder = sysFileService.createFolder(sysFile.getFileName(), sysFile.getParentId(), sysFile.getBusinessType(), sysFile.getBusinessId());
        return AjaxResult.success(folder);
    }

    /**
     * 上传文件
     */
    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file,
                                 @RequestParam(value = "businessType", required = false) String businessType,
                                 @RequestParam(value = "businessId", required = false) Long businessId,
                                 @RequestParam(value = "parentId", defaultValue = "0") Long parentId)
    {
        if ("avatar".equalsIgnoreCase(businessType) && !projectConfig.getUser().isAvatarUploadEnabled())
        {
            return AjaxResult.error("用户头像上传已禁用");
        }
        try
        {
            // 上传文件
            SysFile sysFile = sysFileService.uploadFile(file, businessType, businessId, parentId);
            return AjaxResult.success(sysFile);
        }
        catch (Exception e)
        {
            log.error("上传文件失败", e);
            return AjaxResult.error("上传文件失败: " + e.getMessage());
        }
    }

    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload/avatar")
    public AjaxResult uploadAvatar(@RequestParam("file") MultipartFile file,
                                   @RequestParam(value = "userId", required = false) Long userId,
                                   @RequestParam(value = "businessId", required = false) Long businessId)
    {
        if (!projectConfig.getUser().isAvatarUploadEnabled())
        {
            return AjaxResult.error("用户头像上传已禁用");
        }
        try
        {
            Long targetUserId = userId != null ? userId : businessId;
            if (targetUserId == null)
            {
                return AjaxResult.error("缺少用户ID");
            }
            SysFile sysFile = sysFileService.uploadUserAvatar(file, targetUserId);
            return AjaxResult.success(sysFile);
        }
        catch (Exception e)
        {
            log.error("上传用户头像失败", e);
            return AjaxResult.error("上传用户头像失败: " + e.getMessage());
        }
    }

    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload/attachment")
    public AjaxResult uploadAttachment(@RequestParam("file") MultipartFile file,
                                       @RequestParam(value = "relatedId", required = false) Long relatedId,
                                       @RequestParam(value = "businessId", required = false) Long businessId)
    {
        try
        {
            Long targetRelatedId = relatedId != null ? relatedId : businessId;
            SysFile sysFile = sysFileService.uploadSystemAttachment(file, targetRelatedId);
            return AjaxResult.success(sysFile);
        }
        catch (Exception e)
        {
            log.error("上传系统附件失败", e);
            return AjaxResult.error("上传系统附件失败: " + e.getMessage());
        }
    }

    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload/rag")
    public AjaxResult uploadRagDocument(@RequestParam("file") MultipartFile file,
                                        @RequestParam(value = "knowledgeBaseId") Long knowledgeBaseId)
    {
        try
        {
            SysFile sysFile = sysFileService.uploadRagDocument(file, knowledgeBaseId);
            return AjaxResult.success(sysFile);
        }
        catch (Exception e)
        {
            log.error("上传RAG文档失败", e);
            return AjaxResult.error("上传RAG文档失败: " + e.getMessage());
        }
    }

    /**
     * 删除文件
     */
    @Log(title = "文件管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{fileIds}")
    public AjaxResult deleteFile(@PathVariable Long[] fileIds)
    {
        return toAjax(sysFileService.deleteSysFileByIds(fileIds));
    }

    /**
     * 移动文件到指定文件夹
     */
    @Log(title = "文件管理", businessType = BusinessType.UPDATE)
    @PutMapping("/move")
    public AjaxResult moveFile(@RequestParam Long fileId, @RequestParam Long targetParentId)
    {
        return toAjax(sysFileService.moveFileToFolder(fileId, targetParentId));
    }

    /**
     * 批量移动文件
     */
    @Log(title = "文件管理", businessType = BusinessType.UPDATE)
    @PutMapping("/batchMove")
    public AjaxResult batchMoveFiles(@RequestParam List<Long> fileIds, @RequestParam Long targetParentId)
    {
        return toAjax(sysFileService.batchMoveFiles(fileIds, targetParentId));
    }

    /**
     * 重命名文件或文件夹
     */
    @Log(title = "文件管理", businessType = BusinessType.UPDATE)
    @PutMapping("/rename")
    public AjaxResult renameFile(@RequestParam Long fileId, @RequestParam String newName)
    {
        return toAjax(sysFileService.renameFile(fileId, newName));
    }

    /**
     * 获取文件夹路径
     */
    @GetMapping("/getPath/{folderId}")
    public AjaxResult getFolderPath(@PathVariable Long folderId)
    {
        List<SysFile> path = sysFileService.getFolderPath(folderId);
        return AjaxResult.success(path);
    }

    /**
     * 检查文件夹名称是否存在
     */
    @GetMapping("/checkFolderName")
    public AjaxResult checkFolderName(@RequestParam Long parentId,
                                     @RequestParam String fileName,
                                     @RequestParam(value = "businessType", required = false) String businessType,
                                     @RequestParam(value = "excludeId", required = false) Long excludeId)
    {
        boolean exists = sysFileService.checkFolderNameExists(parentId, fileName, businessType, excludeId);
        return AjaxResult.success(!exists);
    }

    /**
     * 查询文件信息
     */
    @GetMapping("/{fileId}")
    public AjaxResult getFileInfo(@PathVariable Long fileId)
    {
        SysFile sysFile = sysFileService.selectSysFileById(fileId);
        return AjaxResult.success(sysFile);
    }

    @GetMapping("/preview/{fileId}")
    public AjaxResult preview(@PathVariable Long fileId)
    {
        String url = sysFileService.getPreviewUrl(fileId);
        if (StringUtils.isEmpty(url))
        {
            return AjaxResult.error("获取预览链接失败");
        }
        Map<String, Object> data = new HashMap<>();
        data.put("url", url);
        return AjaxResult.success(data);
    }

    @GetMapping("/download/{fileId}")
    public AjaxResult download(@PathVariable Long fileId)
    {
        String url = sysFileService.getDownloadUrl(fileId);
        if (StringUtils.isEmpty(url))
        {
            return AjaxResult.error("获取下载链接失败");
        }
        try
        {
            sysFileService.incrementDownloadCount(fileId);
        }
        catch (Exception ignored)
        {
        }
        Map<String, Object> data = new HashMap<>();
        data.put("url", url);
        return AjaxResult.success(data);
    }
}
