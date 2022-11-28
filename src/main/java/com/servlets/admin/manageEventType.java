package com.servlets.admin;

import com.dao.EventTypeDao;
import com.entity.EventType;
import com.db.DBConnect;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ControllerET")
public class manageEventType extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
            ArrayList<EventType> list = typeDao.getAllType();
            EventType eventType = new EventType();
            String mode = req.getParameter("mode");
            String target = "";
            String msg = "";
            HttpSession session = req.getSession();
            session.setAttribute("getListType", (ArrayList<EventType>) list);
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            if (mode.equals("listType")) {
                target = "/admin_login/manageEventType.jsp";
            }
            if (mode.equals("viewEventTypeDetails")) {
                int id = Integer.parseInt(req.getParameter("id"));
                target = "/admin_login/viewEventTypeDetails.jsp";
                eventType = typeDao.getEventTypeById(id);
                session.setAttribute("eventType", (EventType) eventType);
            }
            if (mode.equals("addNewEventType")) {
                String typeEventName = req.getParameter("typeEventName");
                String typeDescription = req.getParameter("typeDescription");
                boolean f = typeDao.addEventType(typeEventName, typeDescription, "Available");
                if (f) {
                    msg = "Added Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                    target = "ControllerET?mode=listType";

                } else {
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                    target = "/admin_login/manageEventType.jsp";
                }
            }
            if (mode.equals("updateEventType")) {
                int id = Integer.parseInt(req.getParameter("id"));
                String typeEventName = req.getParameter("typeEventName");
                String typeDescription = req.getParameter("typeDescription");
                String status = req.getParameter("status");

                boolean f = typeDao.updateEventType(typeEventName, typeDescription, status, id);
                if (f) {
                    msg = "Updated Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                    target = "ControllerET?mode=listType";

                } else {
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                    target = "/admin_login/viewEventTypeDetails.jsp";
                }
            }
            RequestDispatcher reqDispatch = req.getRequestDispatcher(target);
            reqDispatch.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
