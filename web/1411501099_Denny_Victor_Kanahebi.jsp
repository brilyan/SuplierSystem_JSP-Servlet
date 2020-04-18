<%-- 
    Document   : 1411501099_Denny_Victor_Kanahebi
    Created on : 18/04/2020, 12:01:59 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%!
    Connection connection;
    PreparedStatement prepare;
    ResultSet resultset;
%>

<% 
    if(request.getParameter("btnsimpan")!=null && request.getParameter("btnsimpan")!=""){
        String kode=request.getParameter("txtkodesuplier");
        String nama=request.getParameter("txtnamasuplier");
        String alamat=request.getParameter("txtalamatsuplier");
        String nohp=request.getParameter("txtnosuplier");
        String email=request.getParameter("txtemailsuplier");
        String kontak=request.getParameter("txtkontaksuplier");
        String bank=request.getParameter("cmbbank");
        String keterangan=request.getParameter("txtketerangansuplier");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
            prepare=connection.prepareStatement("insert into tbl_suplier(kode,nama,alamat,nohp,email,kontak,bank,keterangan)values(?,?,?,?,?,?,?,?)");
            prepare.setString(1,kode);
            prepare.setString(2,nama);
            prepare.setString(3,alamat);
            prepare.setString(4,nohp);
            prepare.setString(5,email);
            prepare.setString(6,kontak);
            prepare.setString(7,bank);
            prepare.setString(8,keterangan);
            prepare.executeUpdate();
            response.sendRedirect("./1411501099_Denny_Victor_Kanahebi.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>1411501099_Denny_Victor_Kanahebi</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-danger">
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a href="#" class="navbar-brand">Suplier Management System</a>
            <u  l class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="Home.jsp" class="nav-link font-weight-bold">Home</a>
                </li>
                
                <li class="nav-item">
                    <a href="1411501099_Denny_Victor_Kanahebi.jsp" class="nav-link font-weight-bold">Data Suplier</a>
                </li>
                
                <li class="nav-item">
                    <a href="search.jsp" class="nav-link font-weight-bold">Search Suplier</a>
                </li>
            </ul>
        </nav>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    
                    <div>
                        <label class="form-label font-weight-bold">Kode Suplier</label>
                        <input type="text" name="txtkodesuplier" id="txtkodesuplier" placeholder="Kode Suplier" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Nama Suplier</label>
                        <input type="text" name="txtnamasuplier" id="txtnamasuplier" placeholder="Nama Suplier" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Alamat Suplier</label>
                        <input type="text" name="txtalamatsuplier" id="txtalamatsuplier" placeholder="Alamat Suplier" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">No HP</label>
                        <input type="number" name="txtnosuplier" id="txtnosuplier" placeholder="No HP" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Email</label>
                        <input type="text" name="txtemailsuplier" id="txtemailsuplier" placeholder="Email Suplier" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Kontak</label>
                        <input type="text" name="txtkontaksuplier" id="txtkontaksuplier" placeholder="Kontak Suplier" class="form-control" required/>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Bank</label>
                        <select name="cmbbank">
                            <option>BCA</option>
                            <option>BRI</option>
                            <option>Mandiri</option>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label class="form-label font-weight-bold">Keterangan</label>
                        <input type="text" name="txtketerangansuplier" id="txtketerangansuplier" placeholder="Keterangan" class="form-control" required/>
                    </div>
                    
                    <br>
                    <input type="submit" name="btnsimpan" id="btnsimpan" value="Simpan" class="btn btn-primary"/>
                    <input type="reset" name="btnreset" id="btnreset" value="Reset" class="btn btn-primary"/>
                </form>
            </div>
             <div class="col-sm-8">
            <div class="panel-body">
                <table class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <tr>
                        <th>Kode Suplier</th>
                        <th>Nama Suplier</th>
                        <th>Alamat</th>
                        <th>No HP</th>
                        <th>Email</th>
                        <th>Kontak</th>
                        <th>Bank</th>
                        <th>Keterangan</th>
                        <th>Edit</th>
                        <th>Hapus</th>
                    </tr>
                    
                     <% 
                                            
                        Class.forName("com.mysql.jdbc.Driver");
                        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
                        String db_sql="select * from tbl_suplier";
                        Statement statementtable=connection.createStatement();
                        resultset=statementtable.executeQuery(db_sql);
                        while(resultset.next()){             
                            String kode=resultset.getString("kode");
                      %>
                    
                    <tr>
                        <td><%=resultset.getString("kode")%></td>
                        <td><%=resultset.getString("nama")%></td>
                        <td><%=resultset.getString("alamat")%></td>
                        <td><%=resultset.getString("nohp")%></td>
                        <td><%=resultset.getString("email")%></td>
                        <td><%=resultset.getString("kontak")%></td>
                        <td><%=resultset.getString("bank")%></td>
                        <td><%=resultset.getString("keterangan")%></td>
                        <td><a href="edit.jsp?kodeedit=<%=kode%>">Edit</a></td>
                        <td><a href="hapus.jsp?hapus=<%=kode%>">Hapus</a></td>
                    </tr>
                    <% 
                        }
                    %>
                </table>
            </div>
        </div>
       
        </div>
    </body>
</html>
