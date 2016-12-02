
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
    <div class="signupleft">
        <h1>Sign Up</h1>
        <form action="registration" method="post">
            <table>
                <%String uid=request.getParameter("uid");%>
                <%String password1=request.getParameter("password1");%>
                <%String password2=request.getParameter("password2");%>

                <%if(!(password1.equals(password2)) || uid.equals("")) {%>
                <strong><p style="color:red;">Error: Passwords do not match or fields are blank<br></p></strong>
                <%}%> 
                <%@ page import ="java.sql.*" %>
                <%
                    String user = request.getParameter("uid");    
                    String pwd = request.getParameter("password1");
                    String email = request.getParameter("email");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db",
                            "root", "BlackCat13");
                    Statement st = con.createStatement();
                    //ResultSet rs;
                    String command = "INSERT INTO users (username, password, email, privilege) VALUES ('" + user + "', ' " + pwd + "', '" + email +"', 0)";
                    int i = st.executeUpdate(command);
                    if (i > 0) {
                        session.setAttribute("userid", user);
                        response.sendRedirect("index.jsp");
                       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
                    } else {
                        response.sendRedirect("signup.jsp");
                    }
                %>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="uid"></td>
                    </tr>
                    <tr>
                        <td>NMT Email: </td>
                        <td> <input type="text" name="email"></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="text" name="password1"></td>
                    </tr>
                    <tr>
                        <td>Retype Password: </td>
                        <td><input type="text" name="password2"></td>
                    </tr>
            </table>
            <input type="submit" value="Sign Up">
        </form>
    </div>
</body>
</html>