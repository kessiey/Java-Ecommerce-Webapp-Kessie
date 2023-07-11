package com.learn.entities;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;

@Entity
public class Category {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int CategoryId;
private String CategoryTitle;
private String CategoryDescription;
@OneToMany(mappedBy= "category")
private List<Product> products= new ArrayList<>();
public Category(int categoryId, String categoryTitle, String categoryDescription) {

	this.CategoryId = categoryId;
	this.CategoryTitle = categoryTitle;
	this.CategoryDescription = categoryDescription;
}
public Category(String categoryTitle, String categoryDescription, List<Product> products) {

	this.CategoryTitle = categoryTitle;
	this.CategoryDescription = categoryDescription;
	this.products= products;
}
public Category() {
	
}
public int getCategoryId() {
	return CategoryId;
}
public void setCategoryId(int categoryId) {
	CategoryId = categoryId;
}
public String getCategoryTitle() {
	return CategoryTitle;
}
public void setCategoryTitle(String categoryTitle) {
	CategoryTitle = categoryTitle;
}
public String getCategoryDescription() {
	return CategoryDescription;
}
public void setCategoryDescription(String categoryDescription) {
	CategoryDescription = categoryDescription;
}
@Override
public String toString() {
	return "Category [CategoryId=" + CategoryId + ", CategoryTitle=" + CategoryTitle + ", CategoryDescription="
			+ CategoryDescription + "]";
}


}
