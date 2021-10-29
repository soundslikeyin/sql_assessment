-- What are the Top 25 schools (.edu domains)?
SELECT email_domain, COUNT (user_id) AS 'no. of learners from the school' FROM users 
GROUP BY email_domain
ORDER BY COUNT(user_id) DESC
LIMIT 25;

-- How many .edu learners are located in New York?
SELECT city, COUNT (user_id) AS 'no. of learners in New York' FROM users
WHERE email_domain LIKE '%.edu' AND city = 'New York';

-- The mobile_app column contains either mobile-user or NULL. 
-- How many of these Codecademy learners are using the mobile app?

SELECT mobile_app, COUNT (user_id) AS 'no. of mobile learners' FROM users
where mobile_app = 'mobile-user';

-- query for the sign up counts for each hour.
SELECT strftime('%H', sign_up_at) AS "sign up hour", COUNT (user_id) AS 'no. of learners signed up' 
FROM users
GROUP BY 1
ORDER BY 2 DESC;

-- Do different schools (.edu domains) prefer different courses?
SELECT email_domain,
SUM(case when (learn_cpp = 'started' OR learn_cpp = 'completed') Then 1 else 0 end) as 'learn cpp',
SUM(case when (learn_sql = 'started' OR learn_sql = 'completed') Then 1 else 0 end) as 'learn sql',
SUM(case when (learn_html = 'started' OR learn_html = 'completed') Then 1 else 0 end) as 'learn html',
SUM(case when (learn_javascript = 'started' OR learn_javascript = 'completed') Then 1 else 0 end) as 'learn javascript',
SUM(case when (learn_java = 'started' OR learn_java = 'completed') Then 1 else 0 end) as 'learn java'
FROM users
INNER JOIN progress ON users.user_id = progress.user_id
GROUP BY email_domain;


-- What courses are the New Yorkers students taking?
SELECT 
SUM(case when (learn_cpp = 'started' OR learn_cpp = 'completed') Then 1 else 0 end) as 'learn cpp',
SUM(case when (learn_sql = 'started' OR learn_sql = 'completed') Then 1 else 0 end) as 'learn sql',
SUM(case when (learn_html = 'started' OR learn_html = 'completed') Then 1 else 0 end) as 'learn html',
SUM(case when (learn_javascript = 'started' OR learn_javascript = 'completed') Then 1 else 0 end) as 'learn javascript',
SUM(case when (learn_java = 'started' OR learn_java = 'completed') Then 1 else 0 end) as 'learn java'
FROM users
INNER JOIN progress ON users.user_id = progress.user_id
WHERE city = 'New York';

-- What courses are the Chicago students taking?
SELECT 
SUM(case when (learn_cpp = 'started' OR learn_cpp = 'completed') Then 1 else 0 end) as 'learn cpp',
SUM(case when (learn_sql = 'started' OR learn_sql = 'completed') Then 1 else 0 end) as 'learn sql',
SUM(case when (learn_html = 'started' OR learn_html = 'completed') Then 1 else 0 end) as 'learn html',
SUM(case when (learn_javascript = 'started' OR learn_javascript = 'completed') Then 1 else 0 end) as 'learn javascript',
SUM(case when (learn_java = 'started' OR learn_java = 'completed') Then 1 else 0 end) as 'learn java'
FROM users
INNER JOIN progress ON users.user_id = progress.user_id
WHERE city = 'Chicago';