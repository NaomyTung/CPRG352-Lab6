<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        
    </head>
    <body>

        <div class="container">
            <h1>Naomy's User Management System -- All Users</h1><br><br>
            <div class="row">
                <div class="col">
                    <div class="row">       
                        <h2>Insert User</h2>
                        <form action="User" method="POST">
                             <input type="hidden" name="action" value="add">
                             <input type="text" class="form-control" name="email" id="email" placeholder="Email"> <br>
                              <input type="text" class="form-control" name="fn" id="fn" placeholder="First Name"><br>
                              <input type="text" class="form-control" name="ln" id="ln"  placeholder="Last Name"><br>
                              <input type="password" class="form-control" name="pw" id="pw" placeholder="Password"><br>
                             <button class="btn btn-primary" type="submit">Submit</button>
                         </form>
                    </div>
                    <br><br>
                    <div class="row">       
                        <h2>Delete User</h2>
                        <form action="User" method="POST">
                             <input type="hidden" name="action" value="delete">
                             <span name="message" id="message"></span>
                             <input type="text" class="form-control" name="email" id="email" placeholder="Email"> <br>
                        
                             <button class="btn btn-primary" type="submit">Delete</button>
                         </form>
                    </div><br><br>
                    <div class="row">       
                        <h2>Update Existing User</h2>
                        <form action="User" method="POST">
                             <input type="hidden" name="action" value="update">
                             <input type="text" class="form-control" name="email" id="email" placeholder="Email"> <br>
                              <input type="text" class="form-control" name="fn" id="fn" placeholder="First Name"><br>
                              <input type="text" class="form-control" name="ln" id="ln"  placeholder="Last Name"><br>
                              <input type="password" class="form-control" name="pw" id="pw" placeholder="Password"><br>
                              <input type="number" class="form-control" name="roleid" id="roleid" placeholder="Role ID"><br>
                             <button class="btn btn-primary" type="submit">Update</button>
                         </form>
                    </div>
                    
                            
                </div>
                <div class="col">
                    <h2>All Users</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Active</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Y" : "N"}</td>

                                </tr>
                            </c:forEach>
                            
                        
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        
    </body>
</html>
