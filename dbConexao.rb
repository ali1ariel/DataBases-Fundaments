def iniciaServidor()
    client = Mysql2::Client.new(host: 'localhost', username: 'root', password: '12345')
    client.query('show databases')
    client.query('use locadora')
    return client
end
