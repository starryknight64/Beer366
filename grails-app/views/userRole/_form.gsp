<%@ page import="beer366.UserRole" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
				<label for="role" class="control-label"><g:message code="userRole.role.label" default="Role" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="role" name="role.id" from="${beer366.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'role', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="userRole.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${beer366.User.list()}" optionKey="id" required="" value="${userRoleInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'user', 'error')}</span>
				</div>
			</div>

