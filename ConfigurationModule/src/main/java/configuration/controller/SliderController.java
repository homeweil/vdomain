package configuration.controller;

import configuration.service.CTSliderImgService;
import model.TSliderImgModel;
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
public class SliderController {
    @Resource(name ="configSliderImgService")
    CTSliderImgService tsliderImgService;
    //---------------------------------------slider--------------------------------------------
    @RequestMapping(value = "/slider/sliderMgr")
    public void sliderMgr(HttpSession session,Model model){
        System.out.println("sliderMgr page!");
        List<TSliderImgModel> tSliderList = null;
        try {
            tSliderList = tsliderImgService.getSliderList();
        }catch (Exception ex)
        {
            ex.printStackTrace();
        }
        model.addAttribute("tSliderList",tSliderList);
    }

    @RequestMapping(value = "/slider/newSlider")
    public void newSliderPage(HttpSession session,Model model){
        System.out.println("newSliderPage page!");
    }

    @RequestMapping(value = "/slider/newSliderDo")
    public String newSliderPageDo(String sliderType,
                                  String targetUrl,
                                  String imgUrl,
                                  String imgDesc,
                                  HttpSession session,Model model){
        System.out.println("/slider/newSliderPageDo !"+sliderType);
        TSliderImgModel slider = new TSliderImgModel();
        slider.setSliderFlag(sliderType);
        slider.setTargetUrl(targetUrl);
        slider.setImgUrl(imgUrl);
        slider.setImgDesc(imgDesc);
        try {
            tsliderImgService.saveSlider(slider);
        }catch(Exception ex)
        {
            ex.printStackTrace();
            return "/slider/sliderFailure";//操作失败页面
        }
        return "/slider/sliderSuccess";//操作成功
    }

    @RequestMapping(value = "/slider/updateSlider")
    public void updateSlider(String sliderId,HttpSession session,Model model){
        System.out.println("updateSlider page:SliderID="+sliderId);
        TSliderImgModel tSlider = tsliderImgService.getOneSlider(sliderId);
        model.addAttribute("tSlider",tSlider);
    }

    @RequestMapping(value = "/slider/updateSliderDo")
    public String updateSliderDo(  String id,
                                   String sliderType,
                                   String targetUrl,
                                   String imgUrl,
                                   String imgDesc,
                                   HttpSession session,Model model){
        System.out.println("/slider/newSliderPageDo !"+sliderType);
        TSliderImgModel slider = new TSliderImgModel();
        slider.setId(Integer.parseInt(id));
        slider.setSliderFlag(sliderType);
        slider.setTargetUrl(targetUrl);
        slider.setImgUrl(imgUrl);
        slider.setImgDesc(imgDesc);
        try {
            tsliderImgService.updateSlider(slider);
        }catch(Exception ex)
        {
            model.addAttribute("ERROR",ex);
            ex.printStackTrace();
            return "/slider/sliderFailure";//操作失败页面
        }
        return "/slider/sliderSuccess";//操作成功
    }
    @RequestMapping(value = "/slider/sliderSuccess")
    public void sliderSuccess(HttpSession session,Model model){}

    @RequestMapping(value = "/slider/sliderFailure")
    public void sliderFailure(HttpSession session,Model model){}

    @RequestMapping(value ="/slider/delSlider")
    public String  delSlider(String id,HttpSession session,Model model){
        try {
            TSliderImgModel slider = tsliderImgService.getOneSlider(id);
            tsliderImgService.delSlider(slider);
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return "/slider/sliderFailure";//操作失败页面
        }
        return "/slider/sliderSuccess";//操作成功

    }
}
