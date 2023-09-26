use mavenfuzzyfactory;

-- Finding top Traffic Sources
-- "gsearch nonbrand" has the largest session volume, we will need to focus more on this campaign to gain more insight for potential optimization opportunities
select utm_source, utm_campaign, http_referer, count(distinct website_session_id) as sessions  
from website_sessions
where created_at < '2012-04-12'
group by utm_source, utm_campaign, http_referer
order by 4 desc;


-- Traffic Conversion Rates
-- Since the conversion rate is below 4%, I will need to monitor the impact of bid reductions along with analyzing the performance trending by device type in order to refine bidding stategy
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


-- Traffic Source Trending
-- It seems that gsearch nonbrand is fairly sensitive to bid changes, the company wants to maximize volume, but does not want to spend more on ads than they can afford
-- Tom will follow up with me shortly
select min(date(created_at)) as week_start_date, 
       count(distinct ws.website_session_id) as sessions
from website_sessions ws
where created_at < '2012-05-10'
and ws.utm_source = 'gsearch'
and utm_campaign = 'nonbrand'
group by week(created_at)
order by 1;


-- Traffic Source Bid Optimization
-- Since desktop performs way better than mobile, Tom has decided to increase the company's bids on desktop
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
