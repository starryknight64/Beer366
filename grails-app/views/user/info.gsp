
<%@ page import="beer366.User" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <h1>${userInstance}'s Info <small><g:link action="edit" id="${userInstance.id}">Edit</g:link></small></h1>
  <hr>
  <table class="table table-bordered">
	  <tr><th>First Name</th><td>${userInstance.firstName}</td></tr>
	  <tr><th>Last Name</th><td>${userInstance.lastName}</td></tr>
	  <tr><th>Email</th><td>${userInstance.email}</td></tr>
	  <tr><th>User Name</th><td>${userInstance.username}</td></tr>
	  <tr><th>Gender</th><td>${userInstance.gender}</td></tr>
  </table>
  
</body>

</html>
