use mavenfuzzyfactory;

-- Finding top Traffic Sources
-- "gsearch nonbrand" has the largest session volume, we will need to focus more on this campaign to gain more insight for potential optimization opportunities
select utm_source, utm_campaign, http_referer, count(distinct website_session_id) as sessions  
from website_sessions
where created_at < '2012-04-12'
group by utm_source, utm_campaign, http_referer
order by 4 desc;


-- Traffic Conversion Rates
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
