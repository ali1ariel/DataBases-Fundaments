
def imprimeDadosFilme(client, dado, tabela)
   result = selecionaLinha(client, dado, tabela,'ID_FILME')
    result.each do |row|
        print row['ID_FILME'], ' ', row['TIT_FILME'], ' ', row['ATRIZ'], ' ',row['ATOR'], ' ', row['GEN_FILME'], ' '
        puts
    end
end

def incluiFilme(client)
    puts 'digite o nome'
    name = gets.chomp
    puts 'digite a atriz, se nenhuma, digite nenhuma'
    atriz = gets.chomp
    puts 'digite o ator, se nenhum, digite nenhum'
    ator = gets.chomp
    puts 'digite o genero'
    genero = gets.chomp
    query = "insert into FILME(TIT_FILME, ATRIZ, ATOR, GEN_FILME) values ('#{name}', '#{atriz}', '#{ator}', '#{genero}')"
    client.query(query)
end


#VERIFICAR EMPRESTIMOS
def excluiFilme(client)
    puts 'selecione o número que quer eliminar'
    numero = gets
    query = "delete from FILME where ID_FILME = #{numero}"
    client.query(query)
end

def editarInformacoes(client, tabela)
    puts 'qual o numero do filme que quer editar?'
    numero = gets.chomp
    print numero
    puts 'os dados selecionados são'
    imprimeColunas(client, tabela)
    imprimeDadosFilme(client, numero, tabela)
    puts 'qual coluna quer editar?'
    colunaEscolhida = gets.chomp
    coluna = selecionaColuna(client, tabela)

    coluna.each do |row|
        if row['Field'].eql? colunaEscolhida
            texto = "qual a atualização de #{row['Field']} você vai colocar?"
            puts texto
            modificacao = gets.chomp
            texto = "update FILME set #{row['Field']} = '#{modificacao}' where ID_FILME = #{numero}"
            client.query(texto)
            return
        end
        puts 'coluna não encontrada, tente novamente'
    end

end
