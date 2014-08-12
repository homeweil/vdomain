package configuration.service;

import configuration.dao.UsersDao;
import model.TUsersModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2014/8/11 0011.
 */
@Service("configTUserService")
public class CTUserService {
    @Resource(name="configTUsersDao")
    UsersDao tUserDao;

    public TUsersModel queryUserById(String id){ return tUserDao.queryUserById(id); }

    public List<TUsersModel> queryListUser(){
        return tUserDao.queryListUser();
    }

    public TUsersModel queryOneUser(String userName){
        return tUserDao.queryOneUser(userName);
    }

    public void newUser(TUsersModel user){tUserDao.save(user);}

    public void updateUser(TUsersModel user){
        tUserDao.updateUser(user);
    }

    public void delUser(TUsersModel user){tUserDao.delUser(user);}
}
