DP_16_1_Practice
Try It / Solve It
1. Using CREATE TABLE AS subquery syntax, create a seq_d_songs table of all the columns in the
DJs on Demand database table d_songs. Use the SELECT * in the subquery to make sure that
you have copied all of the columns.
CREATE TABLE seq_d_songs AS
SELECT * 
FROM d_songs;

2. Because you are using copies of the original tables, the only constraints that were carried over
were the NOT NULL constraints. Create a sequence to be used with the primary-key column of
the seq_d_songs table. To avoid assigning primary-key numbers to these tables that already
exist, the sequence should start at 100 and have a maximum value of 1000. Have your sequence
increment by 2 and have NOCACHE and NOCYCLE. Name the sequence seq_d_songs_seq.
CREATE SEQUENCE seq_d_songs_seq
START WITH 100
INCREMENT BY 2
MAXVALUE 1000
NOCACHE
NOCYCLE;

3. Query the USER_SEQUENCES data dictionary to verify the seq_d_songs_seq SEQUENCE
settings.
SELECT * 
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_D_SONGS_SEQ';

4. Insert two rows into the seq_d_songs table. Be sure to use the sequence that you created for the
ID column. Add the two songs shown in the graphic.
ID TITLE DURATION ARTIST TYPE_CODE
Island Fever 5 min Hawaiian Islanders 12
Castle of Dreams 4 min The Wanderers 77
INSERT INTO seq_d_songs (ID, TITLE, DURATION, ARTIST, TYPE_CODE)
VALUES (seq_d_songs_seq.NEXTVAL, 'Island Fever', '5 min', 'Hawaiian Islanders', 12);

INSERT INTO seq_d_songs (ID, TITLE, DURATION, ARTIST, TYPE_CODE)
VALUES (seq_d_songs_seq.NEXTVAL, 'Castle of Dreams', '4 min', 'The Wanderers', 77);

5. Write out the syntax for seq_d_songs_seq to view the current value for the sequence. Use the
DUAL table. (Oracle Application Developer will not run this query.)
SELECT seq_d_songs_seq.CURRVAL
FROM DUAL;

DP_16_2_Practice
4. Create a nonunique index (foreign key) for the DJs on Demand column (cd_number) in the
D_TRACK_LISTINGS table. Use the Oracle Application Developer SQL Workshop Data Browser
to confirm that the index was created.
CREATE INDEX idx_cd_number
ON D_TRACK_LISTINGS (cd_number);

SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE TABLE_NAME = 'D_TRACK_LISTINGS';

5. Use the join statement to display the indexes and uniqueness that exist in the data dictionary for
the DJs on Demand D_SONGS table.
SELECT uic.INDEX_NAME, uic.TABLE_NAME, uic.UNIQUENESS, uic.COLUMN_NAME
FROM USER_IND_COLUMNS uic
JOIN USER_INDEXES ui
ON uic.INDEX_NAME = ui.INDEX_NAME
WHERE uic.TABLE_NAME = 'D_SONGS';

6. Use a SELECT statement to display the index_name, table_name, and uniqueness from the data
dictionary USER_INDEXES for the DJs on Demand D_EVENTS table.
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE TABLE_NAME = 'D_EVENTS';

7. Write a query to create a synonym called dj_tracks for the DJs on Demand d_track_listings table.
CREATE SYNONYM dj_tracks
FOR D_TRACK_LISTINGS;

SELECT SYNONYM_NAME, TABLE_NAME
FROM USER_SYNONYMS
WHERE SYNONYM_NAME = 'DJ_TRACKS';

8. Create a function-based index for the last_name column in DJs on Demand D_PARTNERS table
that makes it possible not to have to capitalize the table name for searches. Write a SELECT
statement that would use this index.
CREATE INDEX idx_last_name_lower
ON D_PARTNERS (LOWER(last_name));

SELECT * 
FROM D_PARTNERS
WHERE LOWER(last_name) = 'smith';

9. Create a synonym for the D_TRACK_LISTINGS table. Confirm that it has been created by
querying the data dictionary.
CREATE SYNONYM synonym_track_listings
FOR D_TRACK_LISTINGS;

SELECT SYNONYM_NAME, TABLE_NAME
FROM USER_SYNONYMS
WHERE SYNONYM_NAME = 'SYNONYM_TRACK_LISTINGS';

10. Drop the synonym that you created in question 9.
DROP SYNONYM synonym_track_listings;

SELECT SYNONYM_NAME, TABLE_NAME
FROM USER_SYNONYMS
WHERE SYNONYM_NAME = 'SYNONYM_TRACK_LISTINGS';
