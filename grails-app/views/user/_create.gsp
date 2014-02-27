<%@ page import="beer366.User" %>



<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
    <label for="firstName" class="control-label"><g:message code="user.firstName.label" default="First Name" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
        <span class="help-inline">${hasErrors(bean: userInstance, field: 'firstName', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
    <label for="lastName" class="control-label"><g:message code="user.lastName.label" default="Last Name" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
        <span class="help-inline">${hasErrors(bean: userInstance, field: 'lastName', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
    <label for="email" class="control-label"><g:message code="user.email.label" default="Email" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:field type="email" name="email" required="" value="${userInstance?.email}"/>
        <span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}"/>
        <span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} ">
    <label for="gender" class="control-label"><g:message code="user.gender.label" default="Gender (M/F)" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:textField name="gender" required="" value="${userInstance?.gender}"/>
        <span class="help-inline">${hasErrors(bean: userInstance, field: 'gender', 'error')}</span>
    </div>
</div>

<g:hiddenField name="password" required="" value="${userInstance?.password}"/>
<g:hiddenField name="accountExpired" value="${userInstance?.accountExpired}" />
<g:hiddenField name="accountLocked" value="${userInstance?.accountLocked}" />
<g:hiddenField name="enabled" value="${userInstance?.enabled}" />
<g:hiddenField name="passwordExpired" value="${userInstance?.passwordExpired}" />

<g:hiddenField name="salt" value="${userInstance?.salt}"/>

