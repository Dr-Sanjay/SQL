
-- 01) Create an ER diagram or draw a schema for the given database.
-- Ans.  Select Database Menu and click Reverse Engineer to see EER diagram.
         USE IG_CLONE;

-- 02)We want to reward the user who has been around the longest, Find the 5 oldest users.

SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;

-- 03)To understand when to run the ad campaign, figure out the day of the week most users register on? 
		
SELECT 
    DAYNAME(created_at) AS Day_of_Week,
    COUNT(*) AS Total_Registrations
FROM
    users
GROUP BY Day_of_Week
ORDER BY Total_Registrations DESC
LIMIT 2;

-- 04)To target inactive users in an email ad campaign, find the users who have never posted a photo.
		
SELECT 
    users.id, username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.user_id IS NULL;


-- 05)Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?

SELECT 
    users.id AS user_id,
    username AS Winner,
    photos.image_url AS Most_Liked_Photo,
    COUNT(*) AS Total_Likes_Count
FROM
    photos
        JOIN
    likes ON photos.id = likes.photo_id
        JOIN
    users ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY Total_Likes_Count DESC
LIMIT 1;

-- 06)The investors want to know how many times does the average user post.


		SELECT ROUND((SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users)) AS Avg_User_Post; 

-- 07)A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

SELECT 
    tags.tag_name, COUNT(*) AS Used_Number_Of_Times
FROM
    tags
        JOIN
    photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY Used_Number_Of_Times DESC
LIMIT 5;

-- 08)To find out if there are bots, find users who have liked every single photo on the site.

SELECT 
    users.id AS user_id,
    users.username,
    COUNT(*) AS Total_User_Likes
FROM
    users
        JOIN
    likes ON users.id = likes.user_id
GROUP BY users.id
HAVING Total_User_Likes = (SELECT COUNT(*) FROM photos);
		
-- 09)To know who the celebrities are, find users who have never commented on a photo.

SELECT 
    users.id, username
FROM
    users
        LEFT JOIN
    comments ON users.id = comments.user_id
WHERE
    comments.user_id IS NULL;

-- 10)Now it's time to find both of them together, find the users 
-- who have never commented on any photo or have commented on every photo.

SELECT 
    users.id, username
FROM
    users
        LEFT JOIN
    comments ON users.id = comments.user_id
WHERE
    comments.user_id IS NULL
        OR photo_id = 257;
		












