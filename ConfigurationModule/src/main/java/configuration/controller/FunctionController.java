package configuration.controller;
import configuration.service.CTFuncintroductionService;
import model.TFuncIntroductionModel;
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
public class FunctionController {
    @Resource(name = "configTfuncIntroductionService")
    CTFuncintroductionService tfuncintroductionService;
    //---------------------------------------function--------------------------------------------
    @RequestMapping(value = "/function/funcMgr")
    public void funcMgr(HttpSession session,Model model){
        System.out.println("funcMgr page!");
        List<TFuncIntroductionModel> tFuncList = null;
        try {
            tFuncList = tfuncintroductionService.getTFuncList();
        }catch (Exception ex)
        {
            model.addAttribute("ERROR",ex);
            ex.printStackTrace();
        }
        model.addAttribute("tFuncList",tFuncList);
    }

    @RequestMapping(value = "/function/newFunc")
    public void newFuncPage(HttpSession session,Model model){
        System.out.println("newFuncPage page!");
    }

    @RequestMapping(value = "/function/newFuncDo")
    public String newFuncDo(
            String funcName,
            String funcTitle,
            String funcParentId,
            String funcDesc,
            String funcPicUrl,
            String funcIconUrl,
            HttpSession session,Model model ){
        System.out.println("newFuncDo"+funcName);
        TFuncIntroductionModel func = new TFuncIntroductionModel();
        func.setFuncName(funcName);
        System.out.println("parentId:"+funcParentId);
        if(funcParentId!=""||funcParentId!=null)
            func.setFuncParentId(Integer.parseInt(funcParentId.trim()));
        func.setFuncTitle(funcTitle);
        func.setFuncDesc(funcDesc);
        func.setFuncPicUrl(funcPicUrl);
        func.setFuncIconUrl(funcIconUrl);
        try {
            tfuncintroductionService.saveFunc(func);
        }catch (Exception ex)
        {
            model.addAttribute("ERROR",ex);
            ex.printStackTrace();
            return "/function/funcFailure";
        }
        return "/function/funcSuccess";
    }

    @RequestMapping(value = "/function/updateFunc")
    public void updateFuncpage(String func_Id,HttpSession session,Model model) {
        TFuncIntroductionModel func = null;
        try {
            func = tfuncintroductionService.getFunc(func_Id);
        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
        model.addAttribute("tFunc",func);
    }

    @RequestMapping(value = "/function/updateFuncDo")
    public String updateFuncDo(
            String id,
            String funcName,
            String funcTitle,
            String funcParentId,
            String funcDesc,
            String funcPicUrl,
            String funcIconUrl,
            HttpSession session,Model model)
    {
        TFuncIntroductionModel func = new TFuncIntroductionModel();
        func.setId(Integer.parseInt(id.trim()));
        func.setFuncName(funcName);
        func.setFuncTitle(funcTitle);
        if(funcParentId!=""||funcParentId!=null)
            func.setFuncParentId(Integer.parseInt(funcParentId));
        func.setFuncDesc(funcDesc);
        func.setFuncPicUrl(funcPicUrl);
        func.setFuncIconUrl(funcIconUrl);
        try {
            tfuncintroductionService.updateFunc(func);
        }catch (Exception ex)
        {
            model.addAttribute("ERROR",ex);
            ex.printStackTrace();
            return "/function/funcFailure";
        }
        return "/function/funcSuccess";
    }
    @RequestMapping(value = "/function/funcSuccess")
    public void funcSuccess(HttpSession session,Model model){}

    @RequestMapping(value = "/function/funcFailure")
    public void funcFailure(HttpSession session,Model model){}

    @RequestMapping(value ="/function/delFunc")
    public String delFunc(String id,HttpSession session,Model model)
    {
        try {
            TFuncIntroductionModel func = tfuncintroductionService.getFunc(id);
            tfuncintroductionService.delFunc(func);
        }catch(Exception ex)
        {
            ex.printStackTrace();
            return "/function/funcFailure";
        }
        return "/function/funcSuccess";

    }
}
