require 'pry'
require './lib/node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root == nil
  end

  def insert(score, title)
    if root == nil
      @root = Node.new(score, title)
      root.depth
    else
      root.insert(score, title)
    end
  end

  def include?(score)
    if root.score == score
      return true
    else
      root.include?(score)
    end
  end

  def depth_of(score)
    if root.score == score
      return root.depth
    else
      root.depth_of(score)
    end
  end

  def max(node = root)
    if node.right_node.nil?
      return node.data
    else
      max(node.right_node)
    end
  end

  def min(node = root)
    if node.left_node.nil?
      return node.data
    else
      min(node.left_node)
    end
  end

  def sort
    # Return an array of all the movies and scores in sorted ascending order
    # Return them as an array of hashes.

  end

  def load
    # Where the return value is the number of movies inserted into the tree
    # If a score is already present in the tree when load is called, ignore it.
  end

  def health
    # Report on the health of the tree by summarizing the number of child nodes
    # (nodes beneath each node) at a given depth.
    #
    # For health, we’re worried about 3 values:
    #   Score of the node
    #   Total number of child nodes including the current node
    #   Percentage of all the nodes that are this node or it’s children

  end

  # Extensions
  # def leaves
  #
  # end
  #
  # def height
  #
  # end
end
