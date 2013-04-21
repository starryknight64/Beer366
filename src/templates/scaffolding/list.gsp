<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-${domainClass.propertyName}" class="first">

	<table class="table table-bordered table-hover sortable">
		<thead>
			<tr>
			<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && !Collection.isAssignableFrom(it.type) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.eachWithIndex { p, i -> %>
				<th style="white-space:nowrap;"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
			<%   } %>
			</tr>
		</thead>
		<tbody>
		<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
			<tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
			<%  props.eachWithIndex { p, i ->
					if (i == 0) { %>
				<td><g:link action="show" id="\${${propertyName}.id}">\${${propertyName}.${p.name}}</g:link></td>
			<%	  } else {
						if (p.type == Boolean.class || p.type == boolean.class) { %>
				<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
			<%		  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
				<td><g:formatDate format="yyyy-MM-dd" date="\${${propertyName}.${p.name}}" /></td>
			<%		  } else { %>
				<td>\${${propertyName}.${p.name}}</td>
			<%  }   }   } %>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="\${${propertyName}Total}" />
	</div>
</section>

</body>

</html>
