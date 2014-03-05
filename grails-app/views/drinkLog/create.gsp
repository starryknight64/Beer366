<%@ page import="beer366.DrinkLog" %>
<%@ page import="beer366.ServingSize" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <meta name="beer" content="${drinkLogInstance.beer?.id ?: ''}" />
    <meta name="defaultServingSize" content="${ServingSize.defaultSize()?.id ?: ''}" />
  <g:set var="entityName" value="${message(code: 'drinkLog.label', default: 'DrinkLog')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="drinklog.js" />
  <title>Log Drink</title>
</head>

<body>
  <div class="page-header">
    <h1>Log Drink</h1>
  </div>
  <section id="create-drinkLog" class="first">

    <g:hasErrors bean="${drinkLogInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${drinkLogInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal" >
      <g:hiddenField name="cellarID" value="${cellarID}" />
      <g:hiddenField name="cellarBeerChosen" value="${false}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:submitButton name="create" class="btn btn-primary" value="Log Drink" />
        <g:if test="${cellarID}">
          <g:link controller="cellar" action="show" class="btn">Cancel</g:link>
        </g:if>
        <g:else>
          <a href="${createLink(uri: '/')}" class="btn">Cancel</a>
        </g:else>
      </div>
    </g:form>

  </section>

</body>

</html>
