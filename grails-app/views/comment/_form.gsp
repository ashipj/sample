<%@ page import="com.sample.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'creator', 'error')} ">
	<label for="creator">
		<g:message code="comment.creator.label" default="Creator" />
		
	</label>
	<g:select id="creator" name="creator.id" from="${com.sample.User.list()}" optionKey="id" value="${commentInstance?.creator?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="comment.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="status" type="number" value="${commentInstance.status}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${commentInstance?.text}"/>
</div>

