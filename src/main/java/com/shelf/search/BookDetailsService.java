/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.search;

import com.sun.rowset.JdbcRowSetImpl;
import connectionproperties.ConnectionBean;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletContext;

/**
 *
 * @author Lenovo
 */
public class BookDetailsService {

    private final BookBean book;
    HashMap<Integer, Long> totalratings;

    public BookDetailsService() {
        book = new BookBean();
        totalratings = new HashMap<>();
    }

    public BookBean getBookDetails(ServletContext context, String bookID) {
        try {
            ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
            Connection con = conn.getConnection();
            JdbcRowSetImpl rowset = new JdbcRowSetImpl(con);
            rowset.setCommand("SELECT *from book where bookid=" + bookID);
            rowset.execute();
            rowset.absolute(1);
            if (rowset.first()) {
                book.setBookID(rowset.getLong("bookid"));
                book.setBookname(rowset.getString("bookName"));
                book.setAuthor(rowset.getString("author"));
                book.setAverageRating(rowset.getFloat("averageRating"));
                book.setCoverpath(rowset.getString("coverPath"));
                book.setFirst_available(rowset.getDate("firstavailable"));
                rowset.setCommand("SELECT preference,COUNT(*) from taste_preferences where item_id=" + bookID + " GROUP BY preference");
                rowset.execute();
                while (rowset.next()) {
                    totalratings.put(Math.round(rowset.getFloat("preference")), rowset.getLong(2));
                }
                book.setTotalratings(totalratings);
                System.out.println(totalratings);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        System.out.println(book==null);
        return book;

    }

}
