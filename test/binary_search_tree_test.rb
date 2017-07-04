require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  # test if tree exists
  def test_if_tree_exists
    tree = BinarySearchTree.new
    assert tree
  end
  # test if node exists
  def test_if_node_exists
    node = Node.new(50, "movie a")
    assert node
  end
  # test node holds correct values
  def test_if_node_has_score_and_title
    node = Node.new(50, "movie a")
    assert_equal "movie a", node.title
    assert_equal 50, node.score
  end
  # test that tree starts empty
  def test_tree_starts_empty
    tree = BinarySearchTree.new
    assert_nil tree.root
  end
  # test that first inserted node is root node
  def test_first_node_is_root_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    assert_equal "movie a", tree.root.title
  end
  # test that new node has two empty branches
  def test_node_starts_with_empty_branches
    node = Node.new(50, "movie a")
    refute node.left_node
    refute node.right_node
  end
  # test that a second node can be inserted to the left
  def test_add_second_node_to_left
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(40, "movie b")
    assert tree.root.left_node
  end
  # test that a second node can be inserted to the right
  def test_add_second_node_to_right
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(60, "movie b")
    assert tree.root.right_node
  end
  # test that a third node can be inserted to the left
  def test_add_third_node_to_left
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(40, "movie b")
    movie_c = tree.insert(30, "movie c")
    assert_equal 2, tree.root.left_node.left_node.depth
  end
  # test that a third node can be inserted to the right
  def test_add_third_node_to_right
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(60, "movie b")
    movie_c = tree.insert(70, "movie c")
    assert_equal 2, tree.root.right_node.right_node.depth
  end
  # test that insert returns depth of root node
  def test_insert_root_node_returns_depth
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    assert_equal 0, tree.root.depth
  end
  # test that second inserted node returns depth
  def test_insert_second_node_returns_depth
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(40, "movie b")
    assert_equal 1, tree.root.left_node.depth
  end
  # test that include? method works
  def test_that_include_method_works
    tree = BinarySearchTree.new
    tree.insert(60, "movie a")
    assert tree.include?(60)
  end
  # test that include? works when there are multiple scores
  def test_that_include_can_search
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    movie_b = tree.insert(40, "movie b")
    assert tree.include?(40)
  end
  # test more cases for include?
  def test_that_include_can_search_more_cases
    tree = BinarySearchTree.new
    tree.insert(50, "movie a")
    tree.insert(24, "movie b")
    tree.insert(75, "movie c")
    tree.insert(34, "movie d")
    tree.insert(46, "movie e")
    tree.insert(68, "movie f")
    tree.insert(52, "movie g")
    tree.insert(65, "movie h")
    tree.insert(43, "movie i")
    assert tree.include?(52)
  end
end
