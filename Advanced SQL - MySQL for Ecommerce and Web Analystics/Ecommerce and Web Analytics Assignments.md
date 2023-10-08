# Ecommerce and Web Analystics Assignments

![image](https://github.com/Cahn-C/MySQL/assets/72324462/f1d327c2-bb50-468f-a080-d4217d3c079e)

```sql
-- Finding top Traffic Sources
/* "gsearch nonbrand" has the largest session volume, we will need to focus more on this campaign to gain more insight for
   potential optimization opportunities
*/
select utm_source, 
       utm_campaign, 
       http_referer, 
       count(distinct website_session_id) as sessions  
from website_sessions
where created_at < '2012-04-12'
group by utm_source, utm_campaign, http_referer
order by 4 desc;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/8b5b3e05-fc73-41b4-bc69-681525e727e4)

```sql
-- Traffic Conversion Rates
/* Since the conversion rate is below 4%, I will need to monitor the impact of bid reductions along with
   analyzing the performance trending by device type in order to refine bidding stategy
*/
select count(distinct ws.website_session_id) as sessions, 
       count(distinct o.order_id) as orders,
       count(distinct o.order_id) / count(distinct ws.website_session_id) as conversion_rate
from website_sessions ws
left join orders o
on ws.website_session_id = o.website_session_id
where ws.created_at < '2012-04-14'
and ws.utm_source = 'gsearch'
and ws.utm_campaign = 'nonbrand'
and ws.http_referer = 'https://www.gsearch.com';
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/fd9219a0-7136-4087-9d4f-be06d8abc54e)
```sql
-- Traffic Source Trending
/* It seems that gsearch nonbrand is fairly sensitive to bid changes, the company wants to maximize volume, but does not 
   want to spend more on ads than they can afford
   Tom will follow up with me shortly
*/
select min(date(created_at)) as week_start_date, 
       count(distinct ws.website_session_id) as sessions
from website_sessions ws
where created_at < '2012-05-10'
and ws.utm_source = 'gsearch'
and utm_campaign = 'nonbrand'
group by week(created_at)
order by 1;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/5cd609a4-467e-48ba-a402-2493a2b45a6c)
```sql
/* Traffic Source Bid Optimization
   Since desktop performs way better than mobile, Tom has decided to increase the company's bids on desktop
*/
select device_type,
       count(distinct ws.website_session_id) as sessions, 
       count(distinct o.order_id) as orders,
       count(distinct o.order_id) / count(distinct ws.website_session_id) as converstion_rate
from website_sessions ws
left join orders o
on ws.website_session_id = o.website_session_id
where ws.created_at < '2012-05-11'
and utm_source = 'gsearch'
and utm_campaign = 'nonbrand'
group by device_type
order by 2;
```

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/c672a516-d351-4d31-867a-502a7405d3ba)

<br>
Traffic Source Segment Trending 
____

```sql
/* 
   After the bid change made after May 13th 2012, there was a major increase on May 20th 2012 for desktop users, while 
   mobile
   seems to be a little flat.
*/
with cte as (
	select min(date(created_at)) as start_of_week,
	       count(distinct case when device_type = 'desktop' then website_session_id else null end) as dektop_sessions,
	       count(distinct case when device_type = 'mobile' then website_session_id else null end) as mobile_sessions
	from website_sessions
	where created_at < '2012-06-09'
	and utm_source = 'gsearch'
	and utm_campaign = 'nonbrand'
	group by week(created_at)
)
select * from cte where start_of_week >= '2012-04-15';
```





