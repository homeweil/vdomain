package configuration.controller;
import configuration.service.CTCooperationService;
import model.TRequestCooperationModel;
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
public class CooperationController {
    @Resource(name="configTCooperationService")
    CTCooperationService tCooperationService;
    @RequestMapping(value = "/cooperation/cooperationMgr")
    public void cooperationMgr(HttpSession session,Model model){
        List<TRequestCooperationModel> cooperationList = null;
        System.out.println("cooperationMgr Page");
        try{
            cooperationList = tCooperationService.getCooperationList();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        model.addAttribute("cooperationList",cooperationList);

    }

    @RequestMapping(value="/cooperation/updateCooperationDo")
    public String updateCooperationDo(String id,HttpSession session,Model model){
        TRequestCooperationModel Cooperation = null;
        try{
            Cooperation = tCooperationService.getCooperation(id);
            Cooperation.setTcheck("YES");
            tCooperationService.updateCooperation(Cooperation);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/cooperation/cooperationFailure";
        }
        return "/cooperation/cooperationSuccess";
    }

    @RequestMapping(value="/cooperation/delCooperationDo")
    public String delCooperationDo(String id,HttpSession session,Model model){
        TRequestCooperationModel Cooperation = null;
        try{
            Cooperation = tCooperationService.getCooperation(id);
            tCooperationService.delCooperation(Cooperation);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/cooperation/cooperationFailure";
        }
        return "/cooperation/cooperationSuccess";
    }

    @RequestMapping(value="/cooperation/cooperationSuccess")
    public void cooperationSuccess(HttpSession session,Model model){}

    @RequestMapping(value="/cooperation/cooperationFailure")
    public void cooperationFailure(HttpSession session,Model model){}
}
