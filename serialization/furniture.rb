class Furniture
  def initialize(category, primary_material)
    @category = category
    @primary_material = primary_material
  end

  def to_s
    "Category: #{@category} \nMaterial: #{@primary_material}\n"
  end
end

class WoodenBed < Furniture
  def initialize(size, color)
    super('Bed', 'Wooden')
    @size = size
    @color = color
  end

  def to_s
    "#{super} Size: #{@size} \n Color: #{@color} \n"
  end
end

class KingSizeWoodenBed < WoodenBed
  def initialize(height, width)
    super('King Size', 'black')
    @height = height
    @width = width
  end

  def to_s
    "#{super}  Height: #{@height} \n  Width: #{@width} \n"
  end
end
