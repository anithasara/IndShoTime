<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<div class="row">
   <div class="col-xs-4 item-photo">
                    <img style="max-width:100%; margin-top: 30px;" src="${pageContext.request.contextPath}/resources/image/${product.pImage}" />
                </div>
                <div class="col-xs-5" style="border:0px solid gray">
                 
                    <h3>${product.prodName}</h3>
                    <h4> ${product.prodDesc}</h4>    

             <h4>Price - ${product.prodPrice} Rs.</h4>
             <h5>Supplier - ${product.prodSupplier.supplierName}</h5>
                   
    

                    <div class="section" style="padding-bottom:20px;">
                    
                     <form action="${pageContext.request.contextPath}/addingCart" method="post">
                                <input type="hidden" value="${product.prodId}" name="cartpid"/>
                                <input type="hidden" value="${product.prodPrice}" name="cartprice"/>
                                <input type="hidden" value="${product.pImage}" name="cartImage"/>
                                <input type="hidden" value="${product.prodName}" name="cartProdName"/>
                                   <input type="number" class="form-control" name="cartquant"  required/><br>
                                <input class="btn btn-primary btn-lg" type="submit" value="AddToCart">
                            </form>
                      
                    </div>
             </div>                              

                
</div>
</div>
</div>
<br>
<div class="panel-footer">
            <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
​</div>
</div>
</body>
</html>