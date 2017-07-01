require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'

class BinarySearchTreeTest < Minitest::Test
  # test if tree exists
  def test_if_tree_exists
    tree = BinarySearchTree.new
    assert tree
  end

  def test_if_node_exists
    node = Node.new("movie", 50)
    assert node
  end

end
