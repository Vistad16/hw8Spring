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
           <form:form action="/products/delete" method="delete" modelAttribute="productDto">
                <div class="form-group">
                    <h2>Delete product</h2>
                    <form:label path="name">Enter name of the product you want to delete:</form:label><br>
                    <form:input type="text" class="form-control" id="productName" placeholder="Enter product name" name="productName" path="name"/><form:errors path="name" style="color:red"/><br>
                </div>
                    <input type="submit" value="Delete"/>
           </form:form>
            <c:if test="${not empty errorMessage}">
              <c:forEach items="${errorMessage.errors}" var="error">
                 <p style="color:red">${error}</p>
              </c:forEach>
            </c:if>
        </div>
    </body>
</html>