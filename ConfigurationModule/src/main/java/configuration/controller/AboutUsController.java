package configuration.controller;
import configuration.service.CTAboutUsService;
import model.TAboutUsModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2014/8/4 0004.
 */
@Controller
public class AboutUsController {
    @Resource(name="congfigAboutUsService")
    CTAboutUsService tAboutUsService;
    //----------------------------------aboutUs-----------------------------------------
    @RequestMapping(value="/aboutUs/aboutUsMgr")
    public void aboutUsMgr( HttpSession session,Model model){
        List<TAboutUsModel> aboutUsList = null;
        try{
            aboutUsList = tAboutUsService.queryAboutUsDaoList();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        model.addAttribute("tAboutUsList",aboutUsList);
    }

    @RequestMapping(value="/aboutUs/newAboutUs")
    public void newAboutUs( HttpSession session,Model model){
        System.out.println("Save AboutUs page");
    }

    @RequestMapping(value="/aboutUs/newAboutUsDo")
    public String newAboutUsDo(   String title,
                                  String imgUrl,
                                  String aboutDesc,
                                  HttpSession session,
                                  Model model
    ){
        TAboutUsModel aboutUs = new TAboutUsModel();
        aboutUs.setTitle(title);
        aboutUs.setImgUrl(imgUrl);
        aboutUs.setAboutDesc(aboutDesc);
        System.out.println("newAboutUsDo Controller"+title);
        try{
            tAboutUsService.saveAboutUs(aboutUs);
        }catch(Exception ex)
        {
            ex.printStackTrace();
            return "/aboutUs/aboutUsFailure";
        }
        return "/aboutUs/aboutUsSuccess";
    }

    @RequestMapping(value="/aboutUs/updateAboutUs")
    public void updateAboutUs( String id, HttpSession session, Model model){
        TAboutUsModel aboutUs = null;
        try{
            aboutUs = tAboutUsService.queryOneAboutUs(id);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        model.addAttribute("aboutUs",aboutUs);

    }

    @RequestMapping(value="/aboutUs/updateAboutUsDo")
    public String updateAboutUsDo(   String id,
                                     String title,
                                     String imgUrl,
                                     String aboutDesc,
                                     HttpSession session,
                                     Model model){
        TAboutUsModel aboutUs = new TAboutUsModel();
        aboutUs.setId(Integer.parseInt(id));
        aboutUs.setTitle(title);
        aboutUs.setImgUrl(imgUrl);
        aboutUs.setAboutDesc(aboutDesc);
        try{
            tAboutUsService.update(aboutUs);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/aboutUs/aboutUsFailure";
        }
        return"/aboutUs/aboutUsSuccess";
    }

    @RequestMapping(value="/aboutUs/delAboutUsDo")
    public String delAboutUsDo(String id,HttpSession session,Model model){
        TAboutUsModel aboutUs = tAboutUsService.queryOneAboutUs(id);
        try{
            tAboutUsService.delAboutUs(aboutUs);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/aboutUs/aboutUsFailure";
        }
        return"/aboutUs/aboutUsSuccess";
    }
}
