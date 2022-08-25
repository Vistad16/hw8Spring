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
            <form action="/vendors/name/">
                <div class="form-group">
                    <h2>Find by name</h2>
                    <label for="name">Find vendor by name:</label><br>
                    <input type="text" class="form-control" id="vendorName" placeholder="Enter vendor name" name="name"><br>
                </div>
                    <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>