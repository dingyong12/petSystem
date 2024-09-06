package cn.petmanagementsystem.controller;

import cn.petmanagementsystem.common.Result;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@RestController
public class CommonController {

    // 假设您的项目结构是maven项目，此时src/main/webapp是Web内容根目录
    public static final String UPLOAD_DIR = "src/main/webapp/pic";

    @RequestMapping("/picUpload")
    public Result<String> picUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return Result.fail("文件为空");
        }

        // 获取项目路径
        String projectPath = Paths.get("").toAbsolutePath().toString();

        // 构造上传文件的路径
        File uploadDir = new File(projectPath, UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 保存文件
        File uploadedFile = new File(uploadDir, file.getOriginalFilename());
        try {
            file.transferTo(uploadedFile);
            // 返回图片的地址
            return Result.success("/pic/" + file.getOriginalFilename());
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("上传失败");
        }
    }
}
