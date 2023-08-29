-- in seleciona elementos entre os valores enviados
select * from users
where id in (5,10,15,20,25,1000,12200,1212545)
and first_name in ('Aspen', 'Lucian');