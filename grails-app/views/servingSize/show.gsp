
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'servingSize.label', default: 'ServingSize')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-servingSize" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="servingSize.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: servingSizeInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="servingSize.ml.label" default="Ml" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: servingSizeInstance, field: "ml")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
