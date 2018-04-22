/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.search;

import connectionproperties.ConnectionBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Satish
 */
public class searchResult {

    public String lookUP(String search,ServletContext context) {
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String finalresult = "";
        boolean hasnext = false;
        ArrayList<String> resultList = new ArrayList<String>();
        try {
            ConnectionBean conn = (ConnectionBean) context.getAttribute("db");
            con=conn.getConnection();
            statement = con.createStatement();
            System.out.println("connection is successful");
            String sqlQuery = "SELECT bookname FROM book WHERE bookName LIKE '%" + search + "%'";
            resultSet = statement.executeQuery(sqlQuery);
            System.out.println("Query executed");
                    
            //hasnext = resultSet.next();
            System.out.println(hasnext);
            while (resultSet.next()) {
                //System.out.println("hello");
                String r = resultSet.getString(1);
               // context.setAttribute("re", r);
                System.out.println(r);
                resultList.add(r);
            }
            context.setAttribute("searchresult", resultList);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return "found";
//        if(hasnext)
//        {
//         return "FOUND";   
//        }else
//        {
//            return "NO RESULTS FOUND";
//        }
    }

}
