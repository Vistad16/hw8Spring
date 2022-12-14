<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="utf-8">
     <title>Create an account</title>
     <style>
         <%@include file="/WEB-INF/css/common.css" %>
         <%@include file="/WEB-INF/css/bootstrap.min.css"%>
     </style>
 </head>

 <body>

 <div class="container">
     <form:form method="post" modelAttribute="userForm" class="form-signin" action="/users/registration">
         <h2 class="form-signin-heading">Create account</h2>
         <spring:bind path="firstName">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                 <form:input type="text" path="firstName" class="form-control" placeholder="First name"
                             autofocus="true"></form:input>
                 <form:errors path="firstName"></form:errors>
             </div>
         </spring:bind>

         <spring:bind path="lastName">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                 <form:input type="text" path="lastName" class="form-control" placeholder="Last name"
                             autofocus="true"></form:input>
                 <form:errors path="lastName"></form:errors>
             </div>
         </spring:bind>

         <span>${message}</span>
         <spring:bind path="email">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                 <form:input type="text" path="email" class="form-control" placeholder="Email@mail.com"
                             autofocus="true"></form:input>
                 <form:errors path="email"></form:errors>
             </div>
         </spring:bind>

         <spring:bind path="password">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                 <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                 <form:errors path="password"></form:errors>
             </div>
         </spring:bind>

         <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
     </form:form>
 </div>
 </body>
 </html>
