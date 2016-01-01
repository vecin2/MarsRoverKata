class MarsRobot
  FORWARD='f'
  BACKWARD='b'
  LEFT='l'
  RIGHT='r'

  def initialize(position)
    @position= position
  end
  
  def self.create(position)
    return MarsRobot.new(position)
  end
  
  def move(sequence)
    sequence.scan( /./ ) { |c| move_one(c) }
  end
  
  def move_one(command)
    if command == LEFT 
      @position=@position.left();
    elsif command == RIGHT
      @position = @position.right()
    elsif command == FORWARD
      @position =@position.advance(1)
    elsif command == BACKWARD
      @position =@position.advance(-1)
    end
  end
  private :move_one
  
  def string_position
    @position.to_str
  end
end