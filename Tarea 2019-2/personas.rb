# En este archivo estan las clases "Persona" "Alumno" y "Profesor"
class Persona
    attr_reader :nombre, :id, :edad
    def initialize(id, nombre, edad)
        @nombre = nombre
        @id = id
        @edad = edad.to_i
    end

    def to_s
        "#{nombre}"
    end

    def inspect
        "#{nombre}"
    end
end


class Alumno < Persona
    attr_accessor :cursos_notas
    def initialize(id, nombre, edad, major)
        super(id, nombre, edad)
        @major = major
        @cursos_notas = Hash.new
    end

    def cursos_aprobados
        cursos_notas.each do |curso, nota|
            if nota >= 3.95
                puts "El curso #{curso} fue aprobado con nota #{nota}"
            end
        end
    end 

    def cursos_reprobados
        cursos_notas.each do |curso, nota|
            if nota < 3.95
                puts "El curso #{curso} fue reprobado con nota #{nota}"
            end
        end
    end

    def anadir_notas(sigla_notas)
        sigla, notas = sigla_notas
        cursos_notas[sigla] = notas.to_f
    end
end

class Profesor < Persona
    attr_accessor :lista_alumnos

    def initialize(id, nombre, edad, sigla_curso, lista_alumnos)
        super(id, nombre, edad)
        @sigla_curso = sigla_curso
        @lista_alumnos = self.class.procesar_lista(lista_alumnos)
    end
    
    def cantidad_de_alumnos
        total_alumnos = lista_alumnos.length
        puts "La cantidad de alumnos es #{total_alumnos}"
    end

    def self.procesar_lista(lista)
        por_alumno = lista.split("-")
        ordenado = Array.new
        por_alumno.each do |item|
            item = item.split(":")
            item[1] = item[1].to_f
            ordenado.append(item)
        end
        return ordenado
    end
end
