package com.servlets.student;

import com.dao.StudentDao;
import com.db.DBConnect;

import com.entity.Student;
import configPkg.ConfigInfo;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet("/updateStudent")
public class updateStudentAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = "";
            String target = "";
            String msg = "";
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            StudentDao studentDao = new StudentDao(DBConnect.getConn());
            if (mode.equals("registerForm")) {
                target = "/signup.jsp";
            }
            if (mode.equals("updateStudentProfile")) {
                target = "/student_login/updateStudentProfile.jsp";

                int studentId = (int) session.getAttribute("getStudentId");
                Student student = studentDao.getStudentById(studentId);
                session.setAttribute("getStudent", (Student) student);
            }
            if (mode.equals("updateProfile")) {
                String major = req.getParameter("major");
                String email = req.getParameter("email");
                String fullname = req.getParameter("name");
                int id = Integer.parseInt(req.getParameter("id"));
                String phone = req.getParameter("phone");
                boolean f = studentDao.updateProfile(fullname, email, major, phone, id);
                if (f == true) {

                    target = "/updateStudent?mode=updateStudentProfile";
                    msg = "Updated Successfully!";

                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                } else {
                    target = "/updateStudent?mode=updateStudentProfile";
                    msg = "Unsuccessfull";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }
            if (mode.equals("updateImage")) {
//                ServletContext servletctx = req.getServletContext();
//                String ctxFullPath = servletctx.getRealPath("\\");

                Part imgFilePart = req.getPart("file");
                if (imgFilePart.getSubmittedFileName() != "") {
                    String username = req.getParameter("username");

                    imgFilePart.write(ConfigInfo.getCtxRealPath() +"\\uploadImages\\student\\" + username + ".jpg");
                    String imagePath = "uploadImages/student/" + username + ".jpg";
                    boolean f = studentDao.updateImage(imagePath, username);

                    if (f == true) {

//                        target = "/updateStudent?mode=updateStudentProfile";
                        target = "/Homepage?mode=viewStudent";
                        msg = "Updated Image Successfully!";

                        session.setAttribute("imagePath", imagePath);
                        session.setAttribute("imageSuccess", msg);
                        session.removeAttribute("errorMsg");
                       
                       
                    } else {
                        target = "/updateStudent?mode=updateStudentProfile";
                        msg = "Unsuccessfull";
                        session.setAttribute("errorMsg", msg);
                        session.removeAttribute("succSignupMsg");
                    }
                } else {
                    target = "/updateStudent?mode=updateStudentProfile";
                    msg = "No picture chosen";
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
            StudentDao studentDao = new StudentDao(DBConnect.getConn());
            if (mode.equals("registerForm")) {
                target = "/signup.jsp";
                session.removeAttribute("errorMsg");
            }
            if (mode.equals("updateStudentProfile")) {
                target = "/student_login/updateStudentProfile.jsp";
                int studentId = (int) session.getAttribute("getStudentId");
                Student student = studentDao.getStudentById(studentId);
                session.setAttribute("getStudent", (Student) student);
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
