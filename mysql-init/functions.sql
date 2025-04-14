-- Criação de function
DELIMITER $$
CREATE FUNCTION calcula_idade(datanascimento DATE)
RETURNS INT
DETERMINISTIC
CONTAINS SQL
BEGIN
    DECLARE idade INT;
    SET idade = TIMESTAMPDIFF(YEAR, datanascimento, CURDATE());
    RETURN idade;
END $$
DELIMITER ;


-- Verifica se a função especificada foi criada
show create function calcula_idade;

select name, calcula_idade(data_nascimento) AS idade FROM usuario;

delimiter $$
create function status_sistema ()
returns varchar(50)
no sql
begin 
    return 'Sistema operando normalmente';
end; $$
delimiter ;

--  Execução da query
select status_sistema();

delimiter $$
create function total_compras_usario(id_usuario int)
returns int
reads sql data
begin
    declare total int;

    select count(*) into total
    from compra 
    where id_usuario = compra.fk_id_usuario;

    return total;
end; $$
delimiter ;

select total_compras_usario(3) as "Total e compras";

-- Tabela para testar a clausula 
create table log_evento(
    id_log int auto_increment primary key,
    mensagem varchar(255),
    data_log datetime default current_timestamp
);

delimiter $$
create function registrar_log_evento(texto varchar(255))
returns varchar(50)
not deterministic
modifies sql data
begin 
    insert into log_evento(mensagem)
    values (texto);

    return 'Log inserido com sucesso';
end; $$
delimiter ;

show create function registrar_log_evento;

-- Visualiza o estado da váriavel de controle para permissões de criaçõa de funções 
show variables like 'log_bin_trust_function_creators';

-- alterna variavel global do MySQL
-- Precisa ter permissão de administrador do banco
set global log_bin_trust_function_creators = 1;

select registrar_log_evento('teste');

delimiter $$
create function mensagem_boas_vindas(nome_usuario varchar(100))
returns varchar(255)
deterministic
contains sql 
begin
    declare msg varchar(255);
    set msg = concat('Olá, ', nome_usuario, '! Seja bem-vindo(a) ao sistema VIO');
    return msg;
end; $$
delimiter ;

select routine_name from 
information_schema.routines
    where routine_type = 'FUNCTION'
        and routine_schema = 'vio_maria'; --ver as functions

--maior idade
delimiter $$

create function is_maior_idade(data_nascimento date)
returns boolean
not deterministic
contains sql
begin
    declare idade int;

    -- utilizando a função ja criada
    set idade = calcula_idade(data_nascimento);
    return idade >= 18;
end; $$

delimiter ;

-- Categorizar usuarios por faixa etaria

delimiter $$

create function faixa_etaria(data_nascimento date)
returns varchar(20)
not deterministic
contains sql
begin
    declare idade int;

    -- calculo da idade com a função já criada
    set idade = calcula_idade(data_nascimento);

    if idade < 18 then 
        return "menor de idade";
    elseif idade < 60 then 
        return "adulto";
    else 
        return "idoso";
    end if;
end; $$
delimiter ;

-- agrupar usuários por faixa etária
select faixa_etaria(data_nascimento) as faixa, count(*) as quantidade from usuario
group by faixa;

-- identificar uma feixa etaria específica
select name from usuario
    where faixa_etaria(data_nascimento) = "adulto";

-- calcular a média de idade de usuários cadastrados
delimiter $$
create function media_idade()
returns decimal (5,2)
not DETERMINISTIC
reads sql data
begin
    declare media decimal(5,2);

    -- cálculo da média das idades 
    select avg(timestampdiff(year, data_nascimento, curdate())) into media from usuario;

    return ifnull(media, 0);
end; $$
delimiter ;

-- selecionar idade específica
select "A média de idade dos clientes é maior que 30" as resultados where media_idade() > 20;

-- Exercício direcionado
-- cálculo do total gasto por um usuário
DELIMITER $$

CREATE FUNCTION calcula_total_gasto(pid_usuario INT)
RETURNS DECIMAL(10, 2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN 
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(i.preco * ic.quantidade) 
    INTO total
    FROM compra c
    JOIN ingresso_compra ic ON c.id_compra = ic.fk_id_compra
    JOIN ingresso i ON i.id_ingresso = ic.fk_id_ingresso
    WHERE c.fk_id_usuario = pid_usuario;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;

-- buscar a faixa etaria
delimiter $$
create function buscar_faixa_etaria_usuario(pid int)
returns varchar(20)
not deterministic
reads sql data
begin
    declare nascimento date;
    declare faixa varchar(20);
    
    select data_nascimento into nascimento
    from usuario
    where id_usuario = pid;

    set faixa = faixa_etaria(nascimento);

    return faixa;
end; $$
delimiter ;

DELIMITER //
create function total_ingressos_vendidos(id_evento INT)
returns int
deterministic
reads sql data
begin
    declare total INT;

    select ifnull(SUM(ic.quantidade), 0)
    into total
    from ingresso_compra ic
    join ingresso i ON ic.fk_id_ingresso = i.id_ingresso
    where i.fk_id_evento = id_evento;

    return total;
end;
//

DELIMITER ;

select
    total_ingressos_vendidos(1);



DELIMITER //
create function renda_total_evento(id_evento INT)
returns decimal(10,2)
deterministic
reads sql data
begin
    declare total decimal(10,2);

    select ifnull(SUM(i.preco * ic.quantidade), 0)
    into total
    from ingresso_compra ic
    join ingresso i ON ic.fk_id_ingresso = i.id_ingresso
    where i.fk_id_evento = id_evento;

    return total;
end; //
DELIMITER ;

select 
    renda_total_evento(1);