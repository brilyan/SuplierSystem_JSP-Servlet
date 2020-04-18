<%-- 
    Document   : search
    Created on : 18/04/2020, 7:47:32 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Suplier</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="popper.min.js" type="text/javascript"></script>
    </head>
    <body class="bg-danger">
        <div class="container">
            <div class="row">
                <form method="post" action="Search">
                    
                    <div class="form-group">
                        <h2>Cari Suplier</h2>
                        <h4><a href="1411501099_Denny_Victor_Kanahebi.jsp">Kembali</a></h4>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Masukkan Kode Suplier</label>
                        <input type="text" class="form-control" name=txtkode id="txtkode" placeholder="Kode" required/>
                    </div>
                    
                    <div>
                        <button class="btn btn-success" type="submit" name="btncari" id="btncari">Cari</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
