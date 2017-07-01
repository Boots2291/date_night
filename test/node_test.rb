require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require 'pry'

class Node < Minitest::Test
  # test if node exists
  def test_if_node_exists
    node = Node.new("movie", 50)
    binding.pry
    assert node
  end

end
