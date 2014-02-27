
<%@ page import="beer366.User" %>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="kickstart" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>

    <body>

        <section id="list-user" class="first">

            <table class="table table-bordered table-hover sortable">
                <thead>
                    <tr>

                        <th class="nowrap"><g:message code="user.username.label" default="Username" /></th>

                        <th class="nowrap"><g:message code="user.email.label" default="Email" /></th>

                        <th class="nowrap"><g:message code="user.firstName.label" default="First Name" /></th>

                        <th class="nowrap"><g:message code="user.lastName.label" default="Last Name" /></th>

                        <th class="nowrap"><g:message code="user.gender.label" default="Gender" /></th>

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${userInstance.id}">${userInstance.username}</g:link></td>

                            <td>${userInstance.email}</td>

                            <td>${userInstance.firstName}</td>

                            <td>${userInstance.lastName}</td>
                            
                            <td>${userInstance.gender}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <bs:paginate total="${userInstanceTotal}" />
            </div>
        </section>

    </body>

</html>
