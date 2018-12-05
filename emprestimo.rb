
def imprimeDadosEmprestimo(client, dado, tabela)
   result = selecionaLinha(client, dado, tabela,'ID_EMPRESTIMO')
    result.each do |row|
        print row['ID_EMPRESTIMO'], ' ', row['ID_FITA'], ' '
        texto = "select ID_FILME from FITA where ID_FITA = '#{row['ID_FITA']}'"
        fita = client.query(texto)
        fita.each do |a|
            fita = a['ID_FILME']
        end

        texto = "select TIT_FILME from FILME where ID_FILME = '#{fita}'"
        filme = client.query(texto)
        filme.each do |a|
            filme = a['TIT_FILME']
            print filme, ' '
        end
        texto = "select NOME_CLIENTE from CLIENTE where ID_CLIENTE = '#{row['ID_CLIENTE']}'"
        cliente = client.query(texto)
        cliente.each do |a|
            cliente = a['TIT_FILME']
        end

        puts cliente, ' ',row['DT_RETIRADA'], ' ', row['DT_DEVOL'], ' '
    end
end


### verificar retorno
def incluiEmprestimo(client)
    puts 'digite o nome do filme'
    name = gets.chomp

    texto = "select ID_FILME from FILME where TIT_FILME = '#{name}'"
    idfilme = client.query(texto)

    idfilme.each do |a|
        idfilme = a['ID_FILME']
    end
   

    texto = "select ID_FITA from FITA where ID_FILME = '#{idfilme}' and COND_FITA = 'D'"
    fita = client.query(texto)

    fita.each do |a|
        fita = a['ID_FITA']
    end

    puts 'digite o nome do cliente'
    name = gets.chomp



    if (clienteRegular(client, name)==false)
        print 'O cliente não está regular'
        return
    end



    texto =  "select ID_CLIENTE from CLIENTE where NOME_CLIENTE = '#{name}'"
    idcliente = client.query(texto)
    idcliente.each do |a|
        idcliente = a['ID_CLIENTE']
    end

    texto = 'a'
    data = Time.now.strftime("%Y-%m-%d")
    puts 'data:', data

    texto = "insert into EMPRESTIMO(ID_FITA, ID_CLIENTE, DT_RETIRADA) values ('#{fita}', '#{idcliente}', '#{data}')"
    client.query(texto)

    texto = " update FITA set COND_FITA = 'R'  where ID_FITA = #{fita}"
    client.query(texto)

end

def devolveEmprestimo(client)
    puts 'selecione o número que quer devolver'
    numero = gets
    data = Time.now.strftime("%Y-%m-%d")
    query = "update EMPRESTIMO set DT_DEVOL = '#{data}' where ID_EMPRESTIMO = #{numero}"
    client.query(query)
    
    texto =  "select ID_FITA from EMPRESTIMO where ID_EMPRESTIMO = '#{numero}'"
    idfita = client.query(texto)
    idfita.each do |a|
        idfita = a['ID_CLIENTE']
    end

    texto = " update FITA set COND_FITA = 'D'  where ID_FITA = #{idfita}"
    client.query(texto)


end
