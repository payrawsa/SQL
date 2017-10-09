CREATE TABLE Users (
username char (40) PRIMARY KEY, 
display_name char (40) UNIQUE, 
Pass char (40)); 

CREATE TABLE Tweets ( 
"content" char (140), 
"time" time, 
PRIMARY KEY ("content", "time"));

CREATE TABLE Draft ( 
"content" char (140), 
"time" time, 
editable BOOLEAN CHECK (editable=true), 
FoREIGN KEY ("content", "time") references Tweets("content", "time"));

CREATE TABLE Relationship (
Follower_userid char (40) references Users(username),
Followee_userid char (40) references Users(username),
Primary key (Follower_userid, Followee_userid)
);

CREATE TABLE Creates (
username char (40) references Users (username),
"content" char (140),
"time" time,
FoREIGN KEY ("content", "time") references Tweets("content", "time"),
PRIMARY KEY (username, "content", "time"));

CREATE TABLE "Comments" (
"content" char(140),
"time" time,
PRIMARY KEY (content, time)
);

CREATE TABLE On_a(
tweet_content char(140),
tweet_time time,
FoREIGN KEY (tweet_content, tweet_time) references Tweets("content", "time"),
comment_content char (140),
comment_time time,
FoREIGN KEY (comment_content, comment_time) references "Comments"("content", "time"),
number_of_comments int,
primary key (tweet_content, comment_content, tweet_time, comment_time));

CREATE TABLE "Action" (
username char (40) references Users (username),
comment_content char (140),
comment_time time,
FoREIGN KEY (comment_content, comment_time) references "Comments"("content", "time"),
view_comment BOOLEAN,
post BOOLEAN,
PRIMARY KEY (username, comment_content, view_comment, post));

CREATE TABLE "Like" (
username char (40) references Users(username),
tweet_time time,
tweet_content char (140),
FoREIGN KEY (tweet_content, tweet_time) references Tweets("content", "time"),
number_of_likes int,
view_likes BOOLEAN,
likes BOOLEAN,
Primary key (username, tweet_content, tweet_time, view_likes, likes));
