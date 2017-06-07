<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<!-- Header Content -->
			<jsp:include page="header.jsp" />
		</div>
		<br> <br>
		<div class="panel-body">
			<div class="container">
				<h1>Product List</h1>
				<table id="productcustlist" class="table table-bordered">


					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Product Price</th>


							<th>Product Category</th>
							<th>Product Supplier</th>
							<th>Product Image</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty custProducts}">
							<tr>
								<td colspan="7" align="center">No Record Exists</td>
							</tr>
						</c:if>
						<c:forEach items="${custProducts}" var="prodC">
							<tr>
								<td>${prodC.prodId }</td>
								<td>${prodC.prodName }</td>
								<td>${prodC.prodDesc }</td>
								
								<td>${prodC.prodPrice }</td>
								<td>${prodC.prodCategory.categoryName }</td>
								<td>${prodC.prodSupplier.supplierName }</td>
								<td>
								<a href="${pageContext.request.contextPath}/productDetail/${prodC.prodId}">
								<img
									src="${pageContext.request.contextPath}/resources/image/${prodC.pImage}"
									height="35px" width="35px" /></a></td>


							</tr>


						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>

		<div class="panel-footer">

			<!-- Footer Content -->
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>