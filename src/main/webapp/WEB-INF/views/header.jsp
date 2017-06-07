<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./">Watch Store</a>

			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="./">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="">Category</a>
						<ul class="dropdown-menu">
							<c:forEach var="catVal" items="${catList}">
								<li><a href="<c:url value="/productCustList?cid=${catVal.categoryId}"/>">${catVal.categoryName}</a></li>
							</c:forEach>
						</ul></li>
					<li><a href="<c:url value="/admin/Adding"/>">Add</a></li>
					

					
					<c:if test="${pageContext.request.userPrincipal.name  == 'admin'}">
						<li><a href="<c:url value="/admin" />">Admin</a></li>
					</c:if>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath}/login"> Login</a></li>
						<li><a href="${pageContext.request.contextPath}/registration"> Register</a></li>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
						<li><a href="<c:url value="/logout" />">Logout</a></li>
						</c:if>
					</ul>
					<!-- <li><a href="registration"> <span
							class="glyphicon  glyphicon-user"></span> Sign Up
					</a></li> -->

				</ul>
			</div>
		</div>
		</nav>
	</div>
</body>
</html>