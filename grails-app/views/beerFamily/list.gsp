
<%@ page import="beer366.BeerFamily" %>
<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'beerFamily.label', default: 'BeerFamily')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<g:each in="${beerFamilyInstanceList}">
  <b:renderBeerFamily family="${it}"/>
</g:each>
</body>

</html>
