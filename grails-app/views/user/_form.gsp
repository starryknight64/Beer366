<%@ page import="beer366.User" %>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
  <label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
  <div class="controls">
    <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}"/>
    <span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
  </div>
</div>
