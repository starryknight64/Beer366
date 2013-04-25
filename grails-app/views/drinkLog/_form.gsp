<%@ page import="beer366.DrinkLog" %>



			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'rating', 'error')} ">
				<label for="rating" class="control-label"><g:message code="drinkLog.rating.label" default="Rating" /></label>
				<div class="controls">
					<g:field type="number" name="rating" step="0.01" min="0.0" max="5.0" value="${drinkLogInstance.rating}"/>
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'rating', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'size', 'error')} ">
				<label for="size" class="control-label"><g:message code="drinkLog.size.label" default="Size" /></label>
				<div class="controls">
					<g:select id="size" name="size.id" from="${beer366.ServingSize.list()}" optionKey="id" value="${drinkLogInstance?.size?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'size', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'notes', 'error')} ">
				<label for="notes" class="control-label"><g:message code="drinkLog.notes.label" default="Notes" /></label>
				<div class="controls">
					<g:textArea name="notes" cols="40" rows="5" value="${drinkLogInstance?.notes}"/>
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'notes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'beer', 'error')} required">
				<label for="beer" class="control-label"><g:message code="drinkLog.beer.label" default="Beer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="beer" name="beer.id" from="${beer366.Beer.list()}" optionKey="id" required="" value="${drinkLogInstance?.beer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'beer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="drinkLog.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="date" precision="day"  value="${drinkLogInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: drinkLogInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="drinkLog.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${beer366.User.list()}" optionKey="id" required="" value="${drinkLogInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: drinkLogInstance, field: 'user', 'error')}</span>
				</div>
			</div>
