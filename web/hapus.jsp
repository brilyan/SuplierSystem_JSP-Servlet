<%-- 
    Document   : hapus
    Created on : 18/04/2020, 7:32:00 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%! 
    Connection connection;
    PreparedStatement prepare;
%>

<%
    String kodehapus=request.getParameter("hapus");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
        prepare=connection.prepareStatement("delete from tbl_suplier where kode=?");
        prepare.setString(1,kodehapus);
        prepare.executeUpdate();
        response.sendRedirect("./1411501099_Denny_Victor_Kanahebi.jsp");
    }catch(Exception e){
        out.println(e);
    }
%>
