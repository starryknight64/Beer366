<%@ page import="beer366.Role" %>



			<div class="control-group fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
				<label for="authority" class="control-label"><g:message code="role.authority.label" default="Authority" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="authority" required="" value="${roleInstance?.authority}"/>
					<span class="help-inline">${hasErrors(bean: roleInstance, field: 'authority', 'error')}</span>
				</div>
			</div>

