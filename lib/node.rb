class Node
  # needs to store title and score, left node, right node, and depth
  def initialize(score, title)
    @title_and_score = {title => score} # => creates a hash
    @left = nil
    @right = nil
    @depth = 0
end
