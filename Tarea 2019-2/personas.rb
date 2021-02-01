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
    attr_accessor :lista_alumnos

    def initialize(id, nombre, edad, sigla_curso, lista_alumnos)
        super(id, nombre, edad)
        @sigla_curso = sigla_curso
        @lista_alumnos = procesar_lista(lista_alumnos)
    end
    
    def cantidad_de_alumnos()
        puts "\nHola a todos, me llamaron"
    end

    def procesar_lista(lista)
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

#coso = Profesor.procesar_lista("4101:6.8-4123:4.2")
new_profe = Profesor.new("3213", "Juanito", "32", "ICS2132","4101:6.8-4123:4.2")
p new_profe.lista_alumnos

