<%-- 
    Document   : registrationjsp
    Created on : 28 Dec, 2021, 3:00:14 PM
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
        <h1>Registration</h1> 
        <% 
             String fname = request.getParameter("txtFname"); 
              String lname = request.getParameter("txtLname"); 
            String uname = request.getParameter("txtName"); 
            String pass1 = request.getParameter("pass"); 
            String pass2 = request.getParameter("repass"); 
            String email = request.getParameter("eid"); 
            String phone_no = request.getParameter("pid"); 
             String state = request.getParameter("sta"); 
            String country = request.getParameter("con"); 
            if(pass1.equals(pass2)) 
            {             try 
            { 
                Class.forName("com.mysql.jdbc.Driver"); 
                Connection con = 
                  DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","hemant");
                PreparedStatement stmt = con.prepareStatement("insert into data1 values (?,?,?,?,?,?,?,?)"); 
                stmt.setString(1,fname); 
                stmt.setString(2,lname); 
                stmt.setString(3,uname); 
                stmt.setString(4,pass1); 
                stmt.setString(5,email); 
                stmt.setString(6,phone_no); 
                stmt.setString(7,state); 
                stmt.setString(8,country); 
                int row = stmt.executeUpdate();
                if(row==1) 
                { 
                    out.println("Registration Successfull"); 
                } 
                else 
                { 
                    out.println("Registration fail"); 
                    %><jsp:include page="index.html"/> 
                    <% 
                } 
            } catch(Exception e) 
            { 
                out.println(e); 
            }             }             else 
            { 
                out.println("<h1>password Mismatch</h1>"); 
                %><jsp:include page="index.html"/> 
                <% 
            } 
 
        %> 
    </body> 
	</html> 	 

