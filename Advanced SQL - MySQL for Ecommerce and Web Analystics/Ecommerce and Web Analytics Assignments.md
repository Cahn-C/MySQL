# Ecommerce and Web Analystics Assignments

![image](https://github.com/Cahn-C/MySQL/assets/72324462/f1d327c2-bb50-468f-a080-d4217d3c079e)

<br>
Finding top Traffic Sources
<hr>

```sql
-- Find a campaing that has the most potential to pulling more customers
SELECT utm_source, 
       utm_campaign, 
       http_referer, 
       COUNT(distinct website_sessiON_id) AS sessiONs  
FROM website_sessiONs
WHERE created_at < '2012-04-12'
GROUP BY utm_source, utm_campaign, http_referer
ORDER BY 4 desc;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/8b5b3e05-fc73-41b4-bc69-681525e727e4)

<br>
Traffic conversion Rates
<hr>

```sql
-- Find the conversion rate, if the conversion rate is below 4%, THEN the marketing team will need to perform a bid reductiON. 
SELECT COUNT(distinct ws.website_sessiON_id) AS sessiONs, 
       COUNT(distinct o.order_id) AS orders,
       COUNT(distinct o.order_id) / COUNT(distinct ws.website_sessiON_id) AS cONversiON_rate
FROM website_sessiONs ws
LEFT JOIN orders o
ON ws.website_sessiON_id = o.website_sessiON_id
WHERE ws.created_at < '2012-04-14'
AND ws.utm_source = 'gsearch'
AND ws.utm_campaign = 'nONbrAND'
AND ws.http_referer = 'https://www.gsearch.com';
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/fd9219a0-7136-4087-9d4f-be06d8abc54e)

<br>
Traffic Source Trending
<hr>

```sql
/* It seems that gsearch nonbrand is fairly sensitive to bid changes, the company wants to maximize volume, but does not 
   want to spend more ON ads than they can afford
   Tom will follow up WITH me shortly
*/
SELECT MIN(date(created_at)) AS week_start_date, 
       COUNT(distinct ws.website_sessiON_id) AS sessiONs
FROM website_sessiONs ws
WHERE created_at < '2012-05-10'
AND ws.utm_source = 'gsearch'
AND utm_campaign = 'nONbrAND'
GROUP BY week(created_at)
ORDER BY 1;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/5cd609a4-467e-48ba-a402-2493a2b45a6c)

<br>
Traffic Source Segment Trending
<hr>

```sql
/* 
   Since desktop performs way better than mobile, Tom has decided to increase the company's bids ON desktop
*/
SELECT device_type,
       COUNT(distinct ws.website_sessiON_id) AS sessiONs, 
       COUNT(distinct o.order_id) AS orders,
       COUNT(distinct o.order_id) / COUNT(distinct ws.website_sessiON_id) AS cONverstiON_rate
FROM website_sessiONs ws
LEFT JOIN orders o
ON ws.website_sessiON_id = o.website_sessiON_id
WHERE ws.created_at < '2012-05-11'
AND utm_source = 'gsearch'
AND utm_campaign = 'nONbrAND'
GROUP BY device_type
ORDER BY 2;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/c672a516-d351-4d31-867a-502a7405d3ba)

<br>
Traffic Source Segment Trending 
<hr>

```sql
/* 
   After the bid change made after May 13th 2012, there was a major increase ON May 20th 2012 for desktop users, while 
   mobile
   seems to be a little flat.
*/
WITH cte AS (
	SELECT MIN(date(created_at)) AS start_of_week,
	       COUNT(distinct CASE WHEN device_type = 'desktop' THEN website_sessiON_id else null end) AS dektop_sessiONs,
	       COUNT(distinct CASE WHEN device_type = 'mobile' THEN website_sessiON_id else null end) AS mobile_sessiONs
	FROM website_sessiONs
	WHERE created_at < '2012-06-09'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nONbrAND'
	GROUP BY week(created_at)
)
SELECT * FROM cte WHERE start_of_week >= '2012-04-15';
```





