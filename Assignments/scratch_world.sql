SELECT *
FROM best_at
FULL OUTER JOIN country 
ON best_at.country = country.name
ORDER BY best_at.country;

select * from country limit 1;
select * from best_at limit 1;

select c.name, b.country
from country c full outer join best_at b
on c.name = b.country
order by case when c.name is null then b.country else c.name end