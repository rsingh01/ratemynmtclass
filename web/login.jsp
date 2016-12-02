
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" type="text/css" href="deptstyle.css">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <ul>
        <li><a class="active" href="index.html">Home</a></li>
        <li><a href="depts.html">Department/Classes</a></li>
        <li><a href="login.html">Login/Sign Up</a></li>
        <li><a href="buysell.html">Buy/Sell</a></li>
        <li><a href="contact.html">Contact</a></li>
    </ul>
    <div class="signupright">
        <h1>Login</h1>
        <form action="login_check" method="post">
            <table>
                <%String uid=request.getParameter("uid");%>
                    
                <%if(uid.equals("")) {%>
                <strong><p style="color:red;">Error: missing fields <br></p></strong>
                <%}%> 
                
                <%@ page import ="java.sql.*" %>
                <%
                    String userid = request.getParameter("uid");    
                    String pwd = request.getParameter("password");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db",
                            "root", "BlackCat13");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
                    if (rs.next()) {
                        session.setAttribute("userid", userid);
                        response.sendRedirect("index.jsp");
                        //out.println("<a href='logout.jsp'>Log out</a>");
                    } else {
                        out.println("Invalid password <a href='login.jsp'>try again</a>");
                    }
                %>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="uid"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="password"></td>
                </tr>
            </table>
            <input type="submit" value="Login">
        </form>
    </div>
    <a href='createAccount.html'>Create account here</a>
</body>
</html>