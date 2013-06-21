
<%@ page import="com.sample.UserCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userCriteria.label', default: 'UserCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userCriteria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userCriteria">
			
				<g:if test="${userCriteriaInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="userCriteria.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userCriteriaInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="userCriteria.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userCriteriaInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.createdAfter}">
				<li class="fieldcontain">
					<span id="createdAfter-label" class="property-label"><g:message code="userCriteria.createdAfter.label" default="Created After" /></span>
					
						<span class="property-value" aria-labelledby="createdAfter-label"><g:formatDate date="${userCriteriaInstance?.createdAfter}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.createdBefore}">
				<li class="fieldcontain">
					<span id="createdBefore-label" class="property-label"><g:message code="userCriteria.createdBefore.label" default="Created Before" /></span>
					
						<span class="property-value" aria-labelledby="createdBefore-label"><g:formatDate date="${userCriteriaInstance?.createdBefore}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="userCriteria.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userCriteriaInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="userCriteria.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userCriteriaInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.max}">
				<li class="fieldcontain">
					<span id="max-label" class="property-label"><g:message code="userCriteria.max.label" default="Max" /></span>
					
						<span class="property-value" aria-labelledby="max-label"><g:fieldValue bean="${userCriteriaInstance}" field="max"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.offset}">
				<li class="fieldcontain">
					<span id="offset-label" class="property-label"><g:message code="userCriteria.offset.label" default="Offset" /></span>
					
						<span class="property-value" aria-labelledby="offset-label"><g:fieldValue bean="${userCriteriaInstance}" field="offset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="userCriteria.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userCriteriaInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="userCriteria.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${userCriteriaInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userCriteriaInstance?.wishList}">
				<li class="fieldcontain">
					<span id="wishList-label" class="property-label"><g:message code="userCriteria.wishList.label" default="Wish List" /></span>
					
						<g:each in="${userCriteriaInstance.wishList}" var="w">
						<span class="property-value" aria-labelledby="wishList-label"><g:link controller="classified" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userCriteriaInstance?.id}" />
					<g:link class="edit" action="edit" id="${userCriteriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
