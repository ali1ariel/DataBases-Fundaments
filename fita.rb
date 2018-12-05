
def imprimeDadosFita(client, dado, tabela)
    imprimeColunas(client, 'FITA')
   result = selecionaLinha(client, dado, tabela, 'ID_FITA')
    result.each do |row|
        filme = selecionaLinha(client, row['ID_FILME'], 'FILME','ID_FILME')
        print row['ID_FITA'], ' ', row['COND_FITA'], ' '
        filme.each do |n|
            print n['ID_FILME'], ' ', n['TIT_FILME']
            puts
        end
    end
end

def incluiFita(client)
    puts 'digite o nome do filme'
    name = gets
    name = name.chomp

    nexa = nil
    texto = "select ID_FILME from FILME where TIT_FILME = '#{name}'"
    idfilme = client.query(texto)
    idfilme.each do |a|
        idfilme = a['ID_FILME']
    end
    texto = "insert into FITA(ID_FILME) values ('#{idfilme}')"
    client.query(texto)
    
end



def excluiFita(client)
    puts 'selecione o número que quer eliminar'
    numero = gets
    query = "delete from FITA where ID_FITA = #{numero}"
    client.query(query)
end

def consertoFita(client) 
    puts 'selecione o número da fita que quer enviar ao conserto'
    numero = gets
    query = "update FITA set COND_FITA = 'C' where ID_FITA = #{numero}"
    client.query(query)
end