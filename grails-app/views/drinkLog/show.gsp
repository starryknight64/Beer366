
<%@ page import="beer366.DrinkLog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'drinkLog.label', default: 'DrinkLog')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-drinkLog" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.rating.label" default="Rating" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: drinkLogInstance, field: "rating")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.servingSize.label" default="Size" /></td>
				
				<td valign="top" class="value"><g:link controller="servingSize" action="show" id="${drinkLogInstance?.servingSize?.id}">${drinkLogInstance?.servingSize?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: drinkLogInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.beer.label" default="Beer" /></td>
				
				<td valign="top" class="value"><g:link controller="beer" action="show" id="${drinkLogInstance?.beer?.id}">${drinkLogInstance?.beer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${drinkLogInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="drinkLog.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${drinkLogInstance?.user?.id}">${drinkLogInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
