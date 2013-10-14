
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
  <div class="page-header">
      <h1>${userInstance}'s Profile</h1>
  </div>
  <b:renderFivesSection user="${userInstance}" />
  <b:renderStrongestBeersSection user="${userInstance}" />
  <b:renderCellarSection user="${userInstance}" />
  <b:renderRecentActivitySection user="${userInstance}" />
</body>

</html>
