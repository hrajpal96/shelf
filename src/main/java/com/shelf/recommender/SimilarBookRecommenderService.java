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
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.common.RandomUtils;

/**
 *
 * @author Lenovo
 */
public class SimilarBookRecommenderService implements Runnable {

    private final Thread generator;
    private final HttpSession session;
    private DataModel dataModel;
    private final Integer BOOK_ID;
    private final DataSource tasteDS;
    private List<RecommendedItem> list = null;
    private final Integer NO_OF_BOOKS_TO_BE_RECOMMENDED = 5;

    public SimilarBookRecommenderService(HttpSession session, DataSource tasteDS) throws TasteException {
        this.session = session;
        this.tasteDS = tasteDS;
        BOOK_ID = (Integer) session.getAttribute("uid");
        generator = new Thread(this);
        generator.setPriority(Thread.MAX_PRIORITY);
        this.session.setAttribute("continue", true);
    }

    @Override
    public void run() {
        do {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                dataModel = new ReloadFromJDBCDataModel(new MySQLJDBCDataModel(tasteDS, "shelf.taste_preferences", "user_id", "item_id", "preference", null));
                ItemSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);
                Recommender recommender = new GenericItemBasedRecommender(dataModel, similarity);
                CachingRecommender cachingrecommender = new CachingRecommender(recommender);
                list = cachingrecommender.recommend(BOOK_ID, NO_OF_BOOKS_TO_BE_RECOMMENDED);
                if (list != null) {
                    System.out.println(list);
                    session.setAttribute("similarbooks", list);
                }
                RandomUtils.useTestSeed();
                RecommenderEvaluator evaluator = new AverageAbsoluteDifferenceRecommenderEvaluator();
            } catch (TasteException | ClassNotFoundException ex) {
                Logger.getLogger(RecommendationGenerator.class.getName()).log(Level.SEVERE, null, ex);
            }
        } while (list == null);

    }

    private List<RecommendedItem> returnList() {
        return list;

    }

}
