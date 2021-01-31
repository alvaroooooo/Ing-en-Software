
class Numero
    attr_reader :num
    def initialize(num)
        @num = num
    end
    
    def inspect
        "#{num}"
    end
end


num_1 = Numero.new(1)
num_2 = Numero.new(2)
num_3 = Numero.new(5)

puts num_1.num
lista = [num_1, num_3, num_2]


coso = lista.sort_by { |obj| obj.num }
print coso


