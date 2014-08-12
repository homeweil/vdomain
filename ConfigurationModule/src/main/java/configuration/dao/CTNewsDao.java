package configuration.dao;

import dao.TNewsDao;
import model.TNewsDto;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeoutException;

/**
 * Created by Administrator on 2014/8/12 0012.
 */
@Component("configNewsDao")
public class CTNewsDao extends BaseDao{

    public List<TNewsDto> queryNewsList(){
        return (List<TNewsDto>)super.getAll(TNewsDto.class);
    }

    public TNewsDto queryOneNews(String id){
        return (TNewsDto)super.getById(TNewsDto.class,id);
    }

    public void saveNews(TNewsDto news){
        super.save(news);
    }

    public void updateNews(TNewsDto news){
        super.update(news);
    }

    public void delNews(TNewsDto news){
        super.delete(news);
    }
}
