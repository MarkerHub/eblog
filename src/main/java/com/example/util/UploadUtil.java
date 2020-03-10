package com.example.util;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.example.common.lang.Consts;
import com.example.common.lang.Result;
import com.example.shiro.AccountProfile;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@Slf4j
@Component
public class UploadUtil {

    @Autowired
    Consts consts;

    public final static String type_avatar = "avatar";

    public Result upload(String type, MultipartFile file) throws IOException {

        if(StrUtil.isBlank(type) || file.isEmpty()) {
            return Result.fail("上传失败");
        }

        // 获取文件名
        String fileName = file.getOriginalFilename();
        log.info("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        log.info("上传的后缀名为：" + suffixName);
        // 文件上传后的路径
        String filePath = consts.getUploadDir();

        if ("avatar".equalsIgnoreCase(type)) {
            AccountProfile profile = (AccountProfile) SecurityUtils.getSubject().getPrincipal();
            fileName = "/avatar/avatar_" + profile.getId() + suffixName;

        } else if ("post".equalsIgnoreCase(type)) {
            fileName = "/post/post_" + DateUtil.format(new Date(), DatePattern.PURE_DATETIME_MS_PATTERN) + suffixName;
        }

        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            log.info("上传成功后的文件路径未：" + filePath + fileName);

            String path = filePath + fileName;
            String url = "/upload" + fileName;

            log.info("url ---> {}", url);

            return Result.success(url);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return Result.success(null);

    }

}
