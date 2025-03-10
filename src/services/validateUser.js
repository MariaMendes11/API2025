module.exports = function validateUser({cpf,email,password,name,data_nascimento}){

    if(!cpf||!email||!password||!name||!data_nascimento){
        return{error: "Todos os campos devem ser preenchidos"};
        }
    if (isNaN(cpf)||cpf.lenght !==11){
        return{error:"CPF invalido. Deve conter 11 digitos numéricos"};
    }
    if(!email.includes("@")){
        return {error:"Email inválido.Deve conter @"};
    }
    return null; //Ou seja se estiver tudo certo eu retorno nulo para ignorar o IF na userController
};


