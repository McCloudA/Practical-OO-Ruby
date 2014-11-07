class RevealingReferences 
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # first - iterate over the array
  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  # second - calculate the diameter of one wheel
  def diameter (wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect { |cell| 
    Wheel.new(cell[0], cell[1]) }
  end

end

bam = [[622, 20], [622, 23], [559, 30], [559, 40]]

puts RevealingReferences.new(bam).diameters

