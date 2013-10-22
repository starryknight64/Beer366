
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
  <h1>${userInstance}'s Info</h1>
  <hr>
  <h2>User Name</h2>
  <ul>
    <h3>${userInstance}</h3>
    <g:link action="edit" id="${userInstance.id}">Change</g:link>
  </ul>
  <br>
  <h1>Email</h1>
  <ul>
    <h2>${userInstance.email}</h2>
  </ul>
  <br>
  Change Password
</body>

</html>
