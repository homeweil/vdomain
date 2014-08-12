package configuration.service;

import configuration.dao.CTNewsDao;
import dao.TNewsDao;
import model.TNewsDto;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2014/8/12 0012.
 */
@Service("configTNewsService")
public class CTNewsService {
    @Resource(name="configNewsDao")
    CTNewsDao tNewsDao;
    public List<TNewsDto> queryNewsList(){
        return tNewsDao.queryNewsList();
    }

    public TNewsDto queryOneNews(String id){
        return tNewsDao.queryOneNews(id);
    }

    public void saveNews(TNewsDto news){tNewsDao.saveNews(news);}

    public void updateNews(TNewsDto news){
        tNewsDao.updateNews(news);
    }

    public void delNews(TNewsDto news){
        tNewsDao.delNews(news);
    }
}
