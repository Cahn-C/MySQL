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

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/fd9219a0-7136-4087-9d4f-be06d8abc54e)

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/5cd609a4-467e-48ba-a402-2493a2b45a6c)

<br><br>
![image](https://github.com/Cahn-C/MySQL/assets/72324462/c672a516-d351-4d31-867a-502a7405d3ba)





