# Se crea la clase Curso que contiene la sigla y la lista
# con los respectivas notas 
class Curso
    attr_accessor :sigla, :informacion
    def initialize(sigla)
        @sigla = sigla
        @informacion = Hash.new #ID y notas
    end

    def anadir_alum_nota(lista)
        lista.each do |id, nota|
            informacion[id] = nota
        end
    end

    def mejor_nota
        notas_ordenadas = informacion.sort_by{ |key, nota| nota }
        id, nota = notas_ordenadas[-1]
        mensaje = "La mejor nota del curso #{sigla} es #{nota} del alumno #{id}"
        return mensaje
    end
    
    def nota_promedio
        solo_notas = informacion.keys.sum / informacion.keys.length
        return solo_notas
    end

    def top_n_notas(cantidad)
        ordenadas = informacion.values.sort.reverse
        if cantidad > informacion.length
            puts "Solo hay #{informacion.length} alumnos"
            
        end
    end
end

curso = Curso.new("IIC2121")
curso.anadir_alum_nota([["1234", 3.4], ["1444", 2.1], ["3123", 5.3]])
respuesta = curso.top_n_notas(4)