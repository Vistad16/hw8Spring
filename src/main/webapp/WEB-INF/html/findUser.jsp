<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
         <c:import url="${contextPath}/WEB-INF/html/header.jsp"/>
    </head>

    <body>
        <c:import url="${contextPath}/WEB-INF/html/navibar.jsp"/>
        <div class="container">
            <form action="/users/name/">
                 <div class="form-group">
                     <h2>Find by email</h2>
                    <label for="email">Enter mail:</label><br>
                    <input type="text" class="form-control" id="email" placeholder="Enter user email" name="email"><br>
                 </div>
                     <input type="submit" value="Find">
            </form>
                <table class="table table-hover">
                      <thead>
                      <tr>
                          <td>id</td>
                          <td>First Name</td>
                          <td>Last Name</td>
                          <td>Role</td>
                          <td>Email</td>
                      </tr>
                      </thead>
                      <tbody>
                         <c:forEach items="${users}" var="user">
                            <tr>
                               <td>
                                   <c:out value="${user.id}"/>
                               </td>
                               <td>
                                   <c:out value="${user.firstName}"/>
                               </td>
                               <td>
                                   <c:out value="${user.lastName}"/>
                               </td>
                               <td>
                                   <c:out value="${user.role.role}"/>
                               </td>
                               <td>
                                   <c:out value="${user.email}"/>
                               </td>
                            </tr>
                         </c:forEach>
                      </tbody>
                </table>
        </div>
    </body>
</html>
