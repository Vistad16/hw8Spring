<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
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
            <form:form action="/vendors/update" method="put" modelAttribute="vendorDto">
                <div class="form-group">
                    <h2>Update vendor</h2>
                   <form:label path="id">Vendor id:</form:label><br>
                   <form:input type="text" class="form-control" id="vendorId" placeholder="Enter vendor id" name="vendorName" path="id"/><form:errors path="id" style="color:red"/><br>
                </div>
                <div class="form-group">
                    <form:label path="name">Vendor name:</form:label><br>
                    <form:input type="text" class="form-control" id="vendorName" placeholder="Enter new vendor name" name="vendorName" path="name"/><form:errors path="name" style="color:red"/><br>
                </div>
                    <input type="submit" value="Update"/>
           </form:form>
            <c:if test="${not empty errorMessage}">
              <c:forEach items="${errorMessage.errors}" var="error">
                 <p style="color:red">${error}</p>
              </c:forEach>
            </c:if>
        </div>
    </body>
</html>
