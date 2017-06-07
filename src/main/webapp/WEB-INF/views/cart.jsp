<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductDetails</title>
<meta charset="utf-8">
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
			<jsp:include page="header.jsp" />
		</div>
		<br>
		<br>
		<div class="panel-body">
			<div class="container">
				<table id="cart" class="table table-hover table-condensed ">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Image</th>
							<th>Total</th>
							<th>Delete</th>
						</tr>
					</thead>


					<tbody>
						<c:if test="${empty cartDetails}">
							<tr>
								<td colspan="9" align="center">No Record Exists</td>
							</tr>
						</c:if>
						<c:forEach var="c" items="${cartDetails}">
							<tr>

								<td><c:out value="${c.cartProdName}"></c:out></td>
								<td><c:out value="${c.cartQuantity}"></c:out></td>
								<td><c:out value="${c.cartPrice}"></c:out></td>





								<td><img
									src="${pageContext.request.contextPath}/resources/image/${c.cartImage}"
									height="50px" width="50px" /></td>

								<td><c:out value="${c.cartQuantity * c.cartPrice}"></c:out></td>
                                <td><a href="<c:url value="/cartDelete/${c.cartId}"/>">Delete</a></td>

							</tr>
						</c:forEach>
                   

					</tbody>
					<tfoot>
						<tr>
							<td><a href="${pageContext.request.contextPath}/home"
								class="btn btn-warning"><i class="fa fa-angle-left"></i>
									Continue Shopping</a></td>

							<td><a
								href="${pageContext.request.contextPath}/checkoutAction"
								class="btn btn-success btn-block">Checkout <i
									class="fa fa-angle-right"></i>
							</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="panel-footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>