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
                    <label for="email">User email:</label><br>
                    <input type="text" class="form-control" id="email" placeholder="Enter user email" name="email"><br>
                </div>
                    <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>