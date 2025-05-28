create event if not exists reajuste_precos_eventos
    on schedule every 1 day
    starts current timestamp + interval 1 minute 
    on completion preserve 
    enable 
do 
    update ingresso set preco = preco * 1.10
    where fk_id_evento in(
        select id_evento from evento 
        where data_hora between now() and now() + interval 7 day
    );