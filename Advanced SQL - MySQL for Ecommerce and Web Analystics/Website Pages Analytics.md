# Website Analysis

## Identifying Top Website Pages
Morgan wants to find to better about the sit by pulling the most-viwed website pages, ranks by session volumn
```sql
select pageview_url, count(distinct website_session_id) as sessions 
from website_pageviews
where created_at < '2012-06-09'
group by pageview_url
order by 2 desc;
```
Results:<br>
<img width="470" height="300" alt="query 1 results" src="https://github.com/Cahn-C/MySQL/assets/72324462/e803561a-a9c6-4bac-9377-63b6f927d663">


## Identifying Top Entry Pages
Morgan wants to confirm where the users are landing first on the site
```sql
CREATE TEMPORARY TABLE first_entry
select website_session_id, min(website_pageview_id) as pageviews
from website_pageviews
where created_at < '2012-06-12'
group by website_session_id;

select wp.pageview_url, count(distinct wp.website_pageview_id) as top_entry_pageview
from first_entry fe
left join website_pageviews wp
on fe.pageviews = wp.website_pageview_id
where wp.created_at < '2012-06-09'
group by wp.pageview_url
order by 2 desc;
```
Results:<br>
<img width="650" height="140" alt="query 2 results" src="https://github.com/Cahn-C/MySQL/assets/72324462/6ea8a42c-0cd8-41a4-b1cd-9c912d32ef6e">


