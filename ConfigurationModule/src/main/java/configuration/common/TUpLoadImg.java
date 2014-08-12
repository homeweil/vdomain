package configuration.common;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2014/8/6 0006.
 */
@Controller
public class TUpLoadImg {

    private static final int MAX_UPLOAD_SIZE = 10 * 1024 * 1024;
    private static final String SAVE_PATH = "Image";
    private static final String uploadPath="/resources";

    @RequestMapping(value="/common/upLoadImg")
    public Model fileUpload(HttpServletRequest request, HttpServletResponse response, Model model){
        response.setContentType("text/html;charset=UTF-8");
        Map params = new HashMap();
        FileItem fileItem = null;
        String fileUrl = null;
        String returnPath = null;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            upload.setFileSizeMax(MAX_UPLOAD_SIZE);
            List<FileItem> items = upload.parseRequest(request);
            System.out.println("items.size:"+items.size());
            for(FileItem item : items){
                if(item.isFormField()){

                    params.put(item.getFieldName(), item.getString());
                }else{

                    fileItem = item;
                }
            }

            if(fileItem==null){
                System.out.println("上传文件有误.");

            }
            String originalName = fileItem.getName();
            String fileName = getSaveFileName(originalName);
            String savePath = SAVE_PATH + "/";
            String realPath = getFolder(request, savePath);
            returnPath = uploadPath + "/" + SAVE_PATH +"/" + fileName;
            fileUrl =  realPath +"\\" + fileName;
            System.out.println("Return Url:"+returnPath);
            fileItem.write(new File(fileUrl));


        } catch (Exception ex){
            ex.printStackTrace();
        }
        System.out.println("request.setAttribute:"+fileUrl);
        try {
            response.getWriter().write(returnPath);
            response.getWriter().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }




    /**
     * 依据原始文件名生成新文件名
     *
     * @return
     */
    private String getSaveFileName(String fileName) {

        return System.currentTimeMillis() + this.getFileExt(fileName);
    }

    /**
     * 根据字符串创建本地目录 并建立子目录返回
     * @param path
     * @return
     */
    private String getFolder(HttpServletRequest request, String path) {
        File dir = new File(this.getPhysicalPath(request, path));
        if (!dir.exists()) {
            try {
                dir.mkdirs();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dir.getAbsolutePath();
    }

    /**
     * 根据传入的虚拟路径获取物理路径
     *
     * @param path
     * @return
     */
    private String getPhysicalPath(HttpServletRequest request, String path) {
        String realPath = this.uploadPath;
        if(this.uploadPath==null || this.uploadPath.startsWith("/"))
            realPath = request.getSession().getServletContext().getRealPath(this.uploadPath);
        System.out.println("GetPhysicalPath:/"+realPath + "/" + path);
        return realPath + "/" + path;
    }


    /**
     * 获取文件扩展名
     *
     * @return string
     */
    private String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }
}
