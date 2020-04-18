
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Brily Branco
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
    int i;
    Connection connection;
    PreparedStatement prepare;
    ResultSet resultset;
    String kode;
     public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
         response.setContentType("text/html");
         PrintWriter out=response.getWriter();
         kode=request.getParameter("txtkode");
         try{
             Class.forName("com.mysql.jdbc.Driver");
             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/1411501099_denny_victor_kanahebi","root","");
             prepare=connection.prepareStatement("select * from tbl_suplier where kode=?");
             prepare.setString(1, kode);
             resultset=prepare.executeQuery();
             out.println("<b>Detail Suplier</b>");
             out.println("<h3><a href=search.jsp>Kembali</a></h3>");
                
                ResultSetMetaData metadata=resultset.getMetaData();
                int kolom=metadata.getColumnCount();
                
                out.println("<table border=1 bgcolor=yellow>");
                out.println("<tr>");
                out.println("<td>Kode Suplier<td>");
                out.println("<td>Nama Suplier<td>");
                out.println("<td>Alamat Suplier<td>");
                out.println("<td>No HP<td>");
                out.println("<td>Email<td>");
                out.println("<td>Kontak<td>");
                out.println("<td>Bank<td>");
                out.println("<td>Keterangan<td>");
                
                out.println("</tr>");
                
                while(resultset.next()){
                    out.println("<tr>");
                    out.println("<td>" + resultset.getString("kode") + " <td>");
                    out.println("<td>" + resultset.getString("nama") + " <td>");
                    out.println("<td>" + resultset.getString("alamat") + " <td>");
                    out.println("<td>" + resultset.getString("nohp") + " <td>");
                    out.println("<td>" + resultset.getString("email") + " <td>");
                    out.println("<td>" + resultset.getString("kontak") + " <td>");
                    out.println("<td>" + resultset.getString("bank") + " <td>");
                    out.println("<td>" + resultset.getString("keterangan") + " <td>");
                    
                }
                out.println("</table");
         }catch(Exception e){
             out.println(e);
         }
         
     }
}
