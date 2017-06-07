<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<meta charset="utf-8" />
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
<style>
.table>tbody>tr>td, .table>tfoot>tr>td {
	vertical-align: middle;
}

@media screen and (max-width: 600px) {
	table#cart tbody td .form-control {
		width: 20%;
		display: inline !important;
	}
	.actions .btn {
		width: 36%;
		margin: 1.5em 0;
	}
	.actions .btn-info {
		float: left;
	}
	.actions .btn-danger {
		float: right;
	}
	table#cart thead {
		display: none;
	}
	table#cart tbody td {
		display: block;
		padding: .6rem;
		min- width: 320px;
	}
	table#cart tbody tr td:first-child {
		background: #333;
		color: #fff;
	}
	table#cart tbody td:before {
		content: attr(data-th);
		font-weight: bold;
		display: inline-block;
		width: 8rem;
	}
	table#cart tfoot 

td {
		display: block;
	}
	table#cart tfoot td .btn {
		display: block;
	}
}
</style>
</head>
<body>
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<img style="max-width: 100%; margin-top: 30px;"
									src="${pageContext.request.contextPath}/resources/${product.imgName}" />
							</div>
							<div class="col-sm-10">
								<h4 class="nomargin">${product.prodDesc}</h4>
								<p>Quis aute iure reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit
									amet.</p>
							</div>
						</div>


					</td>
					<td data-th="Price">$1.99</td>
					<td data-th="Quantity"><input type="number"
						class="form-control text-center" value="1"></td>
					<td data-th="Subtotal" class="text-center">1.99</td>
					<td class="actions" data-th="">
						<button class="btn btn-info btn-sm">
							<i class="fa fa-refresh"></i>
						</button>


						<button class="btn btn-danger btn-sm">
							<i class="fa fa-trash-o"></i>
						</button>


					</td>
				</tr>


			</tbody>
			<tfoot>
				<tr class="visible-xs">
					<td class="text-center"><strong>Total 1.99</strong></td>
				</tr>
				<tr>
					<td><button class="btn btn-default" name="_eventId_ContinueShopping"><i
							class="fa fa-angle-left"></i> Continue Shopping</button></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
					<td><button class="btn btn-default" name="_eventId_Checkout">Checkout
							<i class="fa fa-angle-right"></i>
					</button></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>