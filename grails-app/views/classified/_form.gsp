<%@ page import="com.sample.Classified" %>



<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'heading', 'error')} required">
	<label for="heading">
		<g:message code="classified.heading.label" default="Heading" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="heading" required="" value="${classifiedInstance?.heading}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="classified.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${classifiedInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'creator', 'error')} ">
	<label for="creator">
		<g:message code="classified.creator.label" default="Creator" />
		
	</label>
	<g:select id="creator" name="creator.id" from="${com.sample.User.list()}" optionKey="id" value="${classifiedInstance?.creator?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'commentList', 'error')} ">
	<label for="commentList">
		<g:message code="classified.commentList.label" default="Comment List" />
		
	</label>
	<g:select name="commentList" from="${com.sample.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${classifiedInstance?.commentList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="classified.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="status" type="number" value="${classifiedInstance.status}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: classifiedInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="classified.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="type" type="number" value="${classifiedInstance.type}" required=""/>
</div>

