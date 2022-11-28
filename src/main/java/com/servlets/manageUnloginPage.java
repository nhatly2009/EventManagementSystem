package com.servlets;

import com.dao.EventDao;
import com.dao.EventJointRequestDao;
import com.dao.EventTypeDao;
import com.dao.StaffDao;
import com.db.DBConnect;
import com.entity.Event;
import com.entity.EventJointRequest;
import com.entity.EventType;
import com.entity.Staff;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/index")
public class manageUnloginPage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mode = req.getParameter("mode");
        String target = "";
        String msg = "";
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        StaffDao staffDao = new StaffDao(DBConnect.getConn());
        ArrayList<Staff> listStaff = staffDao.getAllUser();
        session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

        EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
        ArrayList<EventType> listType = typeDao.getAllType();
        session.setAttribute("getListType", (ArrayList<EventType>) listType);

        EventDao eventDao = new EventDao(DBConnect.getConn());
        ArrayList<Event> listEvent = eventDao.getAllEventAvailable();
        session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);
       
        

        if (mode.equals("showListEvent")) {
            target = "/unlogin/viewListEvent.jsp";
            int sizeOfList = listEvent.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listEvent.size() > 6) {
                    end = 6;
                } else {
                    end = listEvent.size();
                }
                if (req.getParameter("start") != null) {
                    page1 = req.getParameter("start");
                    start = Integer.parseInt(page1);
                }
                if (req.getParameter("end") != null) {
                    page2 = req.getParameter("end");
                    end = Integer.parseInt(page2);
                }
                ArrayList<Event> listOfPage = eventDao.getListEventByPagination(listEvent, start, end);
                session.setAttribute("getPagination", listOfPage);
        }
        if (mode.equals("showListJointRequest")) {
            target = "/unlogin/viewListEventJointRequest.jsp";
        }
        if (mode.equals("showListNewIdeas")) {
            target = "/unlogin/viewListEvent.jsp";
        }
        if (mode.equals("viewEventDetails")) {
            Event event = new Event();
            int id = Integer.parseInt(req.getParameter("id"));
            event = eventDao.getEventById(id);
            session.setAttribute("getEvent", event);
            target = "/unlogin/viewEventDetails.jsp";
        }
        req.getRequestDispatcher(target).forward(req, resp);
    }
}
