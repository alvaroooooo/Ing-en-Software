class Persona
    attr_reader :nombre, :id, :edad
    def initialize(id, nombre, edad)
        @nombre = nombre
        @id = id
        @edad = edad.to_i
    end

    def to_s
        "Soy #{nombre} y mi edad es #{edad}"
    end
end


class Profesor < Persona
    
    def initialize(id, nombre, edad, major)
        super(nombre, email)
        @id = id
    end
    def cursos_aprobados()
        
    end 
    def cursos_reprobados()

    end
end

class Alumno < Persona

    def initialize(id, nombre, edad, sigla_curso)
        super(id, nombre, edad)
        @sigla_curso = sigla_curso
    end
    
    def cantidad_de_alumnos()

    end
end

p1 = Alumno.new(123, "juanito", "23", "ICC2322")
print(p1)