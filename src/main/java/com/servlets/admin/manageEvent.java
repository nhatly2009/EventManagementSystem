package com.servlets.admin;

import com.dao.EventDao;
import com.dao.EventTypeDao;
import com.entity.EventType;
import com.db.DBConnect;
import com.entity.Event;
import com.entity.Staff;
import configPkg.ConfigInfo;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

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
@WebServlet("/Controller")
public class manageEvent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            String target = "";

            ArrayList<Staff> listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
            session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

            EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
            ArrayList<EventType> listType = typeDao.getAllAvailableType();
            session.setAttribute("getListType", (ArrayList<EventType>) listType);

            EventDao eventDao = new EventDao(DBConnect.getConn());
            ArrayList<Event> listEvent = eventDao.getAllEvent();
            session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);

            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            // -------------------------------------- VIEW LIST ----------------------------------------//
            if (mode.equals("listEvent")) {
                target = "/admin_login/manageEvent.jsp";
                int sizeOfList = listEvent.size();
                session.setAttribute("listSize", sizeOfList);
                String page1 = "", page2 = "";
                int start = 0;
                int end;
                if (listEvent.size() > 7) {
                    end = 7;
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
            // -------------------------------------- VIEW ADD FORM ----------------------------------------//
            if (mode.equals("eventForm")) {
                target = "/admin_login/addNewEventForm.jsp";
            }
            // -------------------------------------- VIEW DETAILS ----------------------------------------//
            if (mode.equals("viewEventDetails")) {
                target = "/admin_login/viewEventDetails.jsp";
                int id = Integer.parseInt(req.getParameter("id"));
                Event event = eventDao.getEventById(id);
                session.setAttribute("event", event);
            }

            RequestDispatcher reqDispatch = req.getRequestDispatcher(target);
            reqDispatch.forward(req, resp);
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
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        EventDao eventDao = new EventDao(DBConnect.getConn());
        ArrayList<Event> listEvent = eventDao.getAllEvent();
        session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);

        ArrayList<Staff> listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
        session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

        EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
        ArrayList<EventType> listType = typeDao.getAllAvailableType();
        session.setAttribute("getListType", (ArrayList<EventType>) listType);
        // -------------------------------------- ADD ----------------------------------------//
        if (mode.equals("addNewEvent")) {

            Part imgFilePart = req.getPart("file");
            if (imgFilePart.getSubmittedFileName().equals("") || imgFilePart.getSubmittedFileName() == null) {
                target = "/admin_login/addNewEventForm.jsp";
                msg = "Unsuccessfully!";
                session.setAttribute("errorMsg", msg);
                session.removeAttribute("succSignupMsg");

            } else {

                String date_start = req.getParameter("date_start");
                String date_forJointRequest = req.getParameter("date_forJointRequest");
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date;
                Date date2;
                try {
                    date = formatter.parse(date_start);
                    date2 = formatter.parse(date_forJointRequest);
                    if (date.getTime() > date2.getTime()) {
                        String title = req.getParameter("event_title");
                        int typeId = Integer.parseInt(req.getParameter("event_type"));

                        String event_location = req.getParameter("event_location");
                        String event_description = req.getParameter("event_description");
                        int staffId = Integer.parseInt(req.getParameter("staffId"));
                        String status = req.getParameter("status");
                        int eventId = eventDao.getNextEventId();
                        imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\uploadImages\\event\\event" + eventId + ".jpg");
                        String imagePath = "uploadImages/event/event" + eventId + ".jpg";

                        if (eventDao.addEvent(title, typeId, event_location, event_description, date_start, date_forJointRequest, imagePath, staffId, status)) {
                            target = "Controller?mode=listEvent";
                            msg = "Added Successfully!";
                            session.setAttribute("succSignupMsg", msg);
                            session.removeAttribute("errorMsg");
                        } else {
                            target = "/admin_login/addNewEventForm.jsp";
                            msg = "Unsuccessfully!";
                            session.setAttribute("errorMsg", msg);
                            session.removeAttribute("succSignupMsg");
                        }
                    } else {
                        target = "/admin_login/addNewEventForm.jsp";
                        msg = "Date start must be greater than date for joint request!";
                        session.setAttribute("alertMsg", msg);
                        session.removeAttribute("succSignupMsg");
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(manageEvent.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }
        // -------------------------------------- UPDATE ----------------------------------------//
        if (mode.equals("updateEvent")) {
            int eventId = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("event_title");
            int typeId = Integer.parseInt(req.getParameter("event_type"));
            String event_location = req.getParameter("event_location");
            String event_description = req.getParameter("event_description");
            String date_start = req.getParameter("date_start");
            String date_forJointRequest = req.getParameter("date_forJointRequest");
            int staffId = Integer.parseInt(req.getParameter("staffId"));
            String status = req.getParameter("status");
            Part imgFilePart = req.getPart("file");
            if (imgFilePart.getSubmittedFileName().equals("")) {
                String imagePath = "uploadImages/event/event" + eventId + ".jpg";

                if (eventDao.updateEvent(title, typeId, event_location, event_description, date_start, date_forJointRequest, imagePath, staffId, status, eventId)) {
                    target = "Controller?mode=listEvent";
                    msg = "Updated Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                } else {
                    target = "/admin_login/viewEventDetails.jsp";
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            } else {

                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\uploadImages\\event\\event" + eventId + ".jpg");
                String imagePath = "uploadImages/student/event" + eventId + ".jpg";

                if (eventDao.updateEvent(title, typeId, event_location, event_description, date_start, date_forJointRequest, imagePath, staffId, status, eventId)) {
                    target = "Controller?mode=listEvent";
                    msg = "Updated Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                } else {
                    target = "/admin_login/viewEventDetails.jsp";
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                }
            }
        }
        // -------------------------------------- VIEW LIST  ----------------------------------------//
        if (mode.equals("listEvent")) {
            target = "/admin_login/manageEvent.jsp";
            int sizeOfList = listEvent.size();
            session.setAttribute("listSize", sizeOfList);
            String page1 = "", page2 = "";
            int start = 0;
            int end;
            if (listEvent.size() > 7) {
                end = 7;
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
        RequestDispatcher reqDispatch = req.getRequestDispatcher(target);
        reqDispatch.forward(req, resp);
    }
}
