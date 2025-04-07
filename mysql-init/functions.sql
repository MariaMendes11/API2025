-- Criação de function
delimiter $$
create function calcula_idade(datanascimento date)
returns int 
-- deterministic
contatins sql
begin
    declare idade int;
    set idade = timestampdiff(year, datanascimento, curdate());
    return idade;
end; $$
delimiter ;

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