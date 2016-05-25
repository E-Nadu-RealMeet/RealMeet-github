package com.nadu.rms.config;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.nadu.rms.controller.UploadController;
import com.nadu.rms.dao.BannerDao;
import com.nadu.rms.dao.BoardDao;
import com.nadu.rms.dao.CustomersDao;
import com.nadu.rms.dao.EventsDao;
import com.nadu.rms.dao.ReviewsDao;
import com.nadu.rms.dao.UsersDao;
import com.nadu.rms.service.EventsService;

import oracle.net.aso.u;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.nadu.rms.controller"})
public class WebConfig extends WebMvcConfigurerAdapter{
	/**
     * CSS / JavaScript / Image 등의 정적 리소스를 처리해주는 핸들러를 등록
     */
	@Autowired
	ServletContext context;
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
 
    /**
     * 인터셉터 (요청을 가로챔)
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
 
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        registry.addInterceptor(localeChangeInterceptor);
 
    }
 
    /**
     * locale resolver
     *
     * @return
     */
    @Bean
    public LocaleResolver localeResolver() {
 
        CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
        cookieLocaleResolver.setDefaultLocale(StringUtils.parseLocaleString("en"));
        return cookieLocaleResolver;
    }
 
    /**
     * JSP를 뷰로 사용하는 뷰 리졸버 등록
     */
    @Bean
    public ViewResolver viewResolver() {
 
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        
        return viewResolver;
    }
 
    @Override
    public void addViewControllers(org.springframework.web.servlet.config.annotation.ViewControllerRegistry registry) {
 
        // 특별히 controller 를 타지 않아도 되는 뷰만 있는 경우 등록
        // ex) 디자인만 입힌 것들.
        registry.addViewController("/simpleView").setViewName("/simpleView");
 
 
        // 404 오류가 발생했을때 보여줄 뷰를 등록
        // registry.addViewController("/page-not-found").setViewName("errors/404");
    }
 
    /**
     * message source 들을 등록함
     *
     * @return
     */
    @Bean
    public MessageSource messageSource() {
 
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:messages/messages", "classpath:messages/validation");
        // if true, the key of the message will be displayed if the key is not
        // found, instead of throwing a NoSuchMessageException
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setDefaultEncoding("UTF-8");
        // # -1 : never reload, 0 always reload
        messageSource.setCacheSeconds(0);
        return messageSource;
    }
    
    @Bean
    public EventsDao eventsDao(){
    	return new EventsDao();
    }
    
    @Bean
    public BannerDao bannerDao(){
    	return new BannerDao();
    }
    @Bean(autowire = Autowire.BY_NAME)
    public CommonsMultipartResolver multipartResolver(){
    	CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
    	commonsMultipartResolver.setMaxUploadSize(20971520);
    	commonsMultipartResolver.setMaxInMemorySize(1048576);
		return commonsMultipartResolver;
    }
    
    @Bean(autowire = Autowire.BY_NAME)
    public FileSystemResource uploadDirResource(){
    	String uploadPath = uploadRepository()+"temp\\";
    	System.out.println("uploadPath : "+uploadPath);
    	FileSystemResource uploadDirResource = new FileSystemResource(uploadPath);
    	return uploadDirResource;
    }
    
    @Bean
    public UploadController uploadController(){
    	String uploadPath = uploadRepository();
    	System.out.println("uploadPath : "+uploadPath);
    	UploadController uploadController = new UploadController();
    	/*uploadController.setMethodNameResolver(new MethodNameResolver() {
			
			@Override
			public String getHandlerMethodName(HttpServletRequest request) throws NoSuchRequestHandlingMethodException {
				// TODO Auto-generated method stub
				return null;
			}
		});*/
    	uploadController.setUploadRepository(uploadPath);
    	return uploadController;
    	
    }
    @Bean
    public String uploadRepository(){
    	return context.getRealPath("")+"resources\\core\\images\\upload\\";
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
    public CustomersDao customersDao(){
    	return new CustomersDao();
    }
    @Bean
    public ReviewsDao reviewsDao(){
    	return new ReviewsDao();
    }
    @Bean
    public EventsService eventsService(){
    	return new EventsService();
    }


}
