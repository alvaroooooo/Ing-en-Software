require 'csv'
require_relative 'personas' # Clases Persona, Profesor, Alumno
require_relative 'clase'    # Clase Curso
require_relative 'pruebas'  # Diccionario con las funciones

class Main
    def initialize
        puts "Bienvenidos a la aplicación"
    end
end

file_prof = CSV.open("csv_profesores.csv")
file_alum = CSV.open("csv_alumnos.csv")
file_consultas = CSV.open("acciones_prueba.csv")

profesores = Array.new  # Todos los profesores |Relacion 1 a 1
cursos = Array.new      # Todos los cursos     |Relacion 1 a 1
alumnos = Array.new     # Todos los alumnos 
id_alumnos = Hash.new   # Diccionario de id => alumno

file_alum.each do |id_alum, nom_alum, edad_alum, major|
    alumno = Alumno.new(id_alum, nom_alum, edad_alum, major)
    alumnos.append(alumno)
    id_alumnos[id_alum] = alumno
end

file_prof.each do |id_prof, nom_prof, edad_prof, sigla, notas| # id, nom, edad, notas
    profesor = Profesor.new(id_prof, nom_prof, edad_prof, sigla, notas)
    list_notas = Profesor.procesar_lista(notas)
    curso = Curso.new(sigla, list_notas)
    cursos.append(curso)
    profesores.append(profesor)
    profesor.lista_alumnos.each do |id_alum, nota|
       if id_alumnos[id_alum] != nil
            id_alumnos[id_alum].anadir_notas([sigla, nota])
       end
    end
end

file_consultas.each do |consulta|
    p consulta[0]
end


# puts "Bienvenidos a la aplicación"
# 30.times{print "-"}
# print("\n")
# p cursos

