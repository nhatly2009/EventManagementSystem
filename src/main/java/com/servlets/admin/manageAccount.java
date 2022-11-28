package com.servlets.admin;

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

@WebServlet("/ListAccount")
public class manageAccount extends HttpServlet {

    private String mode;
    private String target;
    private String msg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();

            StaffDao staffDao = new StaffDao(DBConnect.getConn());
            ArrayList<Staff> listStaff = staffDao.getAllUser();
            session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

            StudentDao studentDao = new StudentDao(DBConnect.getConn());
            ArrayList<Student> listStudent = studentDao.getAllUser();
            session.setAttribute("listStudent", (ArrayList<Student>) listStudent);

            if (mode.equals("listStaff")) {
                target = "/admin_login/manageStaffAccount.jsp";
                int sizeOfList = listStaff.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listStaff.size() > 7) {
                    end = 7;
                } else {
                    end = listStaff.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<Staff> listOfPage = staffDao.getListEventByPagination(listStaff, start, end);
                session.setAttribute("getPagination", listOfPage);

            }
            if (mode.equals("updateStaff")) {

                int id = Integer.parseInt(req.getParameter("staffId"));
                String status = req.getParameter("status");

                if (staffDao.updateStatus(status, id) == true) {
                    target = "ListAccount?mode=listStaff";
                    msg = "Updated Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                } else {
                    target = "/admin_login/viewStaffAccountDetails.jsp";
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }

            if (mode.equals("registerForStaff")) {
                AdminDao adminDao = new AdminDao(DBConnect.getConn());
                String username = req.getParameter("username");
                boolean isCheckUsername = adminDao.isCheckUsernameStudent(username, listStudent);

                if (isCheckUsername == true) {
                    String password = req.getParameter("password");
                    password = adminDao.md5(password);
                    String fullname = req.getParameter("fullname");
                    Staff staff = new Staff(username, password, fullname, "Available");
                    boolean f = false;
                    f = staffDao.register(staff);
                    if (f == true) {
                        target = "ListAccount?mode=listStaff";
                        msg = "Registered Successfully!";
                        session.setAttribute("succSignupMsg", msg);
                        session.removeAttribute("errorMsg");

                    } else {
                        target = "/admin_login/registerForStaffForm.jsp";
                        msg = "This username has already existed";
                        session.setAttribute("errorMsg", msg);
                        session.removeAttribute("succSignupMsg");
                    }
                } else {
                    target = "/admin_login/registerForStaffForm.jsp";
                    msg = "This username has already existed";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }

            if (mode.equals("listStudent")) {
                target = "/admin_login/manageStudentAccount.jsp";

            }
            if (mode.equals("updateStudent")) {
                target = "ListAccount?mode=listStudent";
                int id = Integer.parseInt(req.getParameter("studentId"));
                String status = req.getParameter("status");

                if (studentDao.updateStatus(status, id) == true) {
                    target = "ListAccount?mode=listStudent";
                    msg = "Updated Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                } else {
                    target = "/admin_login/viewStudentAccountDetails.jsp";
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }
            if (mode.equals("updateStaffProfileForm")) {
                target = "/admin_login/updateStaffProfile.jsp";
                int staffId = Integer.parseInt(req.getParameter("staffId"));
                Staff staff = staffDao.getStaffById(staffId);
                session.setAttribute("getStaff", staff);
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();

            StaffDao staffDao = new StaffDao(DBConnect.getConn());
            ArrayList<Staff> listStaff = staffDao.getAllUser();
            session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

            StudentDao studentDao = new StudentDao(DBConnect.getConn());
            ArrayList<Student> listStudent = studentDao.getAllUser();
            session.setAttribute("listStudent", (ArrayList<Student>) listStudent);

            if (mode.equals("listStaff")) {
                target = "/admin_login/manageStaffAccount.jsp";
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
                
                int sizeOfList = listStaff.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listStaff.size() > 7) {
                    end = 7;
                } else {
                    end = listStaff.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<Staff> listOfPage = staffDao.getListEventByPagination(listStaff, start, end);
                session.setAttribute("getPagination", listOfPage);
            }

            if (mode.equals("viewStaffAccountDetails")) {
                int id = Integer.parseInt(req.getParameter("staffId"));
                Staff staff = staffDao.getStaffById(id);
                session.setAttribute("getStaff", staff);
                target = "/admin_login/viewStaffAccountDetails.jsp";
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
            }
            if (mode.equals("viewStudentAccountDetails")) {
                int id = Integer.parseInt(req.getParameter("studentId"));
                Student student = studentDao.getStudentById(id);
                session.setAttribute("getStudent", student);
                target = "/admin_login/viewStudentAccountDetails.jsp";
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
            }
            if (mode.equals("listStudent")) {
                target = "/admin_login/manageStudentAccount.jsp";
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
                int sizeOfList = listStudent.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listStudent.size() > 7) {
                    end = 7;
                } else {
                    end = listStudent.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<Student> listOfPage = studentDao.getListEventByPagination(listStudent, start, end);
                session.setAttribute("getPagination", listOfPage);
            }
            if (mode.equals("registerForStaffForm")) {
                target = "/admin_login/registerForStaffForm.jsp";
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
            }
            if (mode.equals("dontHaveAccess")) {
                target = "/admin_login/dashboard.jsp";
                msg = "You do not have sufficient permissions to access!";
                session.setAttribute("errorMsg", msg);
                session.removeAttribute("succSignupMsg");
            }
            if (mode.equals("updateStaffProfileForm")) {
                target = "/admin_login/updateStaffProfile.jsp";
                int staffId = Integer.parseInt(req.getParameter("staffId"));
                Staff staff = staffDao.getStaffById(staffId);
                session.setAttribute("getStaff", staff);
                session.removeAttribute("errorMsg");
                session.removeAttribute("succSignupMsg");
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
