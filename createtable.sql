--
-- createtable.sql
-- Creates a table for storing of the user preferences
--
DROP INDEX PREFERENCES.user_id_idx;
DROP INDEX PREFERENCES.item_id_idx;
DROP TABLE PREFERENCES.taste_preferences;
DROP SCHEMA PREFERENCES RESTRICT;
CREATE SCHEMA PREFERENCES;
CREATE TABLE PREFERENCES.taste_preferences 
   (
	   	user_id BIGINT NOT NULL,
	   	item_id BIGINT NOT NULL,
	   	preference FLOAT NOT NULL,
	   	"timestamp" BIGINT,
	   	PRIMARY KEY (user_id, item_id)
	);
CREATE INDEX PREFERENCES.user_id_idx ON PREFERENCES.taste_preferences ( user_id );
CREATE INDEX PREFERENCES.item_id_idx ON PREFERENCES.taste_preferences ( item_id );

