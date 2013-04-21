
<%@ page import="beer366.DrinkLog" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'drinkLog.label', default: 'DrinkLog')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-drinkLog" class="first">

	<table class="table table-bordered table-hover sortable">
		<thead>
			<tr>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.rating.label" default="Rating" /></th>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.size.label" default="Size" /></th>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.notes.label" default="Notes" /></th>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.beer.label" default="Beer" /></th>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.date.label" default="Date" /></th>
			
				<th style="white-space:nowrap;"><g:message code="drinkLog.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${drinkLogInstanceList}" status="i" var="drinkLogInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${drinkLogInstance.id}">${drinkLogInstance.rating}</g:link></td>
			
				<td>${drinkLogInstance.size}</td>
			
				<td>${drinkLogInstance.notes}</td>
			
				<td>${drinkLogInstance.beer}</td>
			
				<td><g:formatDate format="yyyy-MM-dd" date="${drinkLogInstance.date}" /></td>
			
				<td>${drinkLogInstance.user}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${drinkLogInstanceTotal}" />
	</div>
</section>

</body>

</html>
