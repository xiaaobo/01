package com.sun.controller;

import com.sun.pojo.Admin;
import com.sun.pojo.Stu;
import com.sun.pojo.Teacher;
import com.sun.service.AdminService;
import com.sun.service.StuService;
import com.sun.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    StuService stuService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    AdminService adminService;

    @RequestMapping("login")
    public String loginCheck( String logger, String userName,String psw, HttpSession session, Model model) {
        if(logger==null || "".equals(logger)) return "login";
        System.out.println(logger);
        if ("stu".equals(logger)){
            //学生登录校验
            session.setAttribute("logger","stu");
            String check_psw = stuService.stuLoginCheck(userName);
            System.out.println("学生登录"+userName+"-"+psw);
            if (psw != null && psw.equals(check_psw)) {
                System.out.println("学生账号密码正确");
                Stu stu = stuService.queryStuByUserName(userName);
                //教师名字存入，在教师页面显示
                session.setAttribute("login_msg", stu.getS_name());
                //学生信息存入
                session.setAttribute("stu",stu);
                //学生用户名存入
                session.setAttribute("username",userName);
                System.out.println(stu+"logincontrollerGet");

            return "redirect:/stu/stuScore";
        } else {
            session.setAttribute("login_msg","登录失败,账号或密码错误!");
            return "login";
        }
        }
        //教师登录校验
        else if ("teacher".equals(logger)) {
            //老师登录校验
            session.setAttribute("logger","teacher");
            System.out.println("教师登录"+userName+"-"+psw);
            String check_psw = teacherService.teacherLoginCheck(userName);
            if (psw != null && psw.equals(check_psw)) {
                System.out.println("教师账号密码正确");
                Teacher teacher = teacherService.queryTeacherPersonal(userName);
                //教师信息
                session.setAttribute("teacher",teacher);
                //教师姓名
                session.setAttribute("name_msg", teacher.getT_name());
                //教师用户名
                session.setAttribute("username", userName);
                System.out.println(teacher+"logincontrollerGet");
                //老师首页
                return "redirect:/teacher/index";
            } else {
                session.setAttribute("login_msg","登录失败,账号或密码错误！");
                return "login";
            }
        }
        //管理员登录校验
        else{
            //管理员登录校验
            session.setAttribute("logger","admin");
            System.out.println("管理员登录"+userName+"-"+psw);
            Admin admin = adminService.adminLoginCheck(userName);
            if (psw != null && psw.equals(admin.getA_psw())) {
                System.out.println("管理员账号密码正确");
                session.setAttribute("username", userName);
                //管理员首页
                return "redirect:/admin/stuPerson";
            } else {
                session.setAttribute("login_msg","登录失败,账号或密码错误！");
                return "login";
            }
        }

    }
}
