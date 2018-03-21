package com.shelf.recommender;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.PostgreSQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

/**
 * Servlet implementation class RecommendationTestServlet
 */
public class RecommendationTestServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private @Resource(name = "jdbc/taste_preferences",
            lookup = "jdbc/taste_preferences",
            authenticationType = Resource.AuthenticationType.APPLICATION,
            shareable = false)
    DataSource tasteDS;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendationTestServlet() {
        super();
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DataModel dataModel;
        int USER_ID = Integer.parseInt(request.getParameter("userID"));
//        int USER_ID = 411;

        try {

            // create the data model object
            dataModel = new PostgreSQLJDBCDataModel(tasteDS, "PREFERENCES.TASTE_PREFERENCES", "USER_ID", "ITEM_ID", "PREFERENCE", "TIMESTAMP");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<h1 class=\"text-center\">Used based recommendations<h1>");
            out.println("<div class=\"text-center\"");
            out.println("<h2>User id:" + USER_ID + "</h2>");
            out.println("<h3 class=\"text-center\">This user rated:" + dataModel.getItemIDsFromUser(USER_ID).size() + " items</h3>");
            out.println("</div>");
            out.println("<div class=\"container col-md-10\">");
            out.println("<table class=\"table table-striped table-dark text-center\">\n"
                    + "  <thead class=\"thead-dark\">\n"
                    + "    <tr>\n"
                    + "      <th scope=\"col\">itemID</th>\n"
                    + "      <th scope=\"col\">Similarity</th>\n"
                    + "    </tr>\n"
                    + "  </thead>");

            UserSimilarity similarity
                    = //new PearsonCorrelationSimilarity(dataModel);
                    new LogLikelihoodSimilarity(dataModel);
//            System.out.println(similarity.userSimilarity(211, 200));
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, similarity, dataModel);
            Recommender recommender = new GenericUserBasedRecommender(dataModel, neighborhood, similarity);
            java.util.List<RecommendedItem> list = recommender.recommend(USER_ID, 10);
            Iterator<RecommendedItem> iter = list.iterator();

            while (iter.hasNext()) {
                RecommendedItem item = iter.next();
                out.println("<tr><td>" + item.getItemID() + "</td><td>" + item.getValue() + "</td></tr>");
            }
            out.println("</table>");
            out.println("</div>");
        } catch (TasteException e) {
        }
    }
}
