
<%@ page import="beer366.BreweryType" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'breweryType.label', default: 'BreweryType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-breweryType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="breweryType.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryTypeInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="breweryType.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: breweryTypeInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
