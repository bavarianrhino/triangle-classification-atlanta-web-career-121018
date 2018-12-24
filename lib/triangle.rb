


#Scalene Triangle - is a triangle that has no equal sides.
#Isosceles Triangle - is a triangle that has two equal sides.
#Equilateral Triangle - is a triangle that has three equal sides

class Triangle

    attr_accessor :side_1, :side_2, :side_3
    @@all = []

    def initialize (side_1, side_2, side_3)
        @side_1 = side_1
        @side_2 = side_2
        @side_3 = side_3
        @@all << self
    end

    def sides_longer_than_zero?(side_1, side_2, side_3)
        if (0 >= side_1) || (0 >= side_2) || (0 >= side_3)
            false
        else
            true
        end
    end

    def sum_of_two_sides?(side_1, side_2, side_3)
        if (side_3 >= side_1 + side_2) || (side_2 >= side_1 + side_3) || (side_1 >= side_2 + side_3)
            false
        else
            true
        end
    end

    def kind
        if !sum_of_two_sides?(@side_1, @side_2, @side_3) || !sides_longer_than_zero?(@side_1, @side_2, @side_3)
            begin
                raise TriangleError
            end
        else
            if @side_1 == @side_2 && @side_2 == @side_3 && @side_3 == @side_1
                :equilateral
            elsif @side_1 == @side_2 || @side_2 == @side_3 || @side_3 == @side_1
                :isosceles
            elsif @side_1 != @side_2 || @side_2 != @side_3 || @side_3 != @side_1
                :scalene
            end
        end
    end

    class TriangleError < StandardError
        def message
            "The given triangle is an invalid triangle. Please pass a valid triangle through the #kind instance method"
        end
    end
    
end
