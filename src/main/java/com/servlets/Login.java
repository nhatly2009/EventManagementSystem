package com.servlets;

import com.db.DBConnect;
import com.dao.AdminDao;
import com.dao.StaffDao;
import com.dao.StudentDao;

import com.entity.Admin;
import com.entity.Staff;
import com.entity.Student;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Homepage")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = req.getSession();
//        Object logedUser = (Object) session.getAttribute("logedUser");
        String mode = req.getParameter("mode");
        String target = "";
        String msg = "";
        AdminDao adminDao = new AdminDao(DBConnect.getConn());
        String username = "";
        String password = "";
        if (req.getParameter("username") != null && req.getParameter("password") != null) {
            username = req.getParameter("username");
            password = req.getParameter("password");
            password = adminDao.md5(password);
        }
        Admin admin = adminDao.login(username, password);

        StaffDao staffDao = new StaffDao(DBConnect.getConn());
        Staff staff = staffDao.login(username, password);
        ArrayList<Staff> listStaff = staffDao.getAllUser();

        StudentDao studentDao = new StudentDao(DBConnect.getConn());
        Student student = studentDao.login(username, password);
        ArrayList<Student> listStudent = studentDao.getAllUser();

        if (mode.equals("loginForm")) {
            target = "/login.jsp";
        }
        if (mode.equals("unlogin")) {
            target = "/index.jsp";

        }
        if (mode.equals("login")) {
            if (admin != null) {
                int countEvent, countEventJointRequest, countStaff, countStudent;
                countEvent = adminDao.countEvent();
                countEventJointRequest = adminDao.countEventJointRequest();
                countStaff = adminDao.countStaffAccount();
                countStudent = adminDao.countStudentAccount();

                session.setAttribute("countEvent", (int) countEvent);
                session.setAttribute("countEventJointRequest", (int) countEventJointRequest);
                session.setAttribute("countStaff", (int) countStaff);
                session.setAttribute("countStudent", (int) countStudent);

                session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);
                session.setAttribute("listStudent", (ArrayList<Student>) listStudent);

                session.setAttribute("logedUser", admin);
                target = "/admin_login/dashboard.jsp";

            } else if (staff != null) {
                int countEvent, countEventJointRequest, countStaff, countStudent;
                countEvent = adminDao.countEvent();
                countEventJointRequest = adminDao.countEventJointRequest();
                countStaff = adminDao.countStaffAccount();
                countStudent = adminDao.countStudentAccount();

                session.setAttribute("countEvent", (int) countEvent);
                session.setAttribute("countEventJointRequest", (int) countEventJointRequest);
                session.setAttribute("countStaff", (int) countStaff);
                session.setAttribute("countStudent", (int) countStudent);

                session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);
                session.setAttribute("listStudent", (ArrayList<Student>) listStudent);
                target = "/admin_login/dashboard.jsp";
                session.setAttribute("logedUser", staff);

            } else if (student != null) {
                target = "/student_login/index.jsp";
//                target = "/student_login/homepage.jsp";
                session.setAttribute("getStudentId", (int) student.getStudentId());
                session.setAttribute("logedUser", student);
            } else {
                target = "login.jsp";
                msg = "Login Failed";

            }
        }

        if (mode.equals("logout")) {
            Enumeration em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                String element = (String) em.nextElement();
                if (!"uname".equals(element)) {
                    session.removeAttribute(element);
                }
            }
            session.removeAttribute("logedUser");
            target = "index.jsp";
            msg = "User loged out";
        }
        if (mode.equals("viewAdmin")) {
            target = "/admin_login/dashboard.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");
        }
        if (mode.equals("viewStaff")) {
            target = "/staff_login/dashboard.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");
        }
        if (mode.equals("viewStudent")) {
            target = "/student_login/index.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");

        }
//        req.getRequestDispatcher(target).forward(req, resp);
        session.setAttribute("errorMsg", msg);
        RequestDispatcher reqDispatch = req.getRequestDispatcher(target);
        reqDispatch.forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mode = req.getParameter("mode");
        String target = "";
        String msg = "";
        HttpSession session = req.getSession();

        if (mode.equals("loginForm")) {
            target = "/login.jsp";
        }
        if (mode.equals("viewAdmin")) {
            target = "/admin_login/dashboard.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");
        }
        if (mode.equals("viewStaff")) {
            target = "/staff_login/dashboard.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");
        }
        if (mode.equals("viewStudent")) {
            target = "/student_login/index.jsp";
            session.removeAttribute("errorMsg");
            session.removeAttribute("succSignupMsg");

        }
        if (mode.equals("logout")) {
            Enumeration em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                String element = (String) em.nextElement();
                if (!"uname".equals(element)) {
                    session.removeAttribute(element);
                }
            }
            session.removeAttribute("logedUser");
            target = "index.jsp";
            msg = "User loged out";
        }
        req.getRequestDispatcher(target).forward(req, resp);
    }
}
