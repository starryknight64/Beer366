
<%@ page import="beer366.Continent" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'continent.label', default: 'Continent')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-continent" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'continent.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'continent.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${continentInstanceList}" status="i" var="continentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${continentInstance.id}">${fieldValue(bean: continentInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: continentInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${continentInstanceTotal}" />
	</div>
</section>

</body>

</html>
