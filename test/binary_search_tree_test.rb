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
    node = Node.new("movie", 50)
    assert node
  end
  # test node holds correct values
  def test_if_node_has_score_and_title
    node = Node.new("movie", 50)
    assert_equal "movie", node.title
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
    tree.insert("movie", 50)
    assert_equal "movie", tree.root.title
  end
  # test that new node has two empty branches
  def test_node_starts_with_empty_branches
    node = Node.new("movie", 50)
    refute node.left_node
    refute node.right_node
  end
  # test that a second node can be inserted to the left
  def test_add_second_node_to_left
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    movie_b = tree.insert("movie b", 40)
    assert tree.root.left_node
  end
  # test that a second node can be inserted to the right
  def test_add_second_node_to_right
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    movie_b = tree.insert("movie b", 60)
    assert tree.root.right_node
  end
  # test that a third node can be inserted to the left
  def test_add_third_node_to_left
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    movie_b = tree.insert("movie b", 40)
    movie_c = tree.insert("movie c", 30)
    assert_equal 2, tree.root.left_node.left_node.depth
  end
  # test that a third node can be inserted to the right
  def test_add_third_node_to_right
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    movie_b = tree.insert("movie b", 60)
    movie_c = tree.insert("movie c", 70)
    assert_equal 2, tree.root.right_node.right_node.depth
  end
  # test that insert returns depth of root node
  def test_insert_root_node_returns_depth
    tree = BinarySearchTree.new
    tree.insert("movie", 50)
    assert_equal 0, tree.root.depth
  end
  # test that second inserted node returns depth
  def test_insert_second_node_returns_depth
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    movie_b = tree.insert("movie b", 40)
    assert_equal 1, tree.root.left_node.depth
  end
  # test that include? method works
  def test_that_include_method_works
    tree = BinarySearchTree.new
    tree.insert("movie a", 50)
    assert tree.include?(50)
  end
end
