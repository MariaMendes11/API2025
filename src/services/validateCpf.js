const connect = require("../db/connect");

module.exports = async function validateCpf(cpf, userId = null) {
  return new Promise((resolve, reject) => {
    const query = "SELECT id_usuario FROM usuario WHERE cpf = ?";
    const values = [cpf];

    if(!validarCpf(cpf)){
      resolve({ error: "Informe um CPF valido"})
    }

    connect.query(query, values, (err, results) => {
      if (err) {
        reject("Erro ao verificar CPF");
      } else if (results.length > 0) {
        const cpfCadastrado = results[0].id_usuario;

        // Se um userId foi passado (update) e o CPF pertence a outro usuário, retorna erro
        if (userId && cpfCadastrado !== userId) {
          resolve({ error: "CPF já cadastrado para outro usuário" });
        } else if (!userId) {
          resolve({ error: "CPF já cadastrado" });
        } else {
          resolve(null);
        }
      } else {
        resolve(null);
      }
    });
  });
};

function validateCpfMath(cpf){
  //Remove caracteres não númericos
  cpf = cpf.replace(/[^\d]+/g,'');

  //Verifica se há 11 digitos ou se são todos dígitos iguais
  if(cpf.legth !==11 || /^(\d)\1+$/.test(cpf)) return false;

  // Função auxiliar para calcular dígito verificador
  const calcularDigito = (base, pesoInicial) => {
    let soma = 0;
    for (let i = 0; i < base.length; i++) {
      soma += parseInt(base[i]) * (pesoInicial - i);
    }
    const resto = soma % 11;
    return resto < 2 ? 0 : 11 - resto;
  };

  const primeiroDigito = calcularDigito(cpf.substring(0, 9), 10);
  const segundoDigito = calcularDigito(cpf.substring(0, 9) + primeiroDigito, 11);

  return (
    parseInt(cpf[9]) === primeiroDigito &&
    parseInt(cpf[10]) === segundoDigito
  );
}