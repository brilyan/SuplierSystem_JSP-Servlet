<%-- 
    Document   : edit
    Created on : 18/04/2020, 5:50:49 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%!
    Connection connection;
    PreparedStatement prepare;
    ResultSet resultset;
    String kode;
%>

<%
    kode=request.getParameter("kodeedit");
    String nama=request.getParameter("txtnamasuplieredt");
    String alamat=request.getParameter("txtalamatsuplieredt");
    String nohp=request.getParameter("txtnohpsuplieredt");
    String email=request.getParameter("txtemailsuplieredt");
    String kontak=request.getParameter("txtkontaksuplieredt");
    String bank=request.getParameter("txtbanksuplieredt");
    String keterangan=request.getParameter("txtketerangansuplieredt");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
        prepare=connection.prepareStatement("select * from tbl_suplier where kode=?");
        prepare.setString(1,kode);
        resultset=prepare.executeQuery();
        resultset.next();
    }catch(Exception e){
        
    }
    
    if(request.getParameter("btnubah")!=null && request.getParameter("btnubah")!=""){
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
        prepare=connection.prepareStatement("update tbl_suplier set nama=?, alamat=?, nohp=?, email=?, kontak=?, bank=?, keterangan=? where kode=?");
        prepare.setString(1,nama);
        prepare.setString(2,alamat);
        prepare.setString(3,nohp);
        prepare.setString(4,email);
        prepare.setString(5,kontak);
        prepare.setString(6,bank);
        prepare.setString(7,keterangan);
        prepare.setString(8,kode);
        prepare.executeUpdate();
        response.sendRedirect("./1411501099_Denny_Victor_Kanahebi.jsp");
    }catch(Exception e){
        out.println(e);
    }
    }
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-danger">
        <div>
            <h3>Edit Form</h3>
            <h4><a href="1411501099_Denny_Victor_Kanahebi.jsp">Batal</a></h4>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    <div>
                        <label class="form-label font-weight-bold">Nama Suplier</label>
                        <input type="text" class="form-control" name="txtnamasuplieredt" id="txtnamasuplieredt" value="<%=resultset.getString("nama")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Alamat Suplier</label>
                        <input type="text" class="form-control" name="txtalamatsuplieredt" id="txtalamatsuplieredt" value="<%=resultset.getString("alamat")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">No HP</label>
                        <input type="text" class="form-control" name="txtnohpsuplieredt" id="txtnohpsuplieredt" value="<%=resultset.getString("nohp")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Email Suplier</label>
                        <input type="text" class="form-control" name="txtemailsuplieredt" id="txtemailsuplieredt" value="<%=resultset.getString("email")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Kontak Suplier</label>
                        <input type="text" class="form-control" name="txtkontaksuplieredt" id="txtkontaksuplieredt" value="<%=resultset.getString("kontak")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Bank Suplier</label>
                        <input type="text" class="form-control" name="txtbanksuplieredt" id="txtbanksuplieredt" value="<%=resultset.getString("bank")%>"/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Keterangan</label>
                        <input type="text" class="form-control" name="txtketerangansuplieredt" id="txtketerangansuplieredt" value="<%=resultset.getString("keterangan")%>"/>
                    </div>
                    <br>
                    <div>
                        <input type="submit" name="btnubah" id="btnubah" value="Ubah" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
