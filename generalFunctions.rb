def selecionaColuna(client, dado)
    query= "show columns from #{dado}"
    coluna = client.query(query)
end

def imprimeColunas(client, tabela)
    coluna = selecionaColuna(client, tabela)
    coluna.each do |row|
        print row['Field'], ' '
    end
    puts
end

def selecionaLinha(client, dado, tabela, id)


    if dado != '*'
        dado = "select * from #{tabela} where #{id} = #{dado}"
        result = client.query(dado)
        else
            query = "select #{dado} from #{tabela}"
            result = client.query(query)
        end
end

def imprimeDados(client, dado, tabela)
    imprimeColunas(client, tabela)
    if dado != '*'
        dado = "select * from #{tabela} where numero = #{dado}"
        result = client.query(dado)
        else
            result = selecionaLinha(client, dado, tabela)
    end

    result.each do |row|
        print row['Field'], ' '
    end
end
