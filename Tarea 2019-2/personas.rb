require 'csv'
require 'clase1.rb'

file = CSV.read("csv_alumnos.csv")

file.each do |id, nombre, nota, carrera|
    puts "El id del alumno #{nombre} es #{id}"
end

p_1 = Alumno("12", "Juan", "Juan", "ICC2223")