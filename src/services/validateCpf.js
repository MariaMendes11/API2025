const connect = require("../db/connect");

module.exports = async function validadeCpf(cpf, userId){
   const query = "SELECT id_usuario FROM usuario WHERE cpf=?";
   const values = [cpf];

   connect.query(query,values,(err,results)=>{
    if (err){
          //fazer algo
    }
    else if(results.length > 0){
        const IdDoCpfCadastrado = results[0].id_usuario;

        if(userId && IdDoCpfCadastrado !== userId){
            return { error:"CPF já cadastrado para outro usuário"}
        }else if(!userId){
            return{error: "CPF já cadastrado"}
        }
    }
    else{
        return null;
    }
   })


}