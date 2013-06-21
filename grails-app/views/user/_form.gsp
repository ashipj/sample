<%@ page import="com.sample.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="16" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="16" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="user.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="status" type="number" value="${userInstance.status}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'wishList', 'error')} ">
	<label for="wishList">
		<g:message code="user.wishList.label" default="Wish List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.wishList?}" var="w">
    <li><g:link controller="classified" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classified" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classified.label', default: 'Classified')])}</g:link>
</li>
</ul>

</div>

