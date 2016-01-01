require "test/unit"
require_relative "../src/main/mars_robot"
require_relative "../src/main/position"
class TestMarsRover < Test::Unit::TestCase
  
  def setup()
    @mars_robot =MarsRobot.create(Position.new(1,1,'S'))
  end
  
  def test_init_robot
    # mars_robot = MarsRobot.create(0,0,'S');
    assert_equal("1,1,S", @mars_robot.string_position()) 
  end
  
  def test_turn
    assert_movement('l',"1,1,E")
    assert_movement('l',"1,1,N")
    assert_movement('l',"1,1,W")
    assert_movement('l',"1,1,S")
    assert_movement('r',"1,1,W")
    assert_movement('r',"1,1,N")
    assert_movement('r',"1,1,E")
    assert_movement('r',"1,1,S")
  end
  
  def test_move_forward_south
    assert_movement('f', "1,2,S")
    assert_movement('f', "1,3,S")
    
  end
  
  def test_move_forward_east
    @mars_robot.move('l')
    assert_movement('f', "2,1,E")
    assert_movement('f', "3,1,E")
  end
  
  def test_move_forward_north
    @mars_robot.move('ll')
    assert_movement('f', "1,0,N")
  end
  
  def test_move_forward_west
    @mars_robot.move('r')
    assert_movement('f', "0,1,W")
  end
  
  def test_move_backward_south
    assert_movement('b', "1,0,S")
  end
  
  def test_move_backward_east
    @mars_robot.move('l')
    assert_movement('b', "0,1,E")
  end
  
  def test_move_backward_north
    @mars_robot.move('ll')
    assert_movement('b', "1,2,N")
  end
  
  def test_move_backward_west
    @mars_robot.move('r')
    assert_movement('b', "2,1,W")
  end
  
  def test_combine_movements
    assert_movement('llfbbr', "1,2,E")
  end
  
  def assert_movement(sequence, end_position)
    @mars_robot.move(sequence)
    assert_equal(end_position, @mars_robot.string_position)
  end
  private :assert_movement
  
end
