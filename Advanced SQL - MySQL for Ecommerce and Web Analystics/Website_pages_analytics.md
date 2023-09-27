# Website Analysis

## Identifying Top Website Pages
Morgan wants to find to better about the sit by pulling the most-viwed website pages, tanks by session volumn
```sql
select pageview_url, count(distinct website_session_id) as sessions 
from website_pageviews
where created_at < '2012-06-09'
group by pageview_url
order by 2 desc;
```
Results:

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
Results:
![Uploading image.png…]()

