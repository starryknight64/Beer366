
<%@ page import="beer366.Beer" %>
<%@ page import="beer366.DrinkLog" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
  <h1><g:link controller="beer" action="show" id="${beerInstance.id}">${beerInstance}</g:link></h1>
  <hr>
  <div class="btn-group">
    <g:link class="btn" controller="drinkLog" action="create" id="${beerInstance.id}"><i class="icon-plus"></i> Log This</g:link>
    <g:link class="btn" controller="cellar" action="create" id="${beerInstance.id}"><i class="icon-calendar"></i> Add to My Cellar</g:link>
    <g:link class="btn" controller="beer" action="edit" id="${beerInstance.id}"><i class="icon-pencil"></i> Edit Beer</g:link>
  </div>

  <div class="row">
    <div class="span4">
      <h3>Brewed By</h3>
      <g:link controller="brewery" action="show" id="${beerInstance.brewery.id}">${beerInstance.brewery.fullName}</g:link>
      <address>
        <g:link controller="brewery" action="list" params="${[city: beerInstance.brewery.city]}">${beerInstance.brewery.city}</g:link><g:if test="${beerInstance.brewery.region}">, <g:link controller="brewery" action="list" params="${[state: beerInstance.brewery.region]}">${beerInstance.brewery.region}</g:link></g:if><g:if test="${beerInstance.brewery.country}">, <g:link controller="brewery" action="list" params="${[country: beerInstance.brewery.country]}">${beerInstance.brewery.country}</g:link></g:if>
      </address>
    </div>
    <div class="span4">
      <h3>Style</h3>
      <g:link controller="beerSubStyle" action="show" id="${beerInstance.subStyle.id}">${beerInstance.subStyle}</g:link>
      <g:if test="${beerInstance.abv}">
        (<b:formatABV abv="${beerInstance.abv}" /> ABV)
      </g:if>
    </div>
    <div class="span4">
      <h3>Ratings</h3>
      <p><b>BA:</b>
      <g:if test="${beerInstance.baPage}">
        <a href="${beerInstance.beerAdvocateURL()}" target="_blank">${beerInstance.baRating ?: "N/A"}<i class="icon-share-alt"></i></a></p>
      </g:if>
      <g:elseif test="${beerInstance.baRating}">
        ${beerInstance.baRating}
      </g:elseif>
      <g:else>
        N/A
      </g:else>
      <p><b>Beer366:</b> <g:formatNumber number="${beerInstance.averageRating()}" format="0.00" /></p>
    </div>
  </div>
<p>
${beerInstance.notes ? "<b>Notes: </b>${beerInstance.notes}" : ""}
</p>
<b:renderDrinkLogsSection logs="${DrinkLog.findAllByBeer( beerInstance )}" name="Logged Drinks" inBeerPage="${true}" showPerson="${true}" />
</body>

</html>
