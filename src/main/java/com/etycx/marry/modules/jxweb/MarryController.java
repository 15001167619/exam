package com.etycx.marry.modules.jxweb;

import com.etycx.marry.common.utils.StringUtils;
import com.etycx.marry.common.web.BaseController;
import com.etycx.marry.modules.Recruitment.entity.Recruitment;
import com.etycx.marry.modules.Recruitment.service.MarryRecruitmentService;
import com.etycx.marry.modules.SuccessCase.entity.SuccessCase;
import com.etycx.marry.modules.SuccessCase.service.MarrySuccessService;
import com.etycx.marry.modules.banner.entity.MarryBanner;
import com.etycx.marry.modules.banner.service.MarryBannerService;
import com.etycx.marry.modules.company.entity.MarryCompany;
import com.etycx.marry.modules.company.service.CompanyService;
import com.etycx.marry.modules.comment.entity.MarryComment;
import com.etycx.marry.modules.comment.service.MarryCommentService;
import com.etycx.marry.modules.coupon.entity.MarryCoupon;
import com.etycx.marry.modules.coupon.service.MarryCouponService;
import com.etycx.marry.modules.diary.entity.MarryDiary;
import com.etycx.marry.modules.diary.service.MarryDiaryService;
import com.etycx.marry.modules.dict.entity.MarryDict;
import com.etycx.marry.modules.dict.service.MarryDictService;
import com.etycx.marry.modules.notice.entity.Notice;
import com.etycx.marry.modules.notice.service.MarryNoticeService;
import com.etycx.marry.modules.operation.entity.MarryOperation;
import com.etycx.marry.modules.operation.service.MarryOperationService;
import com.etycx.marry.modules.product.entity.MarryProduct;
import com.etycx.marry.modules.product.service.MarryProductService;
import com.etycx.marry.modules.strategy.entity.MarryStrategy;
import com.etycx.marry.modules.strategy.service.MarryStrategyService;
import com.etycx.marry.modules.user.controller.BaseUserController;
import com.etycx.marry.modules.user.entity.MarryUser;
import com.etycx.marry.modules.user.service.MarryUserService;
import com.etycx.marry.remote.redis.ICoreRedisService;
import com.sun.xml.internal.rngom.parse.host.Base;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.etycx.marry.modules.user.controller.BaseUserController.REDIS_USER;

@Controller
public class MarryController extends BaseController {

    @Autowired
    private MarryStrategyService marryStrategyService;

    @Autowired
    private MarryDictService marryDictService;

    @Autowired
    private MarryBannerService bannerService;

    @Autowired
    private MarryDiaryService diaryService;

    @Autowired
    private MarryProductService productService;


    @Autowired
    private MarrySuccessService marrySuccessService;

    @Autowired
    private MarryRecruitmentService marryRecruitmentService;

    @Autowired
    private MarryNoticeService marryNoticeService;

    @Autowired
    private MarryOperationService operationService;

    @Autowired
    private MarryCouponService marryCouponService;

    @Autowired
    private MarryCommentService commentService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private MarryUserService marryUserService;
    @Autowired
    ICoreRedisService coreRedisService;

