class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    arr = []
    arr << side1
    arr << side2
    arr << side3
    hash = arr.tally

    validate_triangle
    if hash.length == 1
      :equilateral
    elsif hash.length == 2
      :isosceles
    else
      :scalene
    
    end
   
  end

  def sides_greater_than_zero
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle
    side1 < side2 + side3 && side2 < side1 + side3 && side3 < side1 + side2 
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero && valid_triangle
  end


  class TriangleError < StandardError
  end

end

