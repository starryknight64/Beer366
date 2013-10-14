
<%@ page import="beer366.Beer" %>
<%@ page import="beer366.Brewery" %>
<%@ page import="beer366.User" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'brewery.label', default: 'Brewery')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <h1><g:link controller="beer" action="show" id="${breweryInstance.id}">${breweryInstance}</g:link> <small>${breweryInstance.fullName}</small></h1>
  <hr>
  <div class="btn-group">
    <g:link class="btn" controller="beer" action="create" id="${breweryInstance.id}"><i class="icon-plus"></i> Add Beer</g:link>
    <g:link class="btn" controller="brewery" action="edit" id="${breweryInstance.id}"><i class="icon-pencil"></i> Edit Brewery</g:link>
  </div>

  <div class="row">
    <div class="span4">
      <address>
${breweryInstance.street}<br>
${breweryInstance.city}, ${breweryInstance.region} ${breweryInstance.postalCode}<br>
${breweryInstance.country}
      </address>
    </div>
    <div class="span4">
      <g:if test="${breweryInstance.homepage}">
        <i class="icon-home"></i><g:link url="${breweryInstance.homepage}">Website</g:link>
      </g:if>
    </div>
  </div>

  <p>
${breweryInstance.notes ? "<b>Notes: </b>${breweryInstance.notes}" : ""}
  </p>

<g:set var="breweryBeers" value="${Beer.findAllByBrewery(breweryInstance)}" />
<g:if test="${breweryBeers}">
  <section id="beers">
    <b:renderBeers beers="${breweryBeers}"/>
  </section>
</g:if>
</body>
</html>
