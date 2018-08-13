# Shelf - A Mahout based J2EE application for book recommendations.
A small maven J2EE recommendation application based on Apache Mahout.
![alt text](https://github.com/hrajpal96/shelf/blob/master/PSD%2010%20(Desktop%2C%20Laptop%2C%20and%20Tablet).png "Shelf")

### Mahout

https://mahout.apache.org/

https://github.com/apache/mahout

Used for creating a recommender web service to provide recommendations to the user upon login, based on the similarity of users.

### goodbooks-10k

https://github.com/zygmuntz/goodbooks-10k

#### To Create a dataset use goodbooks dataset and migrate it to your preferred database system.

##### Steps:-
1. Create the database structure for storing books information and book ratings by executing the sql file in your preferred database system.
2. Migrate the data from books.csv file in the goodbooks-10k dataset and the ratings of books from the ratings.csv file to your respective database (note that the application expects the rating to be stored in a table named taste_preferences with composite primary key of user_id and item_id, in our case book ids.
3. Ensure that the complete data is migrated for best results use an sql admin provider such as phpMyAdmin to bulk import data.


### Materialize CSS

https://github.com/Dogfalo/materialize

A modern material design framework base on Google's Material Design guidelines.

Materialize CSS is used for providing a clean, elegant and robust layout for recommendations to the user.

### Sendgrid

https://github.com/sendgrid/sendgrid-java

Sendgrid is a communication platform allowing users and orgranizations to send bulk emails for marketing campaigns as well as notifcations.Its developer APIs support a vast majority of programming languages.
Sendgrid is used here majorly for account verification purposes and sending notifications through e-mails .
