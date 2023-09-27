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
