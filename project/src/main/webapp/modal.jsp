<%@page import="com.google.gson.Gson"%>
<%@page import="com.learn.entities.Product"%>
<%@page import="java.util.List"%>  
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
</head>
<style>
body{
overflow-x: hidden;

}
#cart:hover{
background-color: red;
color: white;
}
#categories:hover{
color: red;
}
#navigation{
background-color: red;
color: white;
}
#books{
font-family: Fantasy, Copperplate; 
color: white; 
font-size: 44px;
}
 .nav-item{
 font-family: Fantasy, Copperplate; 
color: white;
font-size: 27px;
}
.nav-link{

}
.mb-3{
width: 100%;
}
th, td{
font-size: 20px;
}
#first{
margin-right: 50px;
}
@media print {
    /* Define print-specific styles here */
    #card1 {
      padding:200px;
      font-size: 12pt;
      /* Add any other styles as needed */
    }
  }


</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: red;">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp" id="books">MyBooks</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp" style="color: white;">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="commonfile.jsp">Register</a>
        </li>

      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit" style="color:white;font-family: Fantasy, Copperplate; border-color: white;">Search</button>
      </form>
    </div>
  </div>
</nav>
<%
// Retrieve the cartItems and totalPrice from the URL parameters
String cartItemsJson = request.getParameter("cartItems");
String totalPriceValue = request.getParameter("totalPrice");

// Convert the JSON string back to a JavaScript object
String script = "<script>var cartItems = " + cartItemsJson + "; var totalPrice = " + totalPriceValue + ";</script>";
out.println(script);
%>
<div class="card"style="align: center; padding:50px; padding-right: 130px; padding-left: 130px;margin-top: 10px; margin-bottom: 50px; margin-left: 400px; margin-right: 400px;">

    <h2> Your Order</h2>
<script src="index.jsp"></script>
<script> displayCartItems();</script>
    <table>
        <thead>
            <tr>
                <th id="first" style="padding-right: 10px;">Title</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
        </thead>
       <tbody>
            <script>
                // Loop through the cartItems and dynamically render the rows in the table
                for (var i = 0; i < cartItems.length; i++) {
                    document.write("<tr>");
                    document.write("<td>" + cartItems[i].title + "</td>");
                    document.write("<td>" + cartItems[i].price + "</td>");
                    document.write("<td>" + cartItems[i].quantity + "</td>");
                    document.write("</tr>");
                }
                document.write("<tr>");
                document.write("<td><strong>Total Price:</strong></td>");
                document.write("<td colspan='2'>" + totalPrice.toFixed(2) + "</td>");
                document.write("</tr>");
            </script>
        </tbody>
    </table>

<form action="index.jsp" method="post">
<br>
        <button type="submit" style="background-color: red; color: white; border-color: red; font-size: 20px;">Return to Home Page</button>
        <button type="submit" style="background-color: red; color: white; border-color: red; font-size: 20px;" onclick="printElement()" >Print Reciept</button>
    
    </form>
 </div> 
 <script>
 function printElement() {
	  
	    window.print();
	  }
 </script>      
</body>
</html>