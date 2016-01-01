class Position
  attr_accessor :x, :y, :direction
  SOUTH='S'
  EAST= 'E'
  NORTH='N'
  WEST='W'
  DIRECTIONS = [NORTH,EAST,SOUTH,WEST]
  def initialize(x,y,direction)
    @x=x
    @y=y
    @direction=direction
    
  end
  
  def advance(index)
    x =@x
    y=@y
    if @direction == SOUTH
      y += index
    elsif @direction == EAST
      x += index
    elsif @direction == NORTH
      y -= index
    elsif @direction == WEST
      x -= index
    end
    return Position.new(x,y, @direction);
  end
  
  def left()
    return turn(-1)
  end
  
  def right()
    return turn(1)
  end
  
  def turn(index)
    direction_index = DIRECTIONS.index(@direction)
    index = direction_index + index
    return Position.new(@x, @y,DIRECTIONS[index%4] )
  end
  
  def to_str
      "#{@x},#{@y},#{@direction}"
  end
  
end