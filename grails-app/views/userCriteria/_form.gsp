<%@ page import="com.sample.UserCriteria" %>



<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="userCriteria.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="16" required="" value="${userCriteriaInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="userCriteria.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="16" required="" value="${userCriteriaInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'createdAfter', 'error')} required">
	<label for="createdAfter">
		<g:message code="userCriteria.createdAfter.label" default="Created After" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAfter" precision="day"  value="${userCriteriaInstance?.createdAfter}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'createdBefore', 'error')} required">
	<label for="createdBefore">
		<g:message code="userCriteria.createdBefore.label" default="Created Before" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdBefore" precision="day"  value="${userCriteriaInstance?.createdBefore}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'max', 'error')} required">
	<label for="max">
		<g:message code="userCriteria.max.label" default="Max" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="max" type="number" value="${userCriteriaInstance.max}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'offset', 'error')} required">
	<label for="offset">
		<g:message code="userCriteria.offset.label" default="Offset" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offset" type="number" value="${userCriteriaInstance.offset}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="userCriteria.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="status" type="number" value="${userCriteriaInstance.status}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="userCriteria.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" type="number" value="${userCriteriaInstance.total}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userCriteriaInstance, field: 'wishList', 'error')} ">
	<label for="wishList">
		<g:message code="userCriteria.wishList.label" default="Wish List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userCriteriaInstance?.wishList?}" var="w">
    <li><g:link controller="classified" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classified" action="create" params="['userCriteria.id': userCriteriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classified.label', default: 'Classified')])}</g:link>
</li>
</ul>

</div>

