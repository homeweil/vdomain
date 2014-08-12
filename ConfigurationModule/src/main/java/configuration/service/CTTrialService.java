package configuration.service;

import configuration.dao.CTTrialDao;
import model.TTrialRequestModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2014/8/5 0005.
 */
@Service("configTTrialService")
public class  CTTrialService {
    @Resource(name="configTTrialDao")
    CTTrialDao tTrialDao;

    public List<TTrialRequestModel> queryTrialList(){
        return (List<TTrialRequestModel>)tTrialDao.queryTrialList();
    }

    public TTrialRequestModel queryOneTrial(String id){
        return (TTrialRequestModel)tTrialDao.queryOneTrial(id);
    }

    public void updateTrial(TTrialRequestModel trial){
        tTrialDao.updateTrial(trial);
    }

    public void delTrial(TTrialRequestModel trial){
        tTrialDao.delTrial(trial);
    }
}
