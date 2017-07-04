require 'pry'
require './lib/node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root == nil
  end

  def insert(score, title) #should return depth as well
    if root == nil
      @root = Node.new(score, title)
      root.depth
    else
      root.insert(score, title)
    end
  end

  def include?(score)
    # Verify/reject the presence of a score in the tree
    if root.score == score
      return true
    else
      root.include?(score)
    end
  end

  def depth_of(score)
    # Reports the depth of the tree where a score appears
    # Return nil if the score does not exist
    if root.score == score
      return root.depth
    else
      root.depth_of(score)
    end
  end

  def max
    # Which movie has the highest score in the list?
    # What is it’s score?
    
  end

  def min
    # Which movie has the lowest score in the list?
    # What is it’s score?
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
