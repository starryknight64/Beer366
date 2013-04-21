
<%@ page import="beer366.ISO_3166_2" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ISO_3166_2.label', default: 'ISO_3166_2')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ISO_3166_2" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_2.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_2Instance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_2.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="ISO_3166_1" action="show" id="${ISO_3166_2Instance?.country?.id}">${ISO_3166_2Instance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ISO_3166_2.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ISO_3166_2Instance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
