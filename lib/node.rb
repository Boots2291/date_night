require 'pry'
class Node
  attr_reader   :title_and_score
  attr_accessor :left_node
                :right_node
                :depth
  # needs to store title and score, left node, right node, and depth
  def initialize(title, score)
    @title_and_score = [title, score]
    @left = nil
    @right = nil
    @depth = 0
  end

end
