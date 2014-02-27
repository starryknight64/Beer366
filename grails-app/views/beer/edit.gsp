<%@ page import="beer366.Beer" %>
<!doctype html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <meta name="defaultSubStyle" content="${beerInstance.subStyle?.id}" />
    <meta name="baPageURL" content="${beerInstance.beerAdvocateURL()}" />
  <g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
  <link rel="stylesheet" href="${resource(dir: 'js/chosen', file: 'chosen.css')}" type="text/css">
  <g:javascript src="chosen/chosen.jquery.js" />
  <g:javascript src="beer.js" />
  <title><g:message code="default.edit.label" args="[entityName]" /> - ${beerInstance.brewery}: ${beerInstance}</title>
</head>

<body>

  <section id="edit-beer" class="first">

    <g:hasErrors bean="${beerInstance}">
      <div class="alert alert-error">
        <g:renderErrors bean="${beerInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form method="post" class="form-horizontal" >
      <g:hiddenField name="id" value="${beerInstance?.id}" />
      <g:hiddenField name="version" value="${beerInstance?.version}" />
      <fieldset class="form">
        <div class="page-header">
          <h1>Edit Beer</h1>
        </div>
        <g:render template="form"/>
      </fieldset>
      <div class="form-actions">
        <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <sec:ifAnyGranted roles="ROLE_ADMIN">
        	<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </sec:ifAnyGranted>
        <g:link action="show" id="${beerInstance?.id}" class="btn">Cancel</g:link>
      </div>
    </g:form>

  </section>

</body>

</html>
