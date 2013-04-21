<%@ page import="beer366.ServingSize" %>



			<div class="control-group fieldcontain ${hasErrors(bean: servingSizeInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="servingSize.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${servingSizeInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: servingSizeInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: servingSizeInstance, field: 'ml', 'error')} required">
				<label for="ml" class="control-label"><g:message code="servingSize.ml.label" default="Ml" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="ml" min="1" required="" value="${servingSizeInstance.ml}"/>
					<span class="help-inline">${hasErrors(bean: servingSizeInstance, field: 'ml', 'error')}</span>
				</div>
			</div>

