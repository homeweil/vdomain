package configuration.controller;

import configuration.dao.CTNewsDao;
import configuration.service.CTNewsService;
import dao.TNewsDao;
import model.TNewsDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2014/8/12 0012.
 */
@Controller
public class NewsController {
    @Resource(name ="configTNewsService")
    CTNewsService newsService;
    @RequestMapping(value="/news/newsMgr")
    public void newsMgr(HttpSession session,Model model){
        List<TNewsDto> newsList = null;
        try{
            newsList = newsService.queryNewsList();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        model.addAttribute("newsList",newsList);
    }

    @RequestMapping(value="/news/addNews")
    public String addNewsDo(
                            String newsContent,
                            HttpSession session,Model model){
        TNewsDto news = new TNewsDto();
        news.setNewsContent(newsContent);
        try{
            newsService.saveNews(news);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/news/newsFailure";
        }
        return "/news/newsSuccess";
    }

    @RequestMapping(value="/news/delNews")
    public String delNews(TNewsDto news){
        try{
            newsService.delNews(news);
        }catch(Exception ex){
            ex.printStackTrace();
            return "/news/newsFailure";
        }
        return "/news/newsSuccess";
    }

    @RequestMapping(value="/news/newsSuccess")
    public void newsSuccess(){}

    @RequestMapping(value="/news/newsFailure")
    public void newsFaliure(){}
}
