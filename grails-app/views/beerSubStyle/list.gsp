
<%@ page import="beer366.BeerSubStyle" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'beerSubStyle.label', default: 'BeerSubStyle')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-beerSubStyle" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'beerSubStyle.name.label', default: 'Name')}" />
			
				<th><g:message code="beerSubStyle.style.label" default="Style" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${beerSubStyleInstanceList}" status="i" var="beerSubStyleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${beerSubStyleInstance.id}">${fieldValue(bean: beerSubStyleInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: beerSubStyleInstance, field: "style")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${beerSubStyleInstanceTotal}" />
	</div>
</section>

</body>

</html>
