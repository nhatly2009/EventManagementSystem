package com.servlets.student;

import com.dao.AdminDao;
import com.dao.StaffDao;
import com.dao.StudentDao;
import com.db.DBConnect;
import com.entity.Staff;

import com.entity.Student;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Register")
public class registerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = "";
            String target = "";
            String msg = "";
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();

            if (mode.equals("registerForm")) {
                target = "/signup.jsp";
            }

            if (mode.equals("registerStudent")) {
                String username = req.getParameter("username");
                AdminDao adminDao = new AdminDao(DBConnect.getConn());
                StaffDao staffDao = new StaffDao(DBConnect.getConn());
                ArrayList<Staff> listStaff = staffDao.getAllUser();

                boolean isCheckUsername = adminDao.isCheckUsernameStaff(username, listStaff);

                if (isCheckUsername == true) {
                    String password = req.getParameter("password");
                    password = adminDao.md5(password);
                    String email = req.getParameter("email");
                    String fullname = req.getParameter("fullname");
                    int studentId = Integer.parseInt(req.getParameter("studentId"));
                    Student student = new Student(studentId, username, password, email, fullname, "Available");

                    StudentDao studentDao = new StudentDao(DBConnect.getConn());
                    boolean f = studentDao.register(student);

                    if (f == true) {
                        target = "/Homepage?mode=loginForm";
                        msg = "Registered Successfully!";
                        session.setAttribute("succSignupMsg", msg);
                        session.removeAttribute("errorMsg");
                    } else {
                        target = "/Register?mode=registerForm";
                        msg = "This username has already existed";
                        session.setAttribute("errorMsg", msg);
                        session.removeAttribute("succSignupMsg");
                    }
                } else {
                    target = "/Register?mode=registerForm";
                    msg = "This username has already existed";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = "";
            String target = "";
            String msg = "";
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            if (mode.equals("registerForm")) {
                target = "/signup.jsp";
                session.removeAttribute("errorMsg");
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
