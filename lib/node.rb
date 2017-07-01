require 'pry'
class Node
  attr_reader   :title_and_score
  attr_accessor :left_node,
                :right_node,
                :depth
  # needs to store title and score, left node, right node, and depth
  def initialize(title, score)
    @title_and_score = [title, score]
    @left_node = nil
    @right_node = nil
    @depth = 0
  end

  def title
    @title_and_score[0]
  end

  def score
    @title_and_score[1]
  end

  def insert(title, score)
    if self.score < score
      move_right(title, score)
    else
      move_left(title, score)
    end
  end

  def move_left(title, score)
    if left_node.nil?
      @left_node = Node.new(title, score)
      @left_node.depth = depth + 1
    else
      left_node.insert(title, score)
    end
  end

  def move_right(title, score)
    if right_node.nil?
      @right_node = Node.new(title, score)
      @right_node.depth = depth + 1
    else
      right_node.insert(title, score)
    end
  end
end
