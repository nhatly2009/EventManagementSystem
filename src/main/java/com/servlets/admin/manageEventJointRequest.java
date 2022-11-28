package com.servlets.admin;

import com.dao.EventDao;
import com.dao.EventJointRequestDao;
import com.dao.EventSuggestDao;
import com.dao.EventTypeDao;
import com.entity.EventType;
import com.db.DBConnect;
import com.entity.Event;
import com.entity.EventJointRequest;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ControllerEJR")
public class manageEventJointRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            String target = "";

            EventDao eventDao = new EventDao(DBConnect.getConn());
            ArrayList<Event> listEvent = eventDao.getAllEvent();
            session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);

            EventJointRequestDao eventJointRequestDao = new EventJointRequestDao(DBConnect.getConn());
            ArrayList<EventJointRequest> listEventJointRequest = eventJointRequestDao.getAllEventJointRequest();
            session.setAttribute("getListEventJointRequest", (ArrayList<EventJointRequest>) listEventJointRequest);

            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            //Event
            if (mode.equals("listEventJointRequest")) {
                target = "/admin_login/manageEventJointRequest.jsp";
                int sizeOfList = listEventJointRequest.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listEventJointRequest.size() > 7) {
                    end = 7;
                } else {
                    end = listEventJointRequest.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<EventJointRequest> listOfPage = eventJointRequestDao.getListEventByPagination(listEventJointRequest, start, end);
                session.setAttribute("getPagination", listOfPage);
            }

            if (mode.equals("viewEventJointRequestDetails")) {
                target = "/admin_login/viewEventJointRequestDetails.jsp";
                int s_id = Integer.parseInt(req.getParameter("student_id"));
                int e_id = Integer.parseInt(req.getParameter("event_id"));
                EventJointRequest eventJointRequest = eventJointRequestDao.getEventByStudentId_EventId(s_id, e_id);
                session.setAttribute("eventJointRequest", eventJointRequest);
            }

            RequestDispatcher reqDispatch = req.getRequestDispatcher(target);
            reqDispatch.forward(req, resp);
//            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mode = req.getParameter("mode");
        HttpSession session = req.getSession();
        String target = "";
        String msg = "";
        EventJointRequestDao eventJointRequestDao = new EventJointRequestDao(DBConnect.getConn());
        ArrayList<EventJointRequest> listEventJointRequest = eventJointRequestDao.getAllEventJointRequest();
        session.setAttribute("getListEventJointRequest", (ArrayList<EventJointRequest>) listEventJointRequest);

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        if (mode.equals("updateEJR")) {
            String status = req.getParameter("status");
            int s_id = Integer.parseInt(req.getParameter("student_id"));
            int e_id = Integer.parseInt(req.getParameter("event_id"));
            String userLoged = req.getParameter("logedUser2");
            boolean f = eventJointRequestDao.updateEventJointRequest(status, userLoged, s_id, e_id);

            if (f) {
                target = "ControllerEJR?mode=listEventJointRequest";
                msg = "Updated Successfully!";
                session.setAttribute("succSignupMsg", msg);
                session.removeAttribute("errorMsg");
            } else {
                target = "/admin_login/viewEventJointRequestDetails.jsp";
                msg = "Unsuccessfully!";
                session.setAttribute("errorMsg", msg);
                session.removeAttribute("succSignupMsg");
            }
        }
        if (mode.equals("listEventJointRequest")) {
            target = "/admin_login/manageEventJointRequest.jsp";
            int sizeOfList = listEventJointRequest.size();
            session.setAttribute("listSize", sizeOfList);
            String page1 = "", page2 = "";
            int start = 0;
            int end;
            if (listEventJointRequest.size() > 7) {
                end = 7;
            } else {
                end = listEventJointRequest.size();
            }
            if (req.getParameter("start") != null) {
                page1 = req.getParameter("start");
                start = Integer.parseInt(page1);
            }
            if (req.getParameter("end") != null) {
                page2 = req.getParameter("end");
                end = Integer.parseInt(page2);
            }
            ArrayList<EventJointRequest> listOfPage = eventJointRequestDao.getListEventByPagination(listEventJointRequest, start, end);
            session.setAttribute("getPagination", listOfPage);
        }
        req.getRequestDispatcher(target).forward(req, resp);
    }
}
