
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
  <h1>${breweryInstance} <small>${breweryInstance.fullName}</small></h1>
  <hr>
  <div class="btn-group">
    <g:link class="btn" controller="beer" action="create" breweryid="${breweryInstance.id}"><i class="icon-plus"></i> Add Beer</g:link>
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
    <b>Notes: </b> ${breweryInstance.notes ?: ""}
  </p>

  <g:set var="breweryBeers" value="${Beer.findAllByBrewery(breweryInstance)}" />
  <g:if test="${breweryBeers}">
    <section id="beers">
      <h2>Beers</h2>

      <table class="table table-bordered sortable">
        <thead>
          <tr>
            <th><g:message code="brewery.beer.name.label" /></th>
        <th><g:message code="brewery.beer.style.label" /></th>
        <th><g:message code="brewery.beer.abv.label" /></th>
        <th><g:message code="brewery.beer.baRating.label" /></th>
        <th><g:message code="brewery.beer.ivehad.label" /></th>
        </tr>
        </thead>
        <tbody>
        <g:set var="currentUser" value="${User.get( sec.loggedInUserInfo(field:'id').toInteger() )}" />
        <g:each in="${breweryBeers}">
          <tr>
            <td><g:link controller="Beer" action="show" id="${it.id}" >${it}</g:link></td>
            <td><g:link controller="BeerSubStyle" action="show" id="${it.subStyle.id}" >${it.subStyle}</g:link></td>
            <td><b:formatABV abv="${it.abv}" /></td>
            <td>${it.baRating ?: "-"}</td>
            <td>${it.hasUserLogged(currentUser)}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </section>
  </g:if>
</body>
</html>
