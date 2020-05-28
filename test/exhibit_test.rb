require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require 'pry'
require 'byebug'

class ExhibitTest < MiniTest::Test
  def test_it_exists
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    assert_instance_of Exhibit, exhibit
  end

  def test_it_has_attributes
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    assert_equal "Gems and Minerals", exhibit.name
    assert_equal 0, exhibit.cost
  end

  def test_it_can_have_patrons
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest(exhibit.name)
    
    patron_2 = Patron.new("Carol", 43)
    patron_2.add_interest("Not This Exhibit's Name")


    patron_list = [patron_1, patron_2]

    assert_equal exhibit.patrons(patron_list).include?(patron_1), true
    assert_equal exhibit.patrons(patron_list).include?(patron_2), false
  end
  
end
