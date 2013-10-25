
<%@ page import="beer366.User" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <g:set var="inCurUserCompleteLog" value="${userInstance.username == sec.username().trim()}"/>
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <b:renderDrinkLogsSection user="${userInstance}" name="${inCurUserCompleteLog.toBoolean() ? "My" : "$userInstance\'s"} Logged Drinks" showEditButton="${inCurUserCompleteLog.toBoolean()}" showPerson="${false}" inCompleteLogPage="${true}" />
</body>

</html>
