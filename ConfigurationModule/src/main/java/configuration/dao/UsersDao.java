package configuration.dao;

import model.TUsersModel;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2014/8/11 0011.
 */
@Component("configTUsersDao")
public class UsersDao  extends BaseDao{

    public TUsersModel queryUserById(String id){
        return (TUsersModel)super.getById(TUsersModel.class,Integer.parseInt(id.trim()));
    }
    public TUsersModel queryOneUser(String userName){
        TUsersModel user=null;
        List<TUsersModel> userList =(List<TUsersModel>) super.getAll(TUsersModel.class);
        for(int i=0;i<userList.size();i++){
            if(userList.get(i).getUserName().equals(userName)){
                user = userList.get(i);
            }
        }
        return user;
    }

    public List<TUsersModel> queryListUser(){
        return (List<TUsersModel>)super.getAll(TUsersModel.class);
    }

    public void updateUser(TUsersModel user){
        super.update(user);
    }

    public void delUser(TUsersModel user){super.delete(user);}

}
