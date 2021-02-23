require 'csv'
require_relative 'personas' # Clases Persona, Profesor, Alumno
require_relative 'clase'    # Clase Curso
require_relative 'pruebas'  # Variables "@funciones" y "@msj_error"


file_prof = CSV.open("csv_profesores.csv")
file_alum = CSV.open("csv_alumnos.csv")
file_consultas = CSV.open("acciones_prueba.csv") # Cambiar el path de esto despues

profesores = Array.new  # Todos los profesores |Relacion 1 a 1|
cursos = Array.new      # Todos los cursos     |Relacion 1 a 1|
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

class Main
    attr_accessor :funciones, :cursos, :id_alumnos, :alumnos, :msj_error
    def initialize(funciones)
        @funciones = funciones
        definitions # Funcion que descarga todos los documentos
        @msj_error = '***ERROR EN LA CONSULTA***'
        msg_entrada # Bienvenida a la aplicación
    end

    def msg_entrada
        28.times { print "-" } #Imprime
        puts "\nBienvenidos a la aplicación"
        28.times { print "-" } #Imprime
        puts ""
    end

    def definitions
        file_prof = CSV.open("csv_profesores.csv")
        file_alum = CSV.open("csv_alumnos.csv")

        profesores = Array.new  # Todos los profesores |Relacion 1 a 1|
        @cursos = Array.new      # Todos los cursos     |Relacion 1 a 1|
        @alumnos = Array.new     # Todos los alumnos 
        @id_alumnos = Hash.new   # Diccionario de id => alumno

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
    end

    def leer_consultas(path)
        file_consultas = CSV.open(path)
        file_consultas.each do |linea|
            consulta = linea[0]
            args = linea[1..-1] # Aca van los argumentos
            requerimientos = @funciones[consulta] # Requerimientos de consulta
            resp_1 = cumple_req(requerimientos, args)
            func_a_ejecutar = belong(requerimientos[1], consulta, args)
            if resp_1 == TRUE and func_a_ejecutar != nil
                puts func_a_ejecutar.send(consulta, *args[1..-1])
                p "Se ejecuta la funcion #{consulta}"
            else
                puts msj_error
            end
        end
    end

    def cumple_req(requerimientos, args)
        if args.length == requerimientos[0]
            return TRUE
        else 
            return FALSE
        end
    end

    def belong(tipo_consulta, consulta, args)
        if tipo_consulta == "alumno"
            return id_alumnos[args[0]]
        else
            p "Otro tipo de consulta"
        end
    end
end

running = Main.new(@funciones)
running.leer_consultas("acciones_prueba.csv")
