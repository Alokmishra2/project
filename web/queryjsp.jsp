<%-- 
    Document   : queryjsp
    Created on : 30 Dec, 2021, 1:35:44 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title> 
    </head> 
    <body> 
        <h1>Query</h1> 
        <% 
             String email = request.getParameter("eid"); 
             String Query = request.getParameter("txtQname"); 
 try{ 
   Class.forName("com.mysql.jdbc.Driver"); 
  Connection con = 
DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","hemant"); 
PreparedStatement stmt= con.prepareStatement("select * from data1 where email=?");
stmt.setString(1,email); 
ResultSet rs= stmt.executeQuery(); 
if(rs.next()){     if(email.equals(rs.getString(1))); 
    { 
   Class.forName("com.mysql.jdbc.Driver"); 
  Connection con1 = 
DriverManager.getConnection("jdbc:mysql://localhost:3306/queeryy","root","hemant"); 
PreparedStatement stmt1= con1.prepareStatement("insert into data3 values(?,?)");
stmt1.setString(1,email); 
stmt1.setString(2,Query); 
int rs1= stmt1.executeUpdate(); 
if(rs1==1) {out.println("<h1>~~~Query sent SUCCESSFULLY~~~</h1>"); }
        
    } 
} 
else{  out.println("<h1>email not exist!!!!</h1>"); 
   %> 
   <jsp:include page="index.html"></jsp:include> 
   <% 
} 
}catch(Exception e){out.println(e);} 
   %> 
    </body> 
</html> 

