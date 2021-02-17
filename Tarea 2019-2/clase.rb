class Curso
    attr_accessor :informacion, :sigla
    def initialize(sigla, informacion)
        @sigla = sigla 
        @informacion = informacion.to_h{ |id, nota| [id, nota] }
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
        if cantidad_req > informacion.length
            cantidad_req = informacion.length
        end
        notas_orden = informacion.values.sort.reverse
        p notas_orden
        puts notas_orden.slice(0,cantidad_req)
    end

    def alumnos_reprobados
        lista_reprobados = Array.new
        informacion.each do |id, nota|
            if nota <= 4
                lista_reprobados.append("#{id} con un #{nota}")
            end
        end
        puts lista_reprobados
    end

    def inspect
        "Curso #{sigla}"
    end
end