<%@page import="com.google.gson.Gson"%>
<%@page import="com.learn.helper.FactoryProvider"%>
<%@page import="com.learn.entities.*"%>
<%@page import="com.learn.entities.Product"%>
<%@page import="java.util.List"%>  
<%@page import="java.util.ArrayList"%>
<%@page import="com.learn.Dao.CategoryDao"%>
<%@page import="com.learn.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@page import="com.learn.helper.Helper"%>


<!DOCTYPE html>
<!-- Website - www.codingnepalweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Responsiive Admin Dashboard | CodingLab</title>
    <link rel="stylesheet" href="styles.css" />  
    <!-- Boxicons CDN Link -->
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
  <%
  CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
  List <Category> clist= cdao.getCategories();
  ProductDao dao= new ProductDao(FactoryProvider.getFactory());
  List <Product>list= dao.getAllProducts();
  
  Map<String, Long> m= Helper.getCounts(FactoryProvider.getFactory());
  %>
    <div class="sidebar">
      <div class="logo-details">
        <i class="bx bxl-c-plus-plus"></i>
        <span class="logo_name">MyBooks</span>
      </div>
      <ul class="nav-links">
        <li>
          <a href="#" class="active">
            <i class="bx bx-grid-alt"></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="productform.jsp">
            <i class="bx bx-box"></i>
            <span class="links_name"> Add/Remove Product</span>
          </a>
        </li>
        <li>
          <a href="catform.jsp">
            <i class="bx bx-list-ul"></i>
            <span class="links_name">Add Categories</span>
          </a>
        </li>
        <li>
          
       
        <li class="log_out">
          <a href="index.jsp" onclick="message()">
            <i class="bx bx-log-out"></i>
            <span class="links_name" >Log out</span>
          </a>
        </li>
      </ul>
    </div>
    <section class="home-section">
      <nav>
        <div class="sidebar-button">
          <i class="bx bx-menu sidebarBtn"></i>
          <span class="dashboard">Dashboard</span>
        </div>
        <div class="search-box">
          <input type="text" placeholder="Search..." />
          <i class="bx bx-search"></i>
        </div>
        <div class="profile-details">
          <span class="admin_name">Hafsa Rafique</span>
          <i class="bx bx-chevron-down"></i>
        </div>
      </nav>
<%
String item1 = request.getParameter("item1");
String item2 = request.getParameter("item2");
String item3 = request.getParameter("item3");
String username = request.getParameter("username");
String email = request.getParameter("email");
String address = request.getParameter("address");
%>
      <div class="home-content">
        <div class="overview-boxes">
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Total Users</div>
              <div class="number"><%=m.get("userCount") %></div>
              <div class="indicator">
                <i class="bx bx-up-arrow-alt"></i>
                <span class="text">Up from yesterday</span>
              </div>
            </div>
            <i class="bx bx-cart-alt cart"></i>
          </div>
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Total Products</div>
              <div class="number"><%=list.size() %></div>
              <div class="indicator">
                <i class="bx bx-up-arrow-alt"></i>
                <span class="text">Up from yesterday</span>
              </div>
            </div>
            <i class="bx bxs-cart-add cart two"></i>
          </div>
         
          <div class="box">
            <div class="right-side">
              <div class="box-topic">Total Categories</div>
              <div class="number"><%=clist.size() %></div>
              <div class="indicator">
                <i class="bx bx-down-arrow-alt down"></i>
                <span class="text">Down From Today</span>
              </div>
            </div>
            <i class="bx bxs-cart-download cart four"></i>
          </div>
        </div>


    <script>
      let sidebar = document.querySelector(".sidebar");
      let sidebarBtn = document.querySelector(".sidebarBtn");
      sidebarBtn.onclick = function () {
        sidebar.classList.toggle("active");
        if (sidebar.classList.contains("active")) {
          sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
        } else sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      };
      
      function message(){
    	  alert("Logged out");
      }
      function loadItemList() {
    	  var xhttp = new XMLHttpRequest();
    	  xhttp.onreadystatechange = function() {
    	    if (this.readyState === 4 && this.status === 200) {
    	      var itemListContainer = document.getElementById("itemListContainer");
    	      itemListContainer.innerHTML = this.responseText;
    	    }
    	  };
    	  xhttp.open("GET", "modal.jsp", true);
    	  xhttp.send();
    	}

    	// Call the loadItemList function when the page loads
    	window.onload = function() {
    	  loadItemList();
    	};

    </script>

  </body>
</html>
