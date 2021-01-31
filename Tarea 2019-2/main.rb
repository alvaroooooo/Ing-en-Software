require 'csv'
require_relative 'personas'

class Main
    def initialize
        puts "Bienvenidos a la aplicación"
    end
end

file = CSV.open("csv_profesores.csv")

profesores = []

file.each do |id_prof, nom_prof, edad_prof, notas| # id, nom, edad, notas
    profesor = Profesor.new(id_prof, nom_prof, edad_prof, notas)
    profesores.append(profesor)
end

30.times{print "-"}
puts ""
print profesores