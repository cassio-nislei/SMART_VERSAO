select min(v.numero_cupom_fiscal)Cupom_inicial,max(v.numero_cupom_fiscal)Cupom_final,
v.data,(select count(a.codigo) from c000048 as a where a.status=:aprovado and a.data=v.data)Cupons_Aprovados,
(select count(a.codigo) from c000048 as a where a.status=:cancelado and a.data=v.data)Cupon_Cancelados,
(select sum(total)from c000048 as a where a.status=:aprovado and a.data=v.data)Total_Aprovados,
(select sum(total)from c000048 as a where a.status=:cancelado and a.data=v.data)Total_Cancelados
from c000048 as v where cast(v.data as date) between cast(:datai as date) and cast(:dataf as date) 
group by v.data 
