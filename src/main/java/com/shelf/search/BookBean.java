/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.search;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;

/**
 *
 * @author Lenovo
 */
public class BookBean implements Serializable {

    private Long bookID;
    private String bookname;
    private String author;
    private Float averageRating;
    private String coverpath;
    private Date first_available;
    private HashMap<Integer, Long> totalratings;

    public Date getFirst_available() {
        return first_available;
    }

    public void setFirst_available(Date first_available) {
        this.first_available = first_available;
    }

    public HashMap<Integer, Long> getTotalratings() {
        return totalratings;
    }

    public void setTotalratings(HashMap<Integer, Long> totalratings) {
        this.totalratings = totalratings;
    }

    public long getBookID() {
        return bookID;
    }

    public String getBookname() {
        return bookname;
    }

    public String getAuthor() {
        return author;
    }

    public float getAverageRating() {
        return averageRating;
    }

    public String getCoverpath() {
        return coverpath;
    }

    public void setBookID(Long bookID) {
        this.bookID = bookID;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setAverageRating(float averageRating) {
        this.averageRating = averageRating;
    }

    public void setCoverpath(String coverpath) {
        this.coverpath = coverpath;
    }

}
