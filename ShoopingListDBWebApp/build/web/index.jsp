<%-- 
    Document   : index
    Created on : Mar. 18, 2021, 8:10:19 p.m.
    Author     : garba
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <form action="AddItemServlet" method="GET">
            <br>Item <input type="text" name="item"> 
            <input type="submit" name="action" value="Add">
        </form>
        <ol>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/shoppinglistdb", "root", "pass"
                    );
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * from shoppinglistdb.shoppinglist");
                    while (rs.next()) {
            %>
            <li> <%= rs.getString("item")%>
                <form action="DeleteItemServlet" method='GET'>
                    <input type="hidden" name='itemID' value='<%= rs.getInt("itemID")%>'>
                    <input type="submit"  value="Delete">
                    </body>
                </form>
            </li>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("Error Adding Item: " + e);
                }

            %>
        </ol>
</html>
