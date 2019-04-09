package com.etycx.marry.modules.company.controller;

import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.modules.company.entity.MarryCompany;
import com.etycx.marry.modules.company.service.CompanyService;
import com.etycx.marry.modules.expect.entity.Expect;
import com.etycx.marry.modules.expect.service.ExpectService;
import com.etycx.marry.modules.user.controller.BaseUserController;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.modules.user.service.IUserService;
import com.etycx.marry.modules.user.service.MarryUserService;
import com.etycx.marry.remote.redis.ICoreRedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static com.etycx.marry.modules.user.controller.BaseUserController.REDIS_USER;

@Controller
public class CompanyController extends BaseController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private ExpectService expectService;
    @Autowired
    ICoreRedisService coreRedisService;
    @Autowired
    private MarryUserService marryUserService;
    @ModelAttribute
    public void setUserId(Model model, HttpServletRequest request) {
        Object userId = request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId ;
        if(null!=userId){
            currentUserId = Integer.parseInt((String)userId);
            model.addAttribute("userId",currentUserId);
            MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+currentUserId);
            if(null==marryUser){
                marryUser=marryUserService.get(String.valueOf(currentUserId));
                coreRedisService.addObjectData(REDIS_USER+userId,marryUser,86400);
            }
            model.addAttribute("marryUser",marryUser);
        }
    }

    @RequestMapping(value="aboutenterprises")
    public String toAboutenterprises(Model model){
        List<MarryCompany> marryCompanyList =companyService.getCompanys(1);
        model.addAttribute("company", marryCompanyList.get(0));
        return "modules/jxweb/aboutenterprises";
    }


    @RequestMapping(value="corporateculture")
    public String toCorporateculture(Model model){

        return "modules/jxweb/corporateculture";
    }


    @RequestMapping(value="senseofworth")
    public String toSenseofworth(Model model){
        List<MarryCompany> marryCompanyList =companyService.getCompanys(1);
        model.addAttribute("company", marryCompanyList.get(0));
        return "modules/jxweb/senseofworth";
    }


    @RequestMapping(value="development")
    public String toDevelopment(Model model){
        List<MarryCompany> marryCompanyList =companyService.getCompanys(1);
        model.addAttribute("company", marryCompanyList.get(0));
        return "modules/jxweb/development";
    }

    @RequestMapping(value="contactinformation")
    public String toContactinformation(Model model){
        List<MarryCompany> marryCompanyList =companyService.getAllCompanys();
        model.addAttribute("company", marryCompanyList);
        return "modules/jxweb/contactinformation";
    }

    /**
     * 添加用户期望
     *
     */
    @RequestMapping(value = "addUserExpect")
    public String toIndex(Expect expect){
        expectService.save(expect);
        return "redirect:/index";
    }

    @Autowired
    private IUserService iUserService;


}
