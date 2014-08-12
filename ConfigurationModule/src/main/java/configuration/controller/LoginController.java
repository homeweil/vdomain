package configuration.controller;
import configuration.service.CTUserService;
import model.TUsersModel;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2014/8/11 0011.
 */
@Controller
public class LoginController {

    @Resource(name="configTUserService")
    CTUserService userService;

    @RequestMapping(value="/login/login")
    public void loginpage(HttpSession session,Model model){}

    @RequestMapping(value="/login/errorlogin")
    public void errorlogin(HttpSession session,Model model){}

    @RequestMapping(value="/login/loading")
    public String loading(String userName ,
                          String passWord,
                          HttpSession session,Model model){
        TUsersModel user =null;
        try{
            System.out.println("Id:"+userName+";Password:"+passWord+";");
            user = userService.queryOneUser(userName);
            System.out.println("UserName:"+user.getUserName());
            if(user!=null){
                if(user.getPassWord().equals(passWord)){
                    session.setAttribute("id",user.getId());
                    session.setAttribute("password",user.getPassWord());
                    return "/index";
                }
            }
            else{
                return "/login/errorlogin";
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return "/login/errorlogin";
    }

    @RequestMapping(value="/login/userMgr")
    public void userMgr(HttpSession session,Model model){
        List<TUsersModel> userList = null;
        try{
            userList = userService.queryListUser();
            System.out.println("Admin Account Num:"+userList.size());
            model.addAttribute("userList", userList);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    @RequestMapping(value="/login/newUser")
    public void newUser(){}

    @RequestMapping(value="/login/newUserDo")
    public String newUserDo(  String userName,
                              String newPassword){
        TUsersModel exixtUser = null;
        TUsersModel newtUser = new TUsersModel();
        try{
            exixtUser = userService.queryOneUser(userName);
        }catch(Exception ex){ex.printStackTrace();return "/login/userFailure";}
        if(exixtUser != null){
            return "/login/userFailure";
        }
        System.out.println("The Account is able to add;"+userName);
        try{
            newtUser.setUserName(userName);
            newtUser.setPassWord(newPassword);
            userService.newUser(newtUser);
        }catch (Exception ex){ex.printStackTrace();return "/login/userFailure";}
        return "/login/userSuccess";
    }

    @RequestMapping(value="/login/updateUser")
    public void updateUser(String id ,HttpSession session,Model model){
        TUsersModel user=null;
        try{
            user = userService.queryUserById(id);
            model.addAttribute("user",user);
        }catch(Exception ex){ex.printStackTrace();}

    }

    @RequestMapping(value="/login/updateUserDo")
    public String updateUserDo(  String id,
                                 String userName,
                                 String oldPassword,
                                 String newPassword,
                                 HttpSession session,
                                 Model model){
        TUsersModel user =null;
        try{
            System.out.println("id:"+id);
            user = userService.queryUserById(id);
            System.out.println("Username:"+user.getUserName()+"Password:"+user.getPassWord()+"oldPassword"+oldPassword);
        }catch(Exception ex){ex.printStackTrace();}

        if(user.getPassWord().equals(oldPassword)==true ){
            user.setPassWord(newPassword);
            System.out.println("newPassword:"+user.getPassWord());
            try{
                userService.updateUser(user);
            }catch(Exception ex){
                ex.printStackTrace();
                return "/login/userFailure";
            }
            return "/login/userSuccess";
        }
        return "/login/userFailure";
    }


    @RequestMapping(value="/login/delUser")
    public String delUser(String id){
        TUsersModel user =null;
        System.out.println("Del:"+id);
        try{
            user = userService.queryUserById(id);
            userService.delUser(user);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/login/userFailure";
        }
        return "/login/userSuccess";
    }
}
