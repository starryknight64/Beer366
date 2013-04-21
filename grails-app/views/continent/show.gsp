
<%@ page import="beer366.Continent" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'continent.label', default: 'Continent')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-continent" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="continent.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: continentInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="continent.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: continentInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
