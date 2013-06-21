
<%@ page import="com.sample.Classified" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classified.label', default: 'Classified')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-classified" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-classified" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list classified">
			
				<g:if test="${classifiedInstance?.heading}">
				<li class="fieldcontain">
					<span id="heading-label" class="property-label"><g:message code="classified.heading.label" default="Heading" /></span>
					
						<span class="property-value" aria-labelledby="heading-label"><g:fieldValue bean="${classifiedInstance}" field="heading"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="classified.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${classifiedInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="classified.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="user" action="show" id="${classifiedInstance?.creator?.id}">${classifiedInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.commentList}">
				<li class="fieldcontain">
					<span id="commentList-label" class="property-label"><g:message code="classified.commentList.label" default="Comment List" /></span>
					
						<g:each in="${classifiedInstance.commentList}" var="c">
						<span class="property-value" aria-labelledby="commentList-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="classified.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${classifiedInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="classified.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${classifiedInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="classified.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${classifiedInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classifiedInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="classified.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${classifiedInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${classifiedInstance?.id}" />
					<g:link class="edit" action="edit" id="${classifiedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