    @ModelAttribute
    public void setUserId(Model model,HttpServletRequest request) {
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
            model.addAttribute("scale",marryUser.getScale());
        }
    }


    @RequestMapping(value="notice")
    public String toJoinussocial(int page,Model model){
        int pageSize=10;
        List<Notice> notices=marryNoticeService.selectNotice(page,pageSize);
        List<Integer> integers=marryNoticeService.countByType(1);
        model.addAttribute("page",page);
        model.addAttribute("integers",integers);
        model.addAttribute("num",integers.size()-1);
        model.addAttribute("notices",notices);
        return "modules/jxweb/noticelist";

    }

    @RequestMapping(value="noticeById")
    public String noticeById(int id,Model model){
        Notice notice=marryNoticeService.selectNoticeById(id);
        model.addAttribute("notice",notice);
        return "modules/jxweb/noticecontent";

    }

    @RequestMapping(value="Joinussocial")
    public String toJoinussocial(int page,int state,Model model){
        int pageSize=10;
        List<Recruitment> recruitmentList=marryRecruitmentService.selectRecruitment(state,page,pageSize);
        List<Integer> integers=marryRecruitmentService.countByType(state);
        model.addAttribute("page",page);
        model.addAttribute("integers",integers);
        model.addAttribute("num",integers.size()-1);
        model.addAttribute("recruitmentList",recruitmentList);
        if(state==1){
            return "modules/jxweb/Joinussocial";
        }else {
            return "modules/jxweb/campus";
        }

    }


    @RequestMapping(value="corporatewelfare")
    public String toCorporatewelfare(Model model){
        return "modules/jxweb/corporatewelfare";
    }

    @RequestMapping(value="index")
    public String toIndex(Model model, HttpServletRequest request){
        // 首页 banner
        List<MarryBanner> bannerList = bannerService.findList(new MarryBanner());
        List<Map<String,Object>> bannerListMap = new ArrayList<>();
        for (MarryBanner marryBanner : bannerList) {
            Map<String,Object> marryBannerMap = new HashMap<>(1);
            marryBannerMap.put("bannerPicPath",marryBanner.getCoverPath());
            bannerListMap.add(marryBannerMap);
        }
        model.addAttribute("bannerList", bannerListMap);
        //推荐日记 //
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("type",0);
        int sumCount = diaryService.countDiary(searchMap);
        Integer pageNo = 1;
        Integer pageSize = 8;
        Map<String, Object> pageDiaryMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageDiary", pageDiaryMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageDiaryMap.get("pageNo"));
        List<MarryDiary> diaryList = diaryService.selectDiaryList(searchMap);
        List<Map<String,Object>> diaryListMap = new ArrayList<>();
        for (MarryDiary marryDiary : diaryList) {
            Map<String,Object> marryDiaryMap = new HashMap<>(1);
            marryDiaryMap.put("id",marryDiary.getId());
            marryDiaryMap.put("name",marryDiary.getName());
            marryDiaryMap.put("brief",StringUtils.isBlank(marryDiary.getBrief())?"":marryDiary.getBrief());
            String picPath = marryDiary.getCoverPath();
            List<Map<String,Object>> diaryPicListMap = new ArrayList<>();
            if(StringUtils.isNotBlank(picPath)){
                String[] split = picPath.split(";");
                for (String s : split) {
                    Map<String,Object> marryPicMap = new HashMap<>(1);
                    marryPicMap.put("bannerPicPath",s);
                    diaryPicListMap.add(marryPicMap);
                }
                marryDiaryMap.put("diaryPicList",diaryPicListMap);
            }
            diaryListMap.add(marryDiaryMap);
        }
        model.addAttribute("diaryList", diaryListMap);
        //最新活动
        Map<String, Object> searchActivitiesMap = new HashMap<>(1);
        searchActivitiesMap.put("type",1);
        int sumActivitiesCount = diaryService.countDiary(searchActivitiesMap);
        Integer pageNoActivities = 1;
        Integer pageSizeActivities = 8;
        Map<String, Object> pageActivitiesMap = pagingPageCount(sumActivitiesCount, pageNoActivities, pageSizeActivities);
        searchActivitiesMap.put("pageSize", pageSizeActivities);
        searchActivitiesMap.put("pageNo",pageActivitiesMap.get("pageNo"));
        List<MarryDiary> diaryActivitiesList = diaryService.selectDiaryList(searchActivitiesMap);
        List<Map<String,Object>> diaryActivitiesListMap = new ArrayList<>();
        for (MarryDiary marryDiary : diaryActivitiesList) {
            Map<String,Object> marryActivitiesDiaryMap = new HashMap<>(1);
            marryActivitiesDiaryMap.put("id",marryDiary.getId());
            marryActivitiesDiaryMap.put("name",marryDiary.getName());
            marryActivitiesDiaryMap.put("brief",StringUtils.isBlank(marryDiary.getBrief())?"":marryDiary.getBrief());
            marryActivitiesDiaryMap.put("bannerPicPath","");
            String picPath = marryDiary.getCoverPath();
            if(StringUtils.isNotBlank(picPath)){
                String[] split = picPath.split(";");
                if(split.length>=1){
                    marryActivitiesDiaryMap.put("bannerPicPath",split[0]);
                }

            }
            diaryActivitiesListMap.add(marryActivitiesDiaryMap);
        }
        model.addAttribute("diaryActivitiesList", diaryActivitiesListMap);

        //成功案列
        List<SuccessCase> successCaseList=marrySuccessService.getSuccessCase();
        model.addAttribute("successCaseList",successCaseList);

        //获取公司简介
        List<MarryCompany> marryCompanyList =companyService.getCompanys(1);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        if(null!=userId){
            Integer currentUserId=Integer.parseInt((String)userId);
            model.addAttribute("userId",currentUserId);
            MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+currentUserId);
            model.addAttribute("marryUser",marryUser);
        }
        model.addAttribute("company", marryCompanyList.get(0));
        model.addAttribute("strategyList", marryStrategyService.getIndexList()
                .stream()
                .map(MarryStrategy ::toSuccessMap)
                .collect(Collectors.toList()));
        return "modules/jxweb/index";
    }






    /**
     * 分页计算
     * @param sunCount
     * @param pageNo
     * @param pageSize
     */
    public static Map<String,Object> pagingPageCount(Integer sunCount,Integer pageNo,Integer pageSize){
        Map<String, Object> map = new HashMap<>();
        if (pageSize == null || pageSize < 1) {
            pageSize = 16;
        }
        if (pageNo == null || pageNo < 2) {
            pageNo = 0;
        } else {
            pageNo = pageSize * (pageNo - 1);
        }
        Integer pages = (sunCount + pageSize - 1) / pageSize;
        map.put("pageNo", pageNo);
        map.put("pageSize", pageSize);
        map.put("pages", pages);
        return map;
    }





    @RequestMapping(value="loginordinary")
    public String toLoginordinary(){
        return "modules/jxweb/loginordinary";
    }

    @RequestMapping(value="peoplecenter")
    public String toPeoplecenter(Model model,HttpServletRequest request){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("businessType",1);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId=null;
        if(null!=userId){
            currentUserId=Integer.parseInt((String)userId);
            searchMap.put("userId",currentUserId);
        }
        Integer pageNo = 0;
        Integer pageSize = 8;
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageNo);
        List<MarryOperation> browseList = operationService.findProductList(searchMap);
        for (MarryOperation marryOperation : browseList) {
            Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,marryOperation.getBusinessId()));
            marryOperation.setIsFollow(isFollow);
        }
        List<Map<String, Object>> productBrowseList = browseList.stream()
                .map(MarryOperation::toSuccessMap)
                .collect(Collectors.toList());
        searchMap.put("businessType",0);
        List<MarryOperation> followList = operationService.findProductList(searchMap);
        for (MarryOperation marryOperation : followList) {
            marryOperation.setIsFollow(1);
        }
        List<Map<String, Object>> productFollowList = followList.stream()
                .map(MarryOperation::toSuccessMap)
                .collect(Collectors.toList());
        model.addAttribute("productBrowseList",productBrowseList);
        model.addAttribute("productFollowList",productFollowList);
        model.addAttribute("tabType",1);

        return "modules/jxweb/peoplecenter";
    }

    @RequestMapping(value="personalinformation")
    public String toPersonalinformation(Model model,HttpServletRequest request){

        model.addAttribute("tabType",2);
        return "modules/jxweb/personalinformation";
    }

    @RequestMapping(value="recentlybrowse")
    public String recentlybrowse(Model model,HttpServletRequest request){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("businessType",1);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId=null;
        if(null!=userId){
            currentUserId=Integer.parseInt((String)userId);
            searchMap.put("userId",currentUserId);
        }
        Integer pageNo = 0;
        Integer pageSize = 16;
        int sumCount = operationService.countProduct(searchMap);
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageProduct", pageProductMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));
        List<MarryOperation> productList = operationService.findProductList(searchMap);
        for (MarryOperation marryOperation : productList) {
            Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,marryOperation.getBusinessId()));
            marryOperation.setIsFollow(isFollow);
        }
        List<Map<String, Object>> collect = productList.stream()
                .map(MarryOperation::toSuccessMap)
                .collect(Collectors.toList());
        MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+userId);
        model.addAttribute("marryUser",marryUser);
        model.addAttribute("productList",collect);
        model.addAttribute("tabType",3);
        return "modules/jxweb/recentlybrowse";
    }

    @RequestMapping(value="myconcern")
    public String myconcern(Model model,Integer type,HttpServletRequest request){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("businessType",0);
        searchMap.put("type",type);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        if(null!=userId){
            Integer currentUserId=Integer.parseInt((String)userId);
            searchMap.put("userId",currentUserId);
        }
        Integer pageNo = 0;
        Integer pageSize = 20;
        int sumCount = operationService.countProduct(searchMap);
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageProduct", pageProductMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));
        List<MarryOperation> productList = operationService.findProductList(searchMap);
        for (MarryOperation marryOperation : productList) {
            marryOperation.setIsFollow(1);
        }
        List<Map<String, Object>> collect = productList.stream()
                .map(MarryOperation::toSuccessMap)
                .collect(Collectors.toList());
        MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+userId);
        model.addAttribute("marryUser",marryUser);
        model.addAttribute("productList",collect);
        model.addAttribute("type",type);
        model.addAttribute("tabType",4);

        return "modules/jxweb/myconcern";
    }

    @RequestMapping(value="myevaluation")
    public String myevaluation(Model model,Integer pageNo,HttpServletRequest request){
        Map<String, Object> searchMap = new HashMap<>(1);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId=null;
        if(null!=userId){
            currentUserId=Integer.parseInt((String)userId);
            searchMap.put("userId",currentUserId);
        }
        if(pageNo == null){
            pageNo = 0;
        }
        Integer pageSize = 3;
        int sumCount = commentService.countEvaluation(searchMap);
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageEvaluation", pageProductMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));
        List<MarryComment> groupEvaluationList = commentService.findGroupEvaluationList(searchMap);
        List<Map<String,Object>> listMap = new ArrayList<>();
        for (MarryComment marryComment : groupEvaluationList) {
            Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,marryComment.getBusinessId()));
            marryComment.setIsFollow(isFollow);
            Map<String,Object> resultMap = new HashMap<>(2);
            resultMap.put("productInfo",commentService.getProductInfo(marryComment.getBusinessId(),groupEvaluationList));
            Map<String, Object> searchCommentMap = new HashMap<>(1);
            searchCommentMap.put("userId",userId);
            searchCommentMap.put("businessId",marryComment.getBusinessId());
            resultMap.put("evaluationList",commentService.findEvaluationList(searchCommentMap).stream()
                    .map(MarryComment::toSuccessMap)
                    .collect(Collectors.toList()));
            listMap.add(resultMap);
        }
        MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+userId);
        model.addAttribute("marryUser",marryUser);
        model.addAttribute("userEvaluationList",listMap);
        model.addAttribute("tabType",5);
        model.addAttribute("pageNo",pageNo);
        //分页
        String pageStr = getPageStr(pageNo,(Integer) pageProductMap.get("pages"));
        model.addAttribute("pageStr",pageStr);
        return "modules/jxweb/myevaluation";
    }

    private String getPageStr(Integer pageNo, Integer pages) {
        if(pages==0) return null;
        String page_start = "<div class='page-wrapper' id='page_wrapper'><ul><li><a href='' class='up'>首页</a></li>";
        String page_content = "";
        if(pageNo == 0){
            pageNo = 1;
        }
        String pageStr = "";
        if(pages <= 8){
            if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
                page_content ="<li><a href='javascript:void(0);' onclick ='getPageTurningProductList(0)' class='s'><</a></li>";
            }
            for(int i =1 ;i<= pages; i++){
                if(pageNo == i){
                    pageStr = "<li><a class='active'>"+ i + "</a></li>";
                }else {
                    pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ i + ")'>"+ i + "</a></li>";
                }
                page_content = page_content + pageStr;
            }
        }else {  //超过 8 页 会有 ... 展示
            if(pageNo!=1){   // 不是点击第一页  会有 向前 箭头
                page_content ="<li><a href='javascript:void(0);' onclick ='getPageTurningProductList(0)' class='s'><</a></li>";
            }
            Integer difference = pages - pageNo;
            if(difference == 3 ){ //刚刚好
                for(int n = pageNo - 4 ;n <= pages; n++){
                    if(pageNo == n){
                        pageStr = "<li><a class='active'>"+ pageNo + "</a></li>";
                    }else {
                        pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ n + ")'>"+ n + "</a></li>";
                    }
                    page_content = page_content + pageStr;
                }
            }else if(difference > 3){ // 展示 ...  分三批展示
                // 第一批展示
                if(pageNo<= 5){  // 5 ---> 5 以内 全部展示
                    for(int p =1 ;p <= 5; p++){
                        if(pageNo == p){
                            pageStr = "<li><a class='active'>"+ pageNo +"</a></li>";
                        }else {
                            pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ p + ")'>"+ p + "</a></li>";
                        }
                        page_content = page_content + pageStr;
                    }
                }else{
                    for(int p = pageNo-4 ;p <= pageNo; p++){
                        if(pageNo == p){
                            pageStr = "<li><a class='active'>"+ pageNo + "</a></li>";
                        }else {
                            pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ p + ")'>"+ p + "</a></li>";
                        }
                        page_content = page_content + pageStr;
                    }
                }
                // 第二批展示
                page_content = page_content + "<li class='ellipsis'>...</li>";
                // 第三批展示
                for(int p = pages-1 ;p <= pages; p++){
                    if(pageNo == p){
                        pageStr = "<li><a class='active'>"+ pageNo + "</a></li>";
                    }else {
                        pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ p + ")'>"+ p + "</a></li>";
                    }
                    page_content = page_content + pageStr;
                }
            }else {// 已经到 最底页
                for(int n = pages - 7 ;n <= pages; n++){
                    if(pageNo == n){
                        pageStr = "<li><a class='active'>"+ pageNo + "</a></li>";
                    }else {
                        pageStr = "<li><a  href ='javascript:void(0);' onclick ='getProductList("+ n + ")'>"+ n + "</a></li>";
                    }
                    page_content = page_content + pageStr;
                }
            }
        }
        String page_end = "";
        String end = "";
        if(pageNo!=pages){
            String pageNext = "<li><a href ='javascript:void(0);' onclick ='getPageTurningProductList(1)' class='x'>></a></li>";
            page_end = page_end + pageNext;
        }
        end = "<li><a href ='javascript:void(0);' onclick ='getProductList("+pages +")' class='next'>末页</a></li></ul>";
        page_end = page_end + end;
        return page_start + page_content + page_end+"</div>";
    }


    @RequestMapping(value="mycoupon")
    public String mycoupon(Model model,HttpServletRequest request){
        List<Map<String, Object>> collect = marryCouponService.findList(new MarryCoupon()).stream()
                .map(MarryCoupon::toSuccessMap)
                .collect(Collectors.toList());

        model.addAttribute("tabType",6);
        model.addAttribute("couponList",collect);
        return "modules/jxweb/mycoupon";
    }

    @RequestMapping(value="personalsharing")
    public String personalsharing(Model model,HttpServletRequest request){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("businessType",2);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId=null;
        if(null!=userId){
            currentUserId=Integer.parseInt((String)userId);
            searchMap.put("userId",currentUserId);
        }
        Integer pageNo = 0;
        Integer pageSize = 16;
        int sumCount = operationService.countProduct(searchMap);
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageProduct", pageProductMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));
        List<MarryOperation> productList = operationService.findProductList(searchMap);
        for (MarryOperation marryOperation : productList) {
            Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,marryOperation.getBusinessId()));
            marryOperation.setIsFollow(isFollow);
        }
        List<Map<String, Object>> collect = productList.stream()
                .map(MarryOperation::toSuccessMap)
                .collect(Collectors.toList());
        model.addAttribute("productList",collect);
        model.addAttribute("tabType",7);
        return "modules/jxweb/personalsharing";
    }


    @RequestMapping(value="recdiarycontent")
    public String toRecdiarycontent(String id,Model model,HttpServletRequest request){
        MarryDiary marryDiary = diaryService.get(id);
        model.addAttribute("marryDiary", marryDiary);
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("type",0);
        int sumCount = diaryService.countDiary(searchMap);
        Integer pageNo = 1;
        Integer pageSize = 5;
        Map<String, Object> pageDiaryMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageDiary", pageDiaryMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageDiaryMap.get("pageNo"));
        List<MarryDiary> diaryList = diaryService.selectDiaryList(searchMap);
        List<Map<String,Object>> diaryListMap = new ArrayList<>();
        for (MarryDiary diary : diaryList) {
            Map<String,Object> marryDiaryMap = new HashMap<>(1);
            marryDiaryMap.put("id",diary.getId());
            marryDiaryMap.put("name",diary.getName());
            marryDiaryMap.put("bannerPicPath","");
            String picPath = marryDiary.getCoverPath();
            if(StringUtils.isNotBlank(picPath)){
                String[] split = picPath.split(";");
                if(split.length>=1){
                    marryDiaryMap.put("bannerPicPath",split[0]);
                }

            }
            diaryListMap.add(marryDiaryMap);
        }
        model.addAttribute("diaryList", diaryListMap);
        //上一页
        Map<String, Object> map = new HashMap<>(2);
        map.put("sort",marryDiary.getSort());
        map.put("type",0);
        List<MarryDiary> topList = diaryService.getTopDiaryList(map);
        model.addAttribute("topId", 0);
        model.addAttribute("nextId", 0);
        model.addAttribute("topName", "");
        model.addAttribute("nextName", "");
        for (MarryDiary diary : topList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("topId", diary.getId());
                model.addAttribute("topName", diary.getName());
                break;
            }else {
                continue;
            }
        }
        //下一页
        List<MarryDiary> nextList = diaryService.getNextDiaryList(map);
        for (MarryDiary diary : nextList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("nextId", diary.getId());
                model.addAttribute("nextName", diary.getName());
                break;
            }else {
                continue;
            }
        }
        return "modules/jxweb/recdiarycontent";
    }








    @RequestMapping(value="latestactivitiescontent")
    public String toLatestactivitiescontent(String id,Model model){
        MarryDiary marryDiary = diaryService.get(id);
        model.addAttribute("marryDiary", marryDiary);
        //上一页
        Map<String, Object> map = new HashMap<>(2);
        map.put("sort",marryDiary.getSort());
        map.put("type",1);
        List<MarryDiary> topList = diaryService.getTopDiaryList(map);
        model.addAttribute("topId", 0);
        model.addAttribute("nextId", 0);
        model.addAttribute("topName", "");
        model.addAttribute("nextName", "");
        for (MarryDiary diary : topList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("topId", diary.getId());
                model.addAttribute("topName", diary.getName());
                break;
            }else {
                continue;
            }
        }
        //下一页
        List<MarryDiary> nextList = diaryService.getNextDiaryList(map);
        for (MarryDiary diary : nextList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("nextId", diary.getId());
                model.addAttribute("nextName", diary.getName());
                break;
            }else {
                continue;
            }
        }
        return "modules/jxweb/latestactivitiescontent";
    }

    @RequestMapping(value="latestactivitieslist")
    public String toatestactivitieslist(Model model){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("type",1);
        int sumCount = diaryService.countDiary(searchMap);
        Integer pageNo = 1;
        Integer pageSize = 20;
        Map<String, Object> pageDiaryMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageDiary", pageDiaryMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageDiaryMap.get("pageNo"));
        List<MarryDiary> diaryList = diaryService.selectDiaryList(searchMap);
        List<Map<String,Object>> diaryListMap = new ArrayList<>();
        for (MarryDiary marryDiary : diaryList) {
            Map<String,Object> marryDiaryMap = new HashMap<>(1);
            marryDiaryMap.put("id",marryDiary.getId());
            marryDiaryMap.put("name",marryDiary.getName());
            marryDiaryMap.put("brief",StringUtils.isBlank(marryDiary.getBrief())?"":marryDiary.getBrief());
            marryDiaryMap.put("bannerPicPath","");
            String picPath = marryDiary.getCoverPath();
            if(StringUtils.isNotBlank(picPath)){
                String[] split = picPath.split(";");
                if(split.length>=1){
                    marryDiaryMap.put("bannerPicPath",split[0]);
                }

            }
            diaryListMap.add(marryDiaryMap);
        }
        model.addAttribute("diaryList", diaryListMap);
        return "modules/jxweb/latestactivitieslist";
    }

    @RequestMapping(value="loginphone")
    public String toLoginphone(){
        return "modules/jxweb/loginphone";
    }

    @RequestMapping(value="retrieve")
    public String toRetrieve(){
        return "modules/jxweb/retrieve";
    }

    @RequestMapping(value="register")
    public String toRegister(){
        return "modules/jxweb/register";
    }

    @RequestMapping(value="useragreement")
    public String toUseragreement(){
        return "modules/jxweb/useragreement";
    }

    @RequestMapping(value="strategy")
    public String toStrategy(Model model,String type){
        //获取 标题栏
        List<MarryDict> marryDictList = marryDictService.findList(new MarryDict(8,0));
        List<Map<String,Object>> mapList = new ArrayList<>();
        for (MarryDict dict : marryDictList) {
            Map<String,Object> dictMap = new HashMap<>(2);
            dictMap.put("id",dict.getId());
            dictMap.put("name",dict.getLabel());
            mapList.add(dictMap);
        }
        model.addAttribute("mapList", mapList);
        if(StringUtils.isBlank(type)){
            String id = "0";
            if(marryDictList.size()>0){
                id = marryDictList.get(0).getId();
                setStrategyList(model,id);
            }
            model.addAttribute("init", id);
        }else {
            model.addAttribute("init", type);
            setStrategyList(model,type);
        }
        return "modules/jxweb/strategy";
    }


    private void setStrategyList(Model model,String type){
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("type",type);
        int sumCount = marryStrategyService.countStrategy(searchMap);
        Integer pageNo = 0;
        Integer pageSize = 16;
        Map<String, Object> pageStrategyMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageStrategy", pageStrategyMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageStrategyMap.get("pageNo"));
        List<MarryStrategy> strategyList = marryStrategyService.selectStrategyList(searchMap);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageStr",getPageStr(pageNo,(Integer) pageStrategyMap.get("pages")));
        model.addAttribute("strategyList",strategyList.stream().map(MarryStrategy :: toSuccessMap).collect(Collectors.toList()));
    }

    @RequestMapping(value="strategycontent")
    public String toStrategycontent(Model model,String id){
        MarryStrategy marryStrategy = marryStrategyService.get(id);
        model.addAttribute("marryStrategy", marryStrategy);

        //上一页
        Map<String, Object> map = new HashMap<>(2);
        map.put("sort",marryStrategy.getSort());
        map.put("type",marryStrategy.getType());
        List<MarryStrategy> topList = marryStrategyService.getTopStrategyList(map);
        model.addAttribute("topId", 0);
        model.addAttribute("nextId", 0);
        model.addAttribute("topName", "");
        model.addAttribute("nextName", "");
        for (MarryStrategy diary : topList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("topId", diary.getId());
                model.addAttribute("topName", diary.getName());
                break;
            }else {
                continue;
            }
        }
        //下一页
        List<MarryStrategy> nextList = marryStrategyService.getNextStrategyList(map);
        for (MarryStrategy diary : nextList) {
            if(!id.equals(diary.getId())){
                model.addAttribute("nextId", diary.getId());
                model.addAttribute("nextName", diary.getName());

                break;
            }else {
                continue;
            }
        }

        //获取其他推荐
        map.put("id",marryStrategy.getId());
        model.addAttribute("otherStrategyList", marryStrategyService.getOtherStrategyList(map)
                .stream()
                .map(MarryStrategy ::toSuccessMap)
                .collect(Collectors.toList()));
        return "modules/jxweb/strategycontent";
    }

    @RequestMapping(value="productdetails")
    public String toProductdetails(String id,Model model,Integer pageNo,HttpServletRequest request){
        MarryProduct marryProduct = productService.get(id);
        List<Map<String,Object>> productPicListMap = new ArrayList<>();
        if(StringUtils.isNotBlank(marryProduct.getPicPath())){
            String[] split = marryProduct.getPicPath().split(";");

            for (String s : split) {
                Map<String,Object> marryPicMap = new HashMap<>(1);
                marryPicMap.put("picPath",s);
                productPicListMap.add(marryPicMap);
            }
        }
        model.addAttribute("marryProduct", marryProduct);
        model.addAttribute("picList", productPicListMap);

        //添加 浏览记录
        try {
            String attribute = (String) request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
            if(StringUtils.isNotBlank(attribute)){
                Integer userId = Integer.parseInt(attribute);
                operationService.save(new MarryOperation(userId,1,Integer.parseInt(id)));
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }


        //查看用户评论
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("businessId",id);
        int sumCount = commentService.countComment(searchMap);
        if(pageNo == null){
            pageNo = 0;
            model.addAttribute("li",1);
        }else {
            model.addAttribute("li",0);
        }
        Integer pageSize = 2;
        searchMap.put("searchPid",0);

        Map<String, Object> pageCommentMap = pagingPageCount(sumCount, pageNo, pageSize);
        model.addAttribute("pageComment", pageCommentMap);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageCommentMap.get("pageNo"));
        List<MarryComment> commentList = commentService.selectCommentList(searchMap);
        List<Map<String,Object>> map = new ArrayList<>();
        for (MarryComment marryComment : commentList) {
            Map<String,Object> commentMap = new HashMap<>(2);
            commentMap.put("parentComment",MarryComment.toParentMap(marryComment));
            Map<String, Object> searchChildMap = new HashMap<>(1);
            searchChildMap.put("businessId",id);
            searchChildMap.put("pageChildNo",0);
            searchChildMap.put("pageSize",2);
            searchChildMap.put("pId",marryComment.getId());
            commentMap.put("childComment",commentService.childCommentList(searchChildMap).stream().map(MarryComment ::toParentMap ).collect(Collectors.toList()));
            commentMap.put("childCommentCount",commentService.childCommentCount(searchChildMap));
            commentMap.put("businessId",id);
            commentMap.put("pId",marryComment.getId());
            map.add(commentMap);
        }
        model.addAttribute("userComments", map);
        model.addAttribute("userCommentsCounts", commentService.countAllComments(id));
        model.addAttribute("pageNo", pageNo);
        String pageStr = getPageStr(pageNo,(Integer) pageCommentMap.get("pages"));
        model.addAttribute("pageStr",pageStr);
        Object userId=request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId = 0;
        if(null!=userId){
            currentUserId = Integer.parseInt((String)userId);
            model.addAttribute("userId",currentUserId);
            MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+currentUserId);
            model.addAttribute("marryUser",marryUser);
        }

        //查看 是否关注
        Integer isFollow = 0;
        String followName = "关注";
        if(currentUserId!=0){
            isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,Integer.parseInt(id)));
            if(isFollow!=0){
                followName = "已关注";
            }
        }
        model.addAttribute("isFollow",isFollow);
        model.addAttribute("followName",followName);

        Map<String,Object> mapProduct = new HashMap<>(1);
        mapProduct.put("userId",currentUserId);
        mapProduct.put("id",id);
        mapProduct.put("type",marryProduct.getType());
        mapProduct.put("pageSize",5);
        model.addAttribute("productList", productService.getOtherProductList(mapProduct));


        return "modules/jxweb/productdetails";
    }


    /**
     * 获取成功案例
     * @param page
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("successfulcase")
    public  String successPicture(int page, int type,Model model){
        int pageSize=16;
        List<MarryProduct> marryProducts=productService.selectProductListByState(page,pageSize);
        List<Integer> integers=productService.selectProductByShowStateCount();
        model.addAttribute("page",page);
        model.addAttribute("integers",integers);
        model.addAttribute("num",integers.size()-1);
        /*for (MarryProduct ma:marryProducts){
            if (ma.getType()==type){
                String caverPath=ma.getCoverPath();
                String[] showPath=caverPath.split(";");
                if(showPath.length==4){
                    String pic1=showPath[0];
                    String pic2=showPath[1];
                    String pic3=showPath[2];
                    String pic4=showPath[3];
                    model.addAttribute("pic1",pic1);
                    model.addAttribute("pic2",pic2);
                    model.addAttribute("pic3",pic3);
                    model.addAttribute("pic4",pic4);
                    model.addAttribute("name",ma.getName());
                    model.addAttribute("brief",ma.getBrief());
                    break;
                }
            }
        }*/
        //成功案列
        List<SuccessCase> successCaseList=marrySuccessService.getSuccessCase();
        model.addAttribute("successCaseList",successCaseList);
        model.addAttribute("marryProducts",marryProducts);
        return "modules/jxweb/successfulcase";
    }

    @RequestMapping(value="searchlist")
    public String toSearchlist(String keyword, Model model,HttpServletRequest request){
        Object userId = request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId = null;
        if(null!=userId){
            currentUserId = Integer.parseInt((String)userId);
        }
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("searchContent",keyword);
        Integer pageNo = 0;
        Integer pageSize = 16;
        int sumCount = productService.countProduct(searchMap);
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));
        List<MarryProduct> marryProducts = productService.selectProductList(searchMap);
        List<Map<String,Object>> productsListMap = new ArrayList<>();
        for (MarryProduct marryProduct : marryProducts) {
            Map<String,Object> marryProductMap = new HashMap<>(3);
            marryProductMap.put("isFollow",0);
            marryProductMap.put("followName","关注");
            if(userId!=null){
                Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,Integer.parseInt(marryProduct.getId())));
                marryProductMap.put("isFollow",isFollow);
                if(isFollow==0){
                    marryProductMap.put("followName","关注");
                }else {
                    marryProductMap.put("followName","已关注");
                }
            }
            marryProductMap.put("id",marryProduct.getId());
            marryProductMap.put("name",marryProduct.getName());
            marryProductMap.put("coverPath",marryProduct.getCoverPath());
            productsListMap.add(marryProductMap);
        }
        model.addAttribute("productsList", productsListMap);
        model.addAttribute("keyword", keyword);
        model.addAttribute("productSize", sumCount);
        return "modules/jxweb/searchlist";
    }


    @RequestMapping(value="productlist")
    public String toProductlist(Integer type, Model model,HttpServletRequest request){
        Object userId = request.getSession().getAttribute(BaseUserController.CURRENT_USER_ID);
        Integer currentUserId = null;
        if(null!=userId){
            currentUserId = Integer.parseInt((String)userId);
        }
        StringBuilder uniqueIds = new StringBuilder();
        model.addAttribute("type", type);
        List<Map<String,Object>> resultList = new ArrayList<>();
        List<MarryDict> marryDictList = marryDictService.findList(new MarryDict(type,0));
        for (MarryDict marryDict : marryDictList) {
            Map<String,Object> map = new HashMap<>(1);
            map.put("valueName",marryDict.getLabel());
            List<MarryDict> valueList = marryDictService.findList(new MarryDict(type,Integer.parseInt(marryDict.getId())));
            List<Map<String,Object>> mapList = new ArrayList<>();
            Map<String,Object> defaultDictMap = new HashMap<>(3);
            defaultDictMap.put("id",0);
            defaultDictMap.put("name","全部");
            defaultDictMap.put("searchId","searchId_"+marryDict.getId() + "_" + 0);
            mapList.add(defaultDictMap);
            StringBuilder marryDictIds = new StringBuilder();
            for (MarryDict dict : valueList) {
                Map<String,Object> dictMap = new HashMap<>(3);
                dictMap.put("id",dict.getId());
                dictMap.put("name",dict.getLabel());
                dictMap.put("searchId","searchId_"+marryDict.getId() + "_" + dict.getId());
                mapList.add(dictMap);
                marryDictIds.append(dict.getId()).append(",");
            }
            String ids = marryDictIds.toString();
            if(StringUtils.isNotBlank(ids)){
                ids = ids.substring(0,ids.length()-1);
            }
            map.put("valueList",mapList);
            map.put("valueIds",ids);
            map.put("unique","unique_"+marryDict.getId());
            uniqueIds.append(marryDict.getId()).append(",");
            resultList.add(map);
        }
        String uniqueIdList = uniqueIds.toString();
        if(StringUtils.isNotBlank(uniqueIdList)){
            uniqueIdList = uniqueIdList.substring(0,uniqueIdList.length()-1);
        }
        model.addAttribute("marryDictList", resultList);
        model.addAttribute("uniqueIds", uniqueIdList);
        //产品展示查询 all 1 + 12 展示
        Map<String, Object> searchMap = new HashMap<>(1);
        searchMap.put("type",type);
        int sumCount = productService.countProduct(searchMap);
        Integer pageNo = 1;
        Integer pageSize = 13;
        Map<String, Object> pageProductMap = pagingPageCount(sumCount, pageNo, pageSize);
        searchMap.put("pageSize", pageSize);
        searchMap.put("pageNo",pageProductMap.get("pageNo"));

        Map<String,Object> topProductMap = new HashMap<>(1);
        topProductMap.put("topOn",0);
        List<MarryProduct> productList = productService.selectProductList(searchMap);
        List<Map<String,Object>> productsListMap = new ArrayList<>();
        for (MarryProduct marryProduct : productList) {
            Map<String,Object> marryProductMap = new HashMap<>(3);
            if(marryProduct.getTopOn()==1){
                topProductMap.put("id",marryProduct.getId());
                topProductMap.put("name",marryProduct.getName());
                topProductMap.put("coverPath",marryProduct.getCoverPath());
                topProductMap.put("topOn",marryProduct.getTopOn());
                String picPath = marryProduct.getPicPath();
                List<Map<String,Object>> productPicListMap = new ArrayList<>();
                if(StringUtils.isNotBlank(marryProduct.getPicPath())){
                    String[] split = picPath.split(";");
                    for (String s : split) {
                        Map<String,Object> marryPicMap = new HashMap<>(1);
                        marryPicMap.put("picPath",s);
                        productPicListMap.add(marryPicMap);
                    }
                }
                topProductMap.put("productPicList",productPicListMap);
            }else {

                marryProductMap.put("isFollow",0);
                marryProductMap.put("followName","关注");

                if(null!=currentUserId){
                    Integer isFollow = operationService.isFollow(new MarryOperation(currentUserId,0,Integer.parseInt(marryProduct.getId())));
                    marryProductMap.put("isFollow",isFollow);
                    if(isFollow==0){
                        marryProductMap.put("followName","关注");
                    }else {
                        marryProductMap.put("followName","已关注");
                    }
                }
                marryProductMap.put("id",marryProduct.getId());
                marryProductMap.put("name",marryProduct.getName());
                marryProductMap.put("coverPath",marryProduct.getCoverPath());
                marryProductMap.put("topOn",marryProduct.getTopOn());
                productsListMap.add(marryProductMap);
            }
        }
        MarryUser marryUser=(MarryUser) coreRedisService.getObjectData(BaseUserController.REDIS_USER+userId);
        model.addAttribute("marryUser",marryUser);
        model.addAttribute("productList", productsListMap);
        model.addAttribute("productSize", productsListMap.size());
        model.addAttribute("topProduct", topProductMap);
        model.addAttribute("totalCategory", marryDictList.size());
        return "modules/jxweb/productlist";
    }


}
