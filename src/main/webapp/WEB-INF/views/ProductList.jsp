<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />

<title>ProductList</title>
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
				<table id="productlist" class="table table-bordered table-responsive">


					<thead>
						<tr>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Product InStock</th>
							<th>Product Price</th>
							<th>Product Category</th>
							<th>Product Supplier</th>
							<th>Product Image</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty productList}">
							<tr>
								<td colspan="10" align="center">No Record Exists</td>
							</tr>
						</c:if>
						<c:forEach items="${productList}" var="prodL">
							<tr>
								<td>${prodL.prodId }</td>
								<td>${prodL.prodName }</td>
								<td>${prodL.prodDesc }</td>
								<td>${prodL.prodStock }</td>
								<td>${prodL.prodPrice }</td>
								<td>${prodL.prodCategory.categoryId }</td>
								<td>${prodL.prodSupplier.supplierId }</td>
								<td><img src="${pageContext.request.contextPath}/resources/image/${prodL.pImage}"
									height="50px" width="50px" /></td>
								<td><a href="<c:url value="/admin/productEdit?id=${prodL.prodId}"/>">Edit</a></td>

								<td><a href="<c:url value="/admin/productDelete/${prodL.prodId}"/>">Delete</a></td>
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