select e.EntityName, a.BalanceDate as Date, a.Balance, s.Status
from (
	select b.EntityId, b.BalanceDate, MAX(StatusDate) as DATE, b.Balance
	from Balances b
	left join Status on b.BalanceDate >= StatusDate
	group by b.EntityId, b.BalanceDate, b.Balance
	) a
left join Status s on StatusDate = a.DATE
inner join Entity e on a.EntityId = e.EntityId	
order by a.BalanceDate desc, e.EntityName desc
