
<%@ page import="beer366.BeerSubStyle" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beerSubStyle.label', default: 'BeerSubStyle')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <b:renderBeerSubStyle subStyle="${beerSubStyleInstance}"/>
</body>

</html>
