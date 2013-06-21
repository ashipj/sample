
<%@ page import="com.sample.Classified" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classified.label', default: 'Classified')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-classified" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-classified" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="heading" title="${message(code: 'classified.heading.label', default: 'Heading')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'classified.description.label', default: 'Description')}" />
					
						<th><g:message code="classified.creator.label" default="Creator" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'classified.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'classified.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'classified.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classifiedInstanceList}" status="i" var="classifiedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classifiedInstance.id}">${fieldValue(bean: classifiedInstance, field: "heading")}</g:link></td>
					
						<td>${fieldValue(bean: classifiedInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: classifiedInstance, field: "creator")}</td>
					
						<td><g:formatDate date="${classifiedInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${classifiedInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: classifiedInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classifiedInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
