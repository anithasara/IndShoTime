
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
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
<style>
.vertical-align {
	letter-spacing: -4px;
	font-size: 0;
}

.vertical-align .col-xs-4 {
	vertical-align: middle;
	display: inline-block;
	letter-spacing: 0;
	font-size: 14px;
	float: none;
}
</style>
<body>
	
			<!-- Header Content -->
			<jsp:include page="header.jsp" />
		
			<!-- Body Content -->
			<div class="container">
				<br> <br> <br> <br>
				<div id="carousel1" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel1" data-slide-to="0" class="active"></li>
						<li data-target="#carousel1" data-slide-to="1"></li>
						<li data-target="#carousel1" data-slide-to="2"></li>
						<li data-target="#carousel1" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img style="width: 100%;"
								src="./resources/image/ff4.jpg">
						</div>

						<div class="item">
							<img src="./resources/image/ff3.jpg"
								style="width: 100%;">
						</div>

						<div class="item">
							<img src="./resources/image/ff2.jpg"
								style="width: 100%;">
						</div>
						<div class="item">
							<img src="./resources/image/f1.jpg"
								style="width: 100%;">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#carousel1"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel1"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div></div>
			<br>
			<div class="container">
				<div class="jumbotron">
					<div class="row vertical-align">
						<div class="col-xs-4">
							<!-- <a href="productDetails.jsp" title=""> -->
							<img
								src="./resources/image/images.jpg" >
						</div>
						<div class="col-xs-4">
							<img
								src="./resources/image/images2.jpg" >
						</div>
						<div class="col-xs-4">
							<img
								src="./resources/image/images3.jpg" >
						</div>
					</div>
				</div>
			</div>
		
			<jsp:include page="footer.jsp" />
		
</body>
</html>

</body>
</html>
