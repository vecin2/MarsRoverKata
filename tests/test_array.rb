require "test/unit"
class TestArray < Test::Unit::TestCase
  def setup
    @my_array=['a','b']
  end
  def test_accesors
    assert_equal('a', @my_array[0])
    assert_equal('b', @my_array[-1])
    assert_equal('a', @my_array[-2])
  end
  def test_index
    assert_equal(0, @my_array.index('a'))
    assert_equal(1, @my_array.index('b'))
  end
  
end