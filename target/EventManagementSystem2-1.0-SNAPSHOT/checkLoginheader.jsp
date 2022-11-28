<%@page import="com.entity.Student"%>
<%@page import="com.entity.Admin"%>
<%@page import="com.entity.Staff"%>
<%

    Staff staffLog = null;
    Admin adminLog = null;
    Student studentLog = null;
    String logedUserName = "";
    Object logedUser = session.getAttribute("logedUser");

    if (logedUser instanceof Staff) {
        staffLog = (Staff) logedUser;
        logedUserName = staffLog.getName();
    }
    if (logedUser instanceof Admin) {
        adminLog = (Admin) logedUser;
        logedUserName = "Administrator";
    }
    if (logedUser instanceof Student) {
        studentLog = (Student) logedUser;
        logedUserName = studentLog.getStudentName();
     
    }

//    int staffId = 0;
//    if (logedUser.equals("Admin")) {
//        logedUserName = "Administrator";
//    } else if (logedUser.equals("Staff")) {
//        logedUserName = (String) session.getAttribute("getStaffUsername");
//        staffId = (int) session.getAttribute("getstaffId");
//    }
//    if (logedUser != "Admin") {
//        logedUserName = logedUser;
//        staffId = (int) session.getAttribute("getstaffId");
//        if (staffId != 0) {
//            logedUser = String.valueOf(staffId);
//        }
//    }
%>