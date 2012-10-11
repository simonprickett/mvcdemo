package com.netbiscuits.mvcdemo.model;

public class Book {
    private String id = null;
    private String title = null;
    private String author = null;
    private String price = null;
    private boolean inStock = false;
    private String thumbnailUrl = null;
      
    public Book() {
    }
    
    public Book(String id, String title, String author, String price, boolean inStock, String thumbnailUrl) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.inStock = inStock;
        this.thumbnailUrl = thumbnailUrl;
    }
    
    public String getId() {
        return id;
    }
    
    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getPrice() {
        return price;
    }

    public boolean isInStock() {
        return inStock;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }
}
