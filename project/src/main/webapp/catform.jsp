<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
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
  <body>
  <div class="card" style="align: center; padding:50px; padding-right: 130px; padding-left: 130px;margin-top: 67px; margin-left: 400px; margin-right: 400px;">
   
  <h3>Enter Category Information</h3><br>
    <form action="ProductOperationServlet" method="post">
  <div class="mb-3">
  <input type="hidden" name="operation" value="addcategory">
    <label for="exampleInputTitle1" class="form-label"> Category Title</label>
    <input name="catitle" type="text" class="form-control" id="cat-title">
  </div>
  <div class="mb-3">
    <label for="exampleInputDesc1" class="form-label">Category Description</label>
    <input name="cadesc" type="text" class="form-control" id="cat-desc">
  </div>
  <button type="submit" class="btn btn-primary" style="color: white; background-color: red; border-color: red;   font-family: Fantasy, Copperplate; font-size: 20px; ">Submit</button>
</form>
</div>
</body>

</html>