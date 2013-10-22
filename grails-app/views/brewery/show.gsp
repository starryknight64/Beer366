
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
<g:link controller="brewery" action="list" params="${[state: breweryInstance.region?.name, city: breweryInstance.city]}">${breweryInstance.city}</g:link>,
<g:if test="${breweryInstance.region}">
  <g:link controller="brewery" action="locations" params="${[state: breweryInstance.region?.name]}">${breweryInstance.region}</g:link>
</g:if>
<g:elseif test="${breweryInstance.country}">
  <g:link controller="brewery" action="locations" params="${[country: breweryInstance.country?.name]}">${breweryInstance.country}</g:link>
</g:elseif>
${breweryInstance.postalCode}<br>
      </address>
    </div>
    <div class="span4">
      <g:if test="${breweryInstance.homepage}">
        <i class="icon-home"></i><g:link url="${breweryInstance.homepage}" target="_blank">Website</g:link>
      </g:if>
    </div>
  </div>

  <p>
${breweryInstance.notes ? "<b>Notes: </b>${breweryInstance.notes}" : ""}
  </p>

<g:set var="breweryBeers" value="${Beer.findAllByBrewery(breweryInstance)}" />
<g:if test="${breweryBeers}">
  <section id="beers">
    <b:renderBeers beers="${breweryBeers}" showStyles="${true}" />
  </section>
</g:if>
</body>
</html>
