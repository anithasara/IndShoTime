
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.outer, .inner {
	display: block;
}

.inner {
	/* specify padding, can be changed while remaining fixed width of .outer */
	padding: 10px;
	margin: 10px 0px;
	background-color: #f2f2f2;
	width: 70%;
	font-family: sans-serif;;
}

.head {
	background-color: #cc3333;
	height: 40px;
	width: 100%;
	margin: 0 0 20px 0;
	border-radius: 5px;
	font-family: Gotham;
	padding-left: 10px;
	color: white;
}

.mytext {
	vertical-align: middle;
	line-height: 40px;
}

#order {
	background-color: #cc3333;
	color: white;
	padding-left: 20px;
	padding-top: 10px;
}

.tbSum th {
	font-size: 20px;
	font-weight: bold;
	font-family: sans-serif;
	background-color: #cc3333;
	color: white;
}

.tbSum td {
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="panel panel-primary">
		<div class="panel-heading">
			<jsp:include page="header.jsp" />
		</div>
		<br> <br>
		<br>
		<br>
		<div class="panel-body">
			<div class="container">
				<form action="${pageContext.request.contextPath}/checkoutAction"
					method="post">
					<div class="row">
						<!-- <div class="col-xs-4 jumbotron"> -->
						<!--1st column-->
						<div class="head">
							<h3>
								<p class="mytext">Customer Details</p>
							</h3>
						</div>

						<div class="outer">
							<div class="well" style="width: 100%">


								<c:set var="srk2" value="0"></c:set>
								<c:forEach var="c" items="${cart}">
									<c:set var="srk2"
										value="${srk2 + c.cartPrice * c.cartQuantity }"></c:set>

								</c:forEach>
								Name: <label id="custname" style="width: 70%">${user.userName}</label><br>
								<br> Email: <label id="emailid" style="width: 70%">${user.userMailId}</label><br>
								<br> Phone: <label id="phoneid" style="width: 70%">${user.userPhoneNo}</label><br>
								<br> Address: <label id="custaddress" style="width: 70%">${user.userAddress}</label><br>
								<br> Total Amount: <label id="total" style="width: 70%">${srk2}</label><br>
								<br> <input type="hidden" name="totalprice" value="${srk2}" />

							</div>
						</div>
						<div class="head">
							<h3>
								<p class="mytext">Payment Details</p>
							</h3>

						</div>
						<div class="outer">
							<div class="well" style="width: 100%">
								<!-- <div class="well" style="width: 100%;"> -->
								Card Number <input id="cardNo" name="cardnumber" type="number"
									class="form-control input-md" required></input> <br /> Name on Card <input
									id="cardName" name="cusName" class="form-control input-md" type="text" required></input>
								<br /> CVC <input id="cardCvc" name="cardCvc" type="number"
									class="form-control input-md" required></input> <br /> <br>
								<div class="form-group">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary">Proceed</button>
								<button type="reset" class="btn btn-primary">Cancel</button>
							</div>
						</div>

							</div>


						</div>
						<!--end of 1st column-->
						<!-- </div> -->
						<!--end of row-->
					</div>
				</form>
				<br>
			</div>
		</div>
		<div class="panel-footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>