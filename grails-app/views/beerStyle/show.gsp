
<%@ page import="beer366.BeerStyle" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'beerStyle.label', default: 'BeerStyle')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
<b:renderBeerStyle style="${beerStyleInstance}"/>
</body>

</html>
