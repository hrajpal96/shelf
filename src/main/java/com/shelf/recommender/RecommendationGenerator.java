/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shelf.recommender;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.CachingUserNeighborhood;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
/**
 *
 * @author Lenovo
 */
public class RecommendationGenerator implements Runnable {
    
    private final Thread generator;
    private final HttpSession session;
    private DataModel dataModel;
    private final Integer USER_ID;
    DataSource tasteDS;
    private List<RecommendedItem> list = null;
    private UserNeighborhood neighborhood = null;
    
    public RecommendationGenerator(HttpSession session, DataSource tasteDS) {
        System.out.println("Inside Recommendation Generator");
        System.out.println(tasteDS);
        this.session = session;
        this.tasteDS = tasteDS;
//        UserBean user = (UserBean) session.getAttribute("user");
        USER_ID = (Integer) session.getAttribute("uid");
//        System.out.println("UserID: " + user.getUID());
        generator = new Thread(this);
        generator.setPriority(Thread.MAX_PRIORITY);
//        this.context.setAttribute("", new PrimeDetails());
        this.session.setAttribute("continue", true);
    }
    
    @Override
    public void run() {
        do {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                dataModel = new ReloadFromJDBCDataModel(new MySQLJDBCDataModel(tasteDS, "shelf.taste_preferences", "user_id", "item_id", "preference", null));
                UserSimilarity similarity = new LogLikelihoodSimilarity(dataModel);
                neighborhood = new NearestNUserNeighborhood(5, similarity, dataModel);
                CachingUserNeighborhood userneighborhood = new CachingUserNeighborhood(neighborhood, dataModel);
                Recommender recommender = new GenericUserBasedRecommender(dataModel, userneighborhood, similarity);
                list = recommender.recommend(USER_ID, 10);
                if (list != null) {
                    System.out.println("List is not empty...Generated Recommendations");
                    session.setAttribute("Recommendations", list);
                    session.setAttribute("ratedItems", dataModel.getItemIDsFromUser(USER_ID));
                    System.out.println(list);
                }
            } catch (TasteException | ClassNotFoundException ex) {
                Logger.getLogger(RecommendationGenerator.class.getName()).log(Level.SEVERE, null, ex);
            }
        } while (list == null);
        
//        }

        //            while (iter.hasNext()) {
        //                RecommendedItem item = iter.next();
        ////                out.println("<tr><td>" + item.getItemID() + "</td><td>" + item.getValue() + "</td></tr>");
        //            }
    }
    
    private List<RecommendedItem> returnList() {
        return list;
        
    }
    
}
