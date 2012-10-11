package com.netbiscuits.mvcdemo.db;

import java.util.ArrayList;
import java.util.Collection;

import com.netbiscuits.mvcdemo.model.Book;

public class Database {
    private static ArrayList<Book> books = new ArrayList<Book>();
    
    public static Collection<Book> getBooks() {
        if (books.isEmpty()) {
            books.add(new Book("1", "Java for Dummies", "John Smith", "$12.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("2", "The Origin of the Species", "Charles Darwin", "$15.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("3", "Hilarious Jokes", "Brett Funny", "$19.99", false, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("4", "A History of Television", "Dave Roberts", "$6.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("5", "You Can Speak Maori", "Rob Jordan", "$5.99", false, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("6", "Toast: Volume 1", "Keith James", "$6.00", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("7", "Quick Guide to Netbiscuits", "John Doe", "$1.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("8", "Software Testing Recipes", "Adam Jones", "$16.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("9", "European Cars 1959-81", "Colin Chapman", "$22.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
            books.add(new Book("10", "Mobile Web Programming", "Steve Touch", "$15.99", true, "http://placehold.it/300x300/FF0000/FFFFFF&text=TEST"));
        }
        return books;
    }
    
    public static Book getBookById(String id) {
        if (id != null && id.length() > 0) {
            for (Book b: getBooks()) {
                if (id.equals(b.getId())) {
                    return b;
                }
            }
        }
        return null;
    }
}
