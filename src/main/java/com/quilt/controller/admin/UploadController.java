package com.quilt.controller.admin;

import com.quilt.utils.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/file")
public class UploadController {

    @RequestMapping("/upload")
    @ResponseBody
    public Map fileUpload(HttpSession session,
                          @RequestParam(value = "editormd-image-file", required = true) MultipartFile file){

        Map<Object,Object> result = new HashMap<Object, Object>();

        if( file == null || file.getSize() <= 0 ){
            result.put("success",0);
            result.put("message","上传失败");
            result.put("url"," ");

            return result;
        }

        try {

            String path = FileUploadUtil.saveImage(session, file);
            result.put("success",1);
            result.put("message","上传成功");
            result.put("url",path);

            return result;

        } catch ( IOException e ) {

            result.put("success",0);
            result.put("message","上传失败");
            result.put("url"," ");

            return result;
        }



    }
}
