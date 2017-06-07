<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.err{
color: red;


}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
		<br /> <br />
		<div class="panel-body">
			<!-- Body Content -->
			<div class="container">
				<f:form modelAttribute="user" class="form-horizontal" action="userLogin" method="post">
					<fieldset>

						<!-- Form Name -->
						<legend>Sign Up</legend>
<%-- <f:errors path="*"></f:errors>
 --%>						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="username">Name</label>
							<div class="col-md-4">
								<f:input id="username" path="userName" 
									class="form-control input-md"></f:input> 
									<br/>
									<f:errors path="userName" cssClass="err"></f:errors>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="email">Email
								Address</label>
							<div class="col-md-4">
								<f:input id="email" path="userMailId" 
									class="form-control input-md"></f:input>
									<br/>
									<f:errors path="userMailId" cssClass="err"></f:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="password">Password</label>
							<div class="col-md-4">
								<f:password  path="userPassword" id="password"
									class="form-control input-sm"></f:password> 
									<br/>
									<f:errors path="userPassword" cssClass="err"></f:errors>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 control-label" for="address">Address</label>
							<div class="col-md-4">
								<f:input id="address" path="userAddress" 
									class="form-control input-md"></f:input>
									<br/>
									<f:errors path="userAddress" cssClass="err"></f:errors>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="phone">Mobile
								Phone</label>
							<div class="col-md-4">
								<f:input id="phone" path="userPhoneNo" 
									class="form-control input-md"></f:input> 
									<br/>
								<f:errors path="userPhoneNo" cssClass="err"></f:errors>	
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
				</f:form>
			</div>
		</div>
		<div class="panel-footer">
			<!-- Footer Content -->
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>