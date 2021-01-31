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
    
    def initialize(id, nombre, edad, major)
        super(id, nombre, edad)
        @major = major
    end

    def cursos_aprobados
        p "Esta es la cantidad de cursos aprobados"
    end 

    def cursos_reprobados
    end
end

class Profesor < Persona

    def initialize(id, nombre, edad, sigla_curso)
        super(id, nombre, edad)
        @sigla_curso = sigla_curso
    end
    
    def cantidad_de_alumnos()
        puts "\nHola a todos, me llamaron"
    end
end

