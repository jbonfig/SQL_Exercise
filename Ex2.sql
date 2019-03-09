select e.EntityName, s2.Status, a.DATE as 'As Of', a.AVG as 'Avg Balance'
from (
	select b.EntityId, AVG(b.Balance) as AVG, MAX(s.StatusDate) as DATE
	from Balances b
	left join Status s on b.EntityId = s.EntityId
	group by b.EntityId
	) a
inner join Status s2 on s2.StatusDate = a.DATE
inner join Entity e on a.EntityId = e.EntityId	
order by e.EntityName desc
