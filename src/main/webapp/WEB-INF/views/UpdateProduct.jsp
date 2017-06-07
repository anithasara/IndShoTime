<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditCategory</title>
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
			<!-- Header Content -->
			<jsp:include page="header.jsp" />
		</div>
		<br> <br>
		<div class="panel-body">
			<div class="container">
				<form class="form-horizontal" action="updateProduct" method="post"
					enctype="multipart/form-data">
					<fieldset>

						<legend>Edit Product</legend>
						<div class="form-group">
							<label class="col-md-4 control-label" for="fn">Product Id</label>
							<div class="col-md-4">
								<input id="pid" name="pid" type="text"
									value='${eproduct.prodId}'>

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								Name</label>
							<div class="col-md-4">
								<input id="pname" name="pname" type="text"
									value='${eproduct.prodName}'>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								Description</label>
							<div class="col-md-4">
								<input id="pname" name="pdescp" type="text"
									value='${eproduct.prodDesc}'>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								In Stock</label>
							<div class="col-md-4">
								<input id="pname" name="pinstock" type="text"
									value='${eproduct.prodStock}'>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								Price</label>
							<div class="col-md-4">
								<input id="pprice" name="pprice" type="text"
									value='${eproduct.prodPrice}'>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								Category</label>
							<div class="col-md-4">
								<select name="categoryitems" id="categoryitems"
									style="width: 150px;">
									<option selected="selected"></option>
									<c:forEach items="${ecategories}" var="cat">

										<option value="${cat.categoryId}">${cat.categoryName}</option>

									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="ln">Product
								Supplier</label>
							<div class="col-md-4">
								<select name="supplieritems" id="supplieritems"
									style="width: 150px;">
									<option selected="selected"></option>
									<c:forEach items="${esuppliers}" var="sup">

										<option value="${sup.supplierId}">${sup.supplierName}</option>

									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">

							<label class="col-md-4 control-label" for="productImage">Upload
								Picture </label> <input name="file" id="fileToUpload" type="file" />



						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary">Update</button>
								<button type="reset" class="btn btn-primary">Cancel</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>