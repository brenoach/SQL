/*busca geral*/
SELECT * FROM cliente 

/*busca específica*/
SELECT nomeAnimal, peso FROM animal

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUE ('06253313621','1978884805','breno@senac.com.br','ouro branco','SP','AV','jose','156','sem complemento');

SELECT *FROM cliente
SELECT celular,email,tipoLogradouro, nomelogradouro FROM cliente

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUES ('João','06253313622','19788848054','brenocunh@senac.com.br','ouro brancoMG','SP','04110201','rua','156','ap 123');clinicaveterinariacliente