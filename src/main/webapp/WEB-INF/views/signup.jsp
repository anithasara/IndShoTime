<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/validation.js"></script>
</head>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<!-- Header Content -->
			<jsp:include page="header.jsp" />
		</div>
		<br /> <br />
		<div class="panel-body">
			<!-- Body Content -->
			<div class="container">
				<form class="form-horizontal" action="userLogin" method="post"
					onsubmit="return validate()">
					<fieldset>

						<!-- Form Name -->
						<legend>Sign Up</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="username">Name</label>
							<div class="col-md-4">
								<input id="username" name="username" type="text"
									class="form-control input-md"> <font id="NameError"
									style="color: red;"> </font>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="email">Email
								Address</label>
							<div class="col-md-4">
								<input id="email" name="useremail" type="email"
									class="form-control input-md">

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="password">Password</label>
							<div class="col-md-4">
								<input type="password" name="userpassword" id="password"
									class="form-control input-sm"> <font
									id="passwordError" style="color: red;"> </font>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="password">Confirm
								Password</label>
							<div class="col-md-4">
								<input type="password" name="password_confirmation"
									id="password_confirmation" class="form-control input-sm">
								<font id="confirmPassError" style="color: red;"> </font>
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="address">Address</label>
							<div class="col-md-4">
								<input id="address" name="useraddress" type="text"
									class="form-control input-md">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="phone">Mobile
								Phone</label>
							<div class="col-md-4">
								<input id="phone" name="userphone" type="text"
									class="form-control input-md"> <font id="contactError"
									style="color: red;"> </font>
							</div>
						</div>


						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary">Register</button>
								<button type="reset" class="btn btn-primary">Cancel</button>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
		<div class="panel-footer">
			<!-- Footer Content -->
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>