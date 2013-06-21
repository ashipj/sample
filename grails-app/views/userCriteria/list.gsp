
<%@ page import="com.sample.UserCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userCriteria.label', default: 'UserCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userCriteria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'userCriteria.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'userCriteria.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="createdAfter" title="${message(code: 'userCriteria.createdAfter.label', default: 'Created After')}" />
					
						<g:sortableColumn property="createdBefore" title="${message(code: 'userCriteria.createdBefore.label', default: 'Created Before')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'userCriteria.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'userCriteria.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userCriteriaInstanceList}" status="i" var="userCriteriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userCriteriaInstance.id}">${fieldValue(bean: userCriteriaInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: userCriteriaInstance, field: "password")}</td>
					
						<td><g:formatDate date="${userCriteriaInstance.createdAfter}" /></td>
					
						<td><g:formatDate date="${userCriteriaInstance.createdBefore}" /></td>
					
						<td><g:formatDate date="${userCriteriaInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${userCriteriaInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userCriteriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
