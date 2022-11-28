package com.servlets.admin;

import com.dao.EventSuggestDao;
import com.dao.EventTypeDao;
import com.entity.EventType;
import com.db.DBConnect;
import com.entity.EventSuggestIdeas;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet("/ControllerESI")
public class manageEventSuggestIdeas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            String target = "";

            EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
            ArrayList<EventType> listType = typeDao.getAllAvailableType();
            session.setAttribute("getListType", (ArrayList<EventType>) listType);

            EventSuggestDao eventSuggestDao = new EventSuggestDao(DBConnect.getConn());
            ArrayList<EventSuggestIdeas> listEventSuggestIdeas = eventSuggestDao.getAllEventSuggest();
            session.setAttribute("getListEventSuggestIdeas", (ArrayList<EventSuggestIdeas>) listEventSuggestIdeas);

            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            //Event
            if (mode.equals("listEventSuggestIdeas")) {
                target = "/admin_login/manageEventSuggestIdeas.jsp";
                int sizeOfList = listEventSuggestIdeas.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listEventSuggestIdeas.size() > 7) {
                    end = 7;
                } else {
                    end = listEventSuggestIdeas.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<EventSuggestIdeas> listOfPage = eventSuggestDao.getListEventByPagination(listEventSuggestIdeas, start, end);
                session.setAttribute("getPagination", listOfPage);

            }

            if (mode.equals("viewEventSuggestIdeaDetails")) {
                target = "/admin_login/viewEventSuggestIdeaDetails.jsp";
                int id = Integer.parseInt(req.getParameter("id"));
                EventSuggestIdeas eventSuggestIdeas = eventSuggestDao.getEventById(id);
                session.setAttribute("eventSuggestIdeas", eventSuggestIdeas);
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
        EventSuggestDao eventSuggestDao = new EventSuggestDao(DBConnect.getConn());
        ArrayList<EventSuggestIdeas> listEventSuggestIdeas = eventSuggestDao.getAllEventSuggest();
        session.setAttribute("getListEventSuggestIdeas", (ArrayList<EventSuggestIdeas>) listEventSuggestIdeas);
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        if (mode.equals("updateESI")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String status = req.getParameter("status");
            boolean f = eventSuggestDao.updateEventStatus(status, id);
            if (f) {
                target = "ControllerESI?mode=listEventSuggestIdeas";
                msg = "Updated Successfully!";
                session.setAttribute("succSignupMsg", msg);
                session.removeAttribute("errorMsg");

            } else {
                target = "/admin_login/viewEventSuggestIdeaDetails.jsp";
                msg = "Unsuccessfully!";
                session.setAttribute("errorMsg", msg);
                session.removeAttribute("succSignupMsg");
            }

        }
        if (mode.equals("listEventSuggestIdeas")) {
            target = "/admin_login/manageEventSuggestIdeas.jsp";
            int sizeOfList = listEventSuggestIdeas.size();
            session.setAttribute("listSize", sizeOfList);
            String page1 = "", page2 = "";
            int start = 0;
            int end;
            if (listEventSuggestIdeas.size() > 7) {
                end = 7;
            } else {
                end = listEventSuggestIdeas.size();
            }
            if (req.getParameter("start") != null) {
                page1 = req.getParameter("start");
                start = Integer.parseInt(page1);
            }
            if (req.getParameter("end") != null) {
                page2 = req.getParameter("end");
                end = Integer.parseInt(page2);
            }
            ArrayList<EventSuggestIdeas> listOfPage = eventSuggestDao.getListEventByPagination(listEventSuggestIdeas, start, end);
            session.setAttribute("getPagination", listOfPage);
        }
        req.getRequestDispatcher(target).forward(req, resp);
    }
}
