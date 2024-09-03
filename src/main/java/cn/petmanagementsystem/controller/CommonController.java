package cn.petmanagementsystem.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@RestController
public class CommonController {

    private static final String UPLOAD_DIR = "uploads/";


    @RequestMapping("/picUpload")
    public String picUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "上传失败，请选择文件";
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
            return "/uploads/" + file.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
            return "文件上传失败";
        }
    }
}
