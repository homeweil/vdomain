package configuration.controller;
import model.TTrialRequestModel;
import org.springframework.stereotype.Controller;
import configuration.service.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
/**
 * Created by Administrator on 2014/8/5 0005.
 */
@Controller
public class TrialController {
    @Resource(name="configTTrialService")
    CTTrialService trialService;

    @RequestMapping(value="/trial/trialMgr")
    public void trialMgr(HttpSession session,Model model){
        List<TTrialRequestModel> tTrialList = null;
        try{
            tTrialList = trialService.queryTrialList();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        model.addAttribute("trialList",tTrialList);
    }

    @RequestMapping(value="/trial/updateTrialDo")
    public String updateTrialDo(String id,HttpSession session,Model model){
        TTrialRequestModel tTrial =null;
        try{
            tTrial = trialService.queryOneTrial(id);
            tTrial.settCheck("YES");
            trialService.updateTrial(tTrial);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/trial/trialFailure";
        }
        return "/trial/trialSuccess";
    }

    @RequestMapping(value="/trial/delTrialDo")
    public String delTrialDo(String id,HttpSession session,Model model){
        TTrialRequestModel tTrial = null;
        try{
            tTrial = trialService.queryOneTrial(id);
            trialService.delTrial(tTrial);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/trial/trialFailure";
        }
        return "/trial/trialSuccess";
    }

    @RequestMapping(value="/trial/trialSuccess")
    public void trialSuccess(HttpSession session,Model model){}

    @RequestMapping(value="/trial/trialFailure")
    public void trialFailure(HttpSession session,Model model){}
}
