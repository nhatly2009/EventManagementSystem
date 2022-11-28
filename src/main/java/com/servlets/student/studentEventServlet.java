package com.servlets.student;

import com.dao.EventDao;
import com.dao.EventJointRequestDao;
import com.dao.EventSuggestDao;
import com.dao.EventTypeDao;
import com.dao.StaffDao;
import com.dao.StudentDao;
import com.db.DBConnect;
import com.entity.Event;
import com.entity.EventJointRequest;
import com.entity.EventSuggestIdeas;
import com.entity.EventType;
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

@WebServlet("/studentEvent")
public class studentEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String mode = "";
            String target = "";
            String msg = "";
            mode = req.getParameter("mode");
            HttpSession session = req.getSession();
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            int studentLoggedId = (int) session.getAttribute("getStudentId");

            StaffDao staffDao = new StaffDao(DBConnect.getConn());
            ArrayList<Staff> listStaff = staffDao.getAllUser();
            session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);
            EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
            ArrayList<EventType> listType = typeDao.getAllType();
            session.setAttribute("getListType", (ArrayList<EventType>) listType);

            EventDao eventDao = new EventDao(DBConnect.getConn());
            ArrayList<Event> listEvent = eventDao.getAllEventAvailable();
            session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);

            EventJointRequestDao eventJointRequestDao = new EventJointRequestDao(DBConnect.getConn());
            if (mode.equals("showListEvent")) {
                target = "/student_login/viewListEvent.jsp";
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
            if (mode.equals("sentRequest")) {
                boolean isCheckTheSame = false;

                int eventId = Integer.parseInt(req.getParameter("eventId"));
                int studentId = Integer.parseInt(req.getParameter("studentId"));
                if (eventJointRequestDao.getEventByStudentId_EventId(studentId, eventId) != null) {
                    isCheckTheSame = false;
                } else {
                    isCheckTheSame = true;
                }
                String today = req.getParameter("today");
                Event event;
                event = eventDao.getEventById(eventId);
                session.setAttribute("getEvent", event);
                target = "/student_login/viewEventDetails.jsp";
                if (studentId == studentLoggedId) {
                    if (isCheckTheSame == true) {
                        eventJointRequestDao.addEventJointRequest(studentId, eventId, today, "Pending", "Loading");
                        msg = "Submit Successfull";
                        session.setAttribute("succJoint", msg);
                    } else {
                        msg = "Your request is pending!!!";
                        session.setAttribute("errorJoint", msg);
                    }
                } else {
                    msg = "Wrong Student ID";
                    session.setAttribute("errorJoint", msg);
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
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            int studentLoggedId = (int) session.getAttribute("getStudentId");

            StaffDao staffDao = new StaffDao(DBConnect.getConn());
            ArrayList<Staff> listStaff = staffDao.getAllUser();
            session.setAttribute("listStaff", (ArrayList<Staff>) listStaff);

            EventTypeDao typeDao = new EventTypeDao(DBConnect.getConn());
            ArrayList<EventType> listType = typeDao.getAllType();
            session.setAttribute("getListType", (ArrayList<EventType>) listType);

            EventDao eventDao = new EventDao(DBConnect.getConn());
            ArrayList<Event> listEvent = eventDao.getAllEventAvailable();
            session.setAttribute("getListEvent", (ArrayList<Event>) listEvent);
            EventSuggestDao eventSuggestDao = new EventSuggestDao(DBConnect.getConn());
            if (mode.equals("showListEvent")) {
                target = "/student_login/viewListEvent.jsp";
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
                EventJointRequestDao eventJointRequestDao = new EventJointRequestDao(DBConnect.getConn());
                ArrayList<EventJointRequest> listEventJointRequests = eventJointRequestDao.getAllEventJointRequestByStudentID(studentLoggedId);
                session.setAttribute("getListEJR", listEventJointRequests);
                target = "/student_login/viewListEventJointRequest.jsp";

            }
            if (mode.equals("showListNewIdeas")) {

                ArrayList<EventSuggestIdeas> listEventSuggestIdeas = eventSuggestDao.getAllEventSuggestByStudentID(studentLoggedId);
                session.setAttribute("getListESI", listEventSuggestIdeas);
                ArrayList<EventType> listTypeAvailable = typeDao.getAllAvailableType();
                session.setAttribute("getListTypeAvailable", (ArrayList<EventType>) listTypeAvailable);
                target = "/student_login/viewListEventSuggestIdeas.jsp";

            }
            if (mode.equals("viewEventDetails")) {
                Event event;
                int id = Integer.parseInt(req.getParameter("id"));
                event = eventDao.getEventById(id);
                session.setAttribute("getEvent", event);
                target = "/student_login/viewEventDetails.jsp";
            }
            if (mode.equals("addNewIdeas")) {
                String title = req.getParameter("event_title");
                int typeId = Integer.parseInt(req.getParameter("event_type"));
                String location = req.getParameter("event_location");
                String description = req.getParameter("event_description");
                String today = req.getParameter("today");
                boolean f = eventSuggestDao.addEventSuggestIdeas(studentLoggedId, typeId, title, location, description, today, "Pending");
                if (f) {
                    msg = "Added Successfully!";
                    session.setAttribute("succSignupMsg", msg);
                    session.removeAttribute("errorMsg");
                    target = "studentEvent?mode=showListNewIdeas";

                } else {
                    msg = "Unsuccessfully!";
                    session.setAttribute("errorMsg", msg);
                    session.removeAttribute("succSignupMsg");
                    target = "/student_login/viewListEventSuggestIdeas.jsp";
                }

            }
            if (mode.equals("viewEventSuggestIdeaDetails")) {
                int id = Integer.parseInt(req.getParameter("id"));
                EventSuggestIdeas eventSuggestIdeas = eventSuggestDao.getEventById(id);
                session.setAttribute("eventSuggestIdeas", eventSuggestIdeas);
                target = "/student_login/viewEventSuggestIdeaDetails.jsp";
            }
            req.getRequestDispatcher(target).forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
