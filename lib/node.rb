require 'pry'
class Node
  attr_reader   :title,
                :score,
                :data
  attr_accessor :left_node,
                :right_node,
                :depth
  # needs to store title and score, left node, right node, and depth
  def initialize(score, title)
    @score = score
    @title = title
    @left_node = nil
    @right_node = nil
    @depth = 0
    @data = {title => score}
  end

  def insert(score, title)
    if self.score < score
      insert_right(score, title)
    else
      insert_left(score, title)
    end
  end

  def insert_left(score, title)
    if left_node.nil?
      @left_node = Node.new(score, title)
      @left_node.depth = depth + 1
    else
      left_node.insert(score, title)
    end
  end

  def insert_right(score, title)
    if right_node.nil?
      @right_node = Node.new(score, title)
      @right_node.depth = depth + 1
    else
      right_node.insert(score, title)
    end
  end

  def include?(score)
    if self.score == score
      true
    elsif self.score < score
      include_right(score)
    else
      include_left(score)
    end
  end

  def include_left(score)
    if left_node.nil?
      false
    else
      left_node.include?(score)
    end
  end

  def include_right(score)
    if right_node.nil?
      false
    else
      right_node.include?(score)
    end
  end

  def depth_of(score)
    if self.score == score
      self.depth
    elsif self.score < score
      depth_right(score)
    else
      depth_left(score)
    end
  end

  def depth_left(score)
    if left_node.nil?
      nil
    else
      left_node.depth_of(score)
    end
  end

  def depth_right(score)
    if right_node.nil?
      nil
    else
      right_node.depth_of(score)
    end
  end

end
