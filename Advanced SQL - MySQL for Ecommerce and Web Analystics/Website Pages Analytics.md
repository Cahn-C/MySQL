# Website Analysis

## Identifying Top Website Pages
Morgan wants to find out more about the site by pulling the most-viewed website pages, ranks by session volume
```sql
select pageview_url,
       count(distinct website_session_id) as sessions 
from website_pageviews
where created_at < '2012-06-09'
group by pageview_url
order by 2 desc;
```
Results:<br>
<img width="650" height="300" alt="query 1 results" src="https://github.com/Cahn-C/MySQL/assets/72324462/e803561a-a9c6-4bac-9377-63b6f927d663">

<br>


## Identifying Top Entry Pages
Morgan wants to confirm where the users are landing first on the site
```sql
CREATE TEMPORARY TABLE first_entry
select website_session_id,
       min(website_pageview_id) as pageviews
from website_pageviews
where created_at < '2012-06-12'
group by website_session_id;

select wp.pageview_url,
       count(distinct wp.website_pageview_id) as top_entry_pageview
from first_entry fe
left join website_pageviews wp
on fe.pageviews = wp.website_pageview_id
where wp.created_at < '2012-06-09'
group by wp.pageview_url
order by 2 desc;
```
Results:<br>
<img width="650" height="140" alt="query 2 results" src="https://github.com/Cahn-C/MySQL/assets/72324462/6ea8a42c-0cd8-41a4-b1cd-9c912d32ef6e">

<br>

## Bounce Rate Analysis
Morgan would like to see bounce rates for traffic landing on the homepage, she would like to see the number of sessions, number of bounced sessions and the percentage of sessions that bounced or the bounce rate.

```sql
-- STEP 1: Find the first pageview for each relevant session
-- STEP 2: Identify the landing page of each session
-- STEP 3: Counting pageviews for each session, to identify "bounces"
-- STEP 4: Summarizing total sessions and bounced sessions, by landing page

-- Get the first pageview for each session
create temporary table first_pageviews
select website_session_id,
	   min(website_pageview_id) as min_pageviews
from website_pageviews wp
where created_at < '2012-06-14'
group by website_session_id;

select * from first_pageviews;


-- Get the landing page of each session
create temporary table sessions_with_landing_page
select wp.pageview_url as landing_page,
	   fp.website_session_id
from first_pageviews fp
left join website_pageviews wp
on fp.min_pageviews = wp.website_pageview_id;


select * from sessions_with_landing_page;


-- Get the number of pageviews for each session 
create temporary table bounced_session
select sp.website_session_id,
	   sp.landing_page,
	   count(wp.website_pageview_id) as number_of_pageviews
from sessions_with_landing_page sp
left join website_pageviews wp
on sp.website_session_id = wp.website_session_id
group by sp.website_session_id,
		 sp.landing_page
having count(wp.website_pageview_id) = 1;

select * from bounced_session;


-- Get the summary of total sessions and bounced sessions by landing page
select count(sp.website_session_id) as sessions,
       count(bs.website_session_id) as bounced_sessions,
       count(bs.website_session_id) / count(sp.website_session_id) as bounce_rate
from session_with_landing_page sp
left join bounced_session bs
on sp.website_session_id = bs.website_session_id;
```
Results: <br>
<img width="650" height="140" alt="image" src="https://github.com/clabordec/MySQL/assets/72324462/a2836702-ba6f-4857-9e91-bf4767e5cabe">


