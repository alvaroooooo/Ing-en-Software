require 'csv'
require_relative 'clase1'

puts "Buenas tardes"
file = CSV.read("csv_alumnos.csv")

file.each do |id, nombre, nota, carrera|
    puts "El id del alumno #{nombre} es #{id}"
end

p_1 = Alumno.new("12", "Juan", "Juan", "ICC2223")
puts p_1