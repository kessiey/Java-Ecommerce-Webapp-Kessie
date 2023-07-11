package com.learn.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.learn.Dao.CategoryDao;
import com.learn.Dao.ProductDao;
import com.learn.entities.Category;
import com.learn.entities.Product;
import com.learn.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ProductOperationServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String op = request.getParameter("operation");
		if(op.trim().equals("addcategory")){
			String title= request.getParameter("catitle");
			String description= request.getParameter("cadesc");
           Category category= new Category();
           category.setCategoryTitle(title);
           category.setCategoryDescription(description);
         CategoryDao categorydao=  new CategoryDao(FactoryProvider.getFactory());
          int catId=  categorydao.saveCategory(category);
          System.out.println("Saved " +catId);
		}else if (op.trim().equals("addproduct")){
			String pName= request.getParameter("ptitle");
			String pDesc= request.getParameter("pdesc");
	         int  pPrice= Integer.parseInt(request.getParameter("pprice"));
			int pDisc= Integer.parseInt(request.getParameter("pdisc"));
			int pQuant= Integer.parseInt(request.getParameter("pquantity"));
			int catId= Integer.parseInt(request.getParameter("pcat"));
            Part part= request.getPart("pphoto");
            Product p= new Product();
            p.setpName(pName);
            p.setpDesc(pDesc);
            p.setpPrice(pPrice);
            p.setpDiscount(pDisc);
            p.setpQuantity(pQuant);
            p.setpPhoto(part.getSubmittedFileName());
            CategoryDao catdao= new CategoryDao(FactoryProvider.getFactory());
            Category category= catdao.getCategoryById(catId);
            p.setCategory(category);
            
            
            ProductDao productdao= new ProductDao(FactoryProvider.getFactory());
            productdao.saveProduct(p);
            String path=request.getServletContext().getRealPath("image")+File.separator+part.getSubmittedFileName();
        System.out.println(path);
        FileOutputStream fos= new FileOutputStream(path);
        InputStream is= part.getInputStream();
        byte[]data= new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();
        response.sendRedirect("productform.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
