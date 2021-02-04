require 'csv'
require_relative 'personas' # Clases Persona, Profesor, Alumno
require_relative 'curso' # Clase Curso

class Main
    def initialize
        puts "Bienvenidos a la aplicación"
    end
end

file_prof = CSV.open("csv_profesores.csv")
file_alum = CSV.open("csv_alumnos.csv")
profesores = Array.new
alumnos = Array.new
id_alumnos = Hash.new # Diccionario de id => alumno

file_alum.each do |id_alum, nom_alum, edad_alum, major|
    alumno = Alumno.new(id_alum, nom_alum, edad_alum, major)
    alumnos.append(alumno)
    id_alumnos[id_alum] = alumno
end

file_prof.each do |id_prof, nom_prof, edad_prof, sigla, notas| # id, nom, edad, notas
    profesor = Profesor.new(id_prof, nom_prof, edad_prof, sigla, notas)
    profesores.append(profesor)
    profesor.lista_alumnos.each do |id_alum, nota|
       if id_alumnos[id_alum] != nil
            id_alumnos[id_alum].anadir_notas([sigla, nota])
       end
    end
end

# Ahora se asigna a cada alumno su respectiva 
30.times{print "-"}
puts ""
print profesores
puts notas_por_alumno