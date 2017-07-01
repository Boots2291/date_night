require 'pry'
require './lib/node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root == nil
  end

  def insert(title, score) #should return depth as well
    if root == nil
      @root = Node.new(title, score)
    else
      root.insert(title, score)
    end
  end

  def include?

  end

  def depth_of

  end

  def max

  end

  def min

  end

  def sort

  end

  def load

  end

  def health

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
