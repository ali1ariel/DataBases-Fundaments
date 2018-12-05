
def imprimeDadosCliente(client, dado, tabela)
   result = selecionaLinha(client, dado, tabela, 'ID_CLIENTE')
    result.each do |row|
        print row['ID_CLIENTE'], ' ', row['NOME_CLIENTE'], ' ', row['END_CLIENTE'], ' ',row['TEL_CLIENTE'], ' ', row['RG_CLIENTE'], ' '
        puts row['COND_CLIENTE']
    end
end

def incluiCliente(client)
    puts 'digite o nome'
    name = gets
    name = name.chomp
    puts 'digite o endereço'
    ende = gets
    ende = ende.chomp
    puts 'digite o telefone'
    tele = gets
    tele = tele.chomp
    puts 'digite o RG'
    reg = gets
    reg = reg.chomp
    query = "insert into CLIENTE(NOME_CLIENTE, END_CLIENTE, TEL_CLIENTE, RG_CLIENTE) values ('#{name}', '#{ende}', '#{tele}', '#{reg}')"
    client.query(query)
end


#VERIFICAR EMPRESTIMOS
def excluiCliente(client)
    puts 'selecione o número que quer eliminar'
    numero = gets
    query = "delete from CLIENTE where ID_CLIENTE = #{numero}"
    client.query(query)
end

def editarInformacoes(client, tabela)
    puts 'qual o numero do cliente que quer editar?'
    numero = gets.chomp
    print numero
    puts 'os dados selecionados são'
    imprimeColunas(client, tabela)
    imprimeDadosCliente(client, numero, tabela)
    puts 'qual coluna quer editar?'
    colunaEscolhida = gets.chomp
    coluna = selecionaColuna(client, tabela)

    coluna.each do |row|
        if row['Field'].eql? colunaEscolhida
            texto = "qual a atualização de #{row['Field']} você vai colocar?"
            puts texto
            modificacao = gets.chomp
            texto = "update CLIENTE set #{row['Field']} = '#{modificacao}' where ID_CLIENTE = #{numero}"
            client.query(texto)
            return
        end
        puts 'coluna não encontrada, tente novamente'
    end

end

def modificaCondCliente(client)
    puts 'qual o id do cliente?'
    numero = gets.chomp
    puts 'qual a nova condição do cliente?'
    puts 'R - REGULAR'
    puts 'A - EM ATRASO'
    puts 'CJ - EM COBRANÇA JUDICIAL'
    puts 'C - CANCELADO'
    cond = gets.chomp
    texto = "update CLIENTE set COND_CLIENTE = '#{cond}' where ID_CLIENTE = #{numero}"
    client.query(texto)
end

def clienteRegular (client, nome)
    texto="select COND_CLIENTE from CLIENTE where NOME_CLIENTE = '#{nome}'"
    cond = client.query(texto)

    cond.each do |a|
        cond = a['COND_CLIENTE']
    end

    if (cond == 'R')
         return true;
    else return false
    end
end