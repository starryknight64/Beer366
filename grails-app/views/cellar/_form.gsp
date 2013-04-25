<%@ page import="beer366.Cellar" %>



			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'quantity', 'error')} required">
				<label for="quantity" class="control-label"><g:message code="cellar.quantity.label" default="Quantity" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="quantity" min="0" required="" value="${cellarInstance.quantity}"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'quantity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'willTrade', 'error')} ">
				<label for="willTrade" class="control-label"><g:message code="cellar.willTrade.label" default="Will Trade" /></label>
				<div class="controls">
					<g:field type="number" name="willTrade" min="0" value="${cellarInstance.willTrade}"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'willTrade', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'notes', 'error')} ">
				<label for="notes" class="control-label"><g:message code="cellar.notes.label" default="Notes" /></label>
				<div class="controls">
					<g:textArea name="notes" cols="40" rows="5" value="${cellarInstance?.notes}"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'notes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'beer', 'error')} required">
				<label for="beer" class="control-label"><g:message code="cellar.beer.label" default="Beer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="beer" name="beer.id" from="${beer366.Beer.list()}" optionKey="id" required="" value="${cellarInstance?.beer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'beer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'size', 'error')} required">
				<label for="size" class="control-label"><g:message code="cellar.size.label" default="Size" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="size" name="size.id" from="${beer366.ServingSize.list()}" optionKey="id" required="" value="${cellarInstance?.size?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'size', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cellarInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="cellar.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${beer366.User.list()}" optionKey="id" required="" value="${cellarInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: cellarInstance, field: 'user', 'error')}</span>
				</div>
			</div>
