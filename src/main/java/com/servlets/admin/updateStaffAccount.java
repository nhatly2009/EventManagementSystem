package com.servlets.admin;

import com.dao.StaffDao;
import com.dao.StudentDao;
import com.db.DBConnect;
import com.entity.Staff;

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
@WebServlet("/updateStaff")
public class updateStaffAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = "";
            String target = "";
            String msg = "";
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            StaffDao staffDao = new StaffDao(DBConnect.getConn());

            if (mode.equals("updateProfile")) {
                String email = req.getParameter("email");
                String fullname = req.getParameter("name");
                int id = Integer.parseInt(req.getParameter("id"));
                String phone = req.getParameter("phone");
                boolean f = staffDao.updateProfile(fullname, email, phone, id);
                if (f == true) {
                    target = "/ListAccount?mode=updateStaffProfileForm&staffId=" + id;
                    msg = "Updated Successfully!";
                    session.setAttribute("imageSuccess2", msg);
                    session.removeAttribute("errorMsg2");
                } else {
                    target = "/ListAccount?mode=updateStaffProfile";
                    msg = "Unsuccessfull";
                    session.setAttribute("errorMsg2", msg);
                    session.removeAttribute("imageSuccess2");
                }
            }
            if (mode.equals("updateImage")) {
                Part imgFilePart = req.getPart("file");
                int id = Integer.parseInt(req.getParameter("staffId"));

                String username = req.getParameter("username");
                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\uploadImages\\staff\\" + username + ".jpg");
                String imagePath = "uploadImages/staff/" + username + ".jpg";
                boolean f = staffDao.updateImage(imagePath, username);
                if (f == true) {
                    target = "/ListAccount?mode=updateStaffProfileForm&staffId=" + id;
                    msg = "Updated Image Successfully!";

                    session.setAttribute("imagePath", imagePath);
                    session.setAttribute("imageSuccess2", msg);
                    session.removeAttribute("errorMsg2");

                } else {
                    target = "/ListAccount?mode=updateStaffProfileForm&staffId=" + id;
                    msg = "Unsuccessfull";
                    session.setAttribute("errorMsg2", msg);
                    session.removeAttribute("imageSuccess2");
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
            StaffDao staffDao = new StaffDao(DBConnect.getConn());

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
