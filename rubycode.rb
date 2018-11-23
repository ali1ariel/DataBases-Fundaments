#aprendendo a linguagem
class Esportista
    def competir
        puts 'Participando de uma competição'
    end
end
class JogadorDeFutebol < Esportista
    def correr
        puts 'Correndo atrás da bola'
    end
end
class Maratonista < Esportista
    def correr
        puts 'Percorrendo o circuito'
    end
end

jogadorDeFutebol = JogadorDeFutebol.new
maratonista = Maratonista.new

puts "jogador de futebol:"
jogadorDeFutebol.correr
jogadorDeFutebol.competir
puts "maratonista:"
maratonista.correr
maratonista.competir