<%@ page import="beer366.User" %>
<!doctype html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="kickstart" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>

    <body>
        <div class="page-header">
            <h1>Edit Info for ${userInstance.username} <small><a class="btn"><i class="icon-pencil"></i> Change Password</a></small></h1>
        </div>
        <section id="edit-user" class="first">

            <g:hasErrors bean="${userInstance}">
                <div class="alert alert-error">
                    <g:renderErrors bean="${userInstance}" as="list" />
                </div>
            </g:hasErrors>

            <g:form method="post" class="form-horizontal" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <fieldset class="form">
                    <g:render template="create"/>
                </fieldset>
                <div class="form-actions">
                    <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <button class="btn" type="reset">Cancel</button>
                </div>
            </g:form>

        </section>

    </body>

</html>
