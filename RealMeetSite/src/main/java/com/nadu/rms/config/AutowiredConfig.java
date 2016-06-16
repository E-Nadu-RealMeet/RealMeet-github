package com.nadu.rms.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.nadu.rms.dao.BannerDAO;
import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.dao.CategoryDAO;
import com.nadu.rms.dao.CommentDao;
import com.nadu.rms.dao.CustomerDAO;
import com.nadu.rms.dao.EventlistDao;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.GuestlistDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.service.CustomerService;
import com.nadu.rms.service.EventApplyService;
import com.nadu.rms.service.EventDataService;
import com.nadu.rms.service.EventDetailService;
import com.nadu.rms.service.EventEditService;
import com.nadu.rms.service.EventRegService;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.nadu.rms.controller"})
public class AutowiredConfig  extends WebMvcConfigurerAdapter{

    @Bean
    public EventsDao eventsDao(){
    	return new EventsDao();
    }
    @Bean
    public BannerDAO bannerDao(){
    	return new BannerDAO();
    }
    @Bean
    public UsersDao usersDao(){
    	return new UsersDao();
    }
    @Bean
    public BoardDao boardDao(){
    	return new BoardDao();
    }
    @Bean
    public CustomerDAO customersDao(){
    	return new CustomerDAO();
    }
    @Bean
    public ReviewsDao reviewsDao(){
    	return new ReviewsDao();
    }
    @Bean
    public EventDataService eventsService(){
    	return new EventDataService();
    }
    @Bean
    public EventRegService eventRegService(){
    	return new EventRegService();
    }
    @Bean
    public EventlistDao eventlistDao(){
    	return new EventlistDao();
    }
    @Bean
    public CategoryDAO categoryDAO(){
    	return new CategoryDAO();
    }
    @Bean
    public GuestlistDao guestlistDao(){
    	return new GuestlistDao();
    }
    @Bean
    public EventDetailService eventDetailService(){
    	return new EventDetailService();
    }
    @Bean
    public EventApplyService eventApplyService(){
    	return new EventApplyService();
    }
    
    @Bean
    public EventEditService eventEditService(){
    	return new EventEditService();
    }
    
    @Bean
    public CustomerService customerService(){
    	return new CustomerService();
    }
}
