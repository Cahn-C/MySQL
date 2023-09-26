use mavenfuzzyfactory;

-- Finding top Traffic Sources
-- "gsearch nonbrand" has the largest session volume, we will need to focus more on this campaign to gain more insight for potential optimization opportunities
select utm_source, utm_campaign, http_referer, count(distinct website_session_id) as sessions  
from website_sessions
where created_at < '2012-04-12'
group by utm_source, utm_campaign, http_referer
order by 4 desc;
