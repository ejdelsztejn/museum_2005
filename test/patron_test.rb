require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < MiniTest::Test
  def test_it_exists
    patron = Patron.new("Bob", 20)

    assert_instance_of Patron, patron
  end
end
