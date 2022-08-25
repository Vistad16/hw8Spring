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
            <form:form action="/products/" method="post" modelAttribute="productDto">
                <div class="form-group">
                    <h2>Add new vendor</h2>
                    <form:label path="name">Product name:</form:label><br>
                    <form:input type="text" class="form-control" id="productName" placeholder="Enter product name" name="productName" path="name"/><form:errors path="name" style="color:red"/><br>
                    <form:label path="price">Product price:</form:label><br>
                    <form:input type="text" class="form-control" id="price" placeholder="42.14" name="price" path="price"/><form:errors path="price" style="color:red"/><br>
                    <spring:bind path="vendor">Select vendord:
                    <select class="form-control" id="vendor" name="vendor">
                        <c:forEach items="${vendors}" var="vendor">
                            <option value="${vendor}">
                                <c:out value="${vendor.name}"/><br>
                            </option>
                        </c:forEach>
                    </select>
                    </spring:bind>
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