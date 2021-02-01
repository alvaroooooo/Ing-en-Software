class Curso
    attr_accessor :informacion, :sigla
    def initialize(sigla, informacion)
        @sigla = sigla 
        @informacion = informacion
        # Info es una hash table que contiene id : nota_alumno
    end

    def mejor_nota
        mayor = informacion.values.max
        nom_mayores = Array.new
        informacion.each do |key, value|
            if value == mayor
                nom_mayores.append(key)
            end
        end
        puts "La mejor nota es #{mayor} de #{nom_mayores.join(", ")}"
    end

    def nota_promedio
        notas = informacion.values
        average = (notas.sum / notas.size).round(2)
        puts "El promedio es #{average}"
    end
    
    def top_n_notas(cantidad_req)
        notas_orden = informacion.values.sort.reverse
        p notas_orden
        puts notas_orden.slice(0,cantidad_req)
    end

    def alumnos_reprobados
        list_reprobados = Array.new
        informacion.each do |id, nota|
            if nota <= 4
                list_reprobados.append("#{id} con un #{nota}")
            end
        end
        puts list_reprobados
    end
end

# Clase de prueba 
curso = Curso.new("ICS2313", {"1231" => 5.2, "1432" => 6, "5432" => 5.5, "9231" => 3.2, "4141" => 3.8})

curso.mejor_nota
curso.nota_promedio
curso.top_n_notas(2)
curso.alumnos_reprobados
