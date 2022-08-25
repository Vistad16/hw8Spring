<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
         <c:import url="${contextPath}/WEB-INF/html/header.jsp"/>
    </head>

    <body>
        <c:import url="${contextPath}/WEB-INF/html/navibar.jsp"/>
        <div class="container">
            <form:form action="/users/delete" modelAttribute="userForm" method="delete">
                <div class="form-group">
                    <h2>Delete user</h2>
                    <form:label path="id">Enter user id you want to delete:</form:label><br>
                    <form:input type="text" class="form-control" id="id" placeholder="Enter id" name="id" path="id"/><form:errors path="id" style="color:red"/><br>
                </div>
                    <input type="submit" value="Submit"/>
           </form:form>
            <c:if test="${not empty errorMessage}">
              <c:forEach items="${errorMessage.errors}" var="error">
                 <p style="color:red">${error}</p>
              </c:forEach>
            </c:if>
        </div>
    </body>
</html>