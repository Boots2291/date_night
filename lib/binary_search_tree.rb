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
      root.include?(score)
  end

  def depth_of(score)
      root.depth_of(score)
  end

  def max(node = root)
    if node.right_node.nil?
      node.data
    else
      max(node.right_node)
    end
  end

  def min(node = root)
    if node.left_node.nil?
      node.data
    else
      min(node.left_node)
    end
  end

  def sort(node = root, sorted = [])
    return sorted if node == nil
    sort(node.left_node, sorted)
    sorted << node.data
    sort(node.right_node, sorted)
  end

  def load
    counter = 0
    File.open("./lib/movies.txt").readlines.each do |line|
      eachline = line.strip.split(", ", 2)
      if root && root.include?(eachline[0].to_i)
        return
      else
        insert(eachline[0].to_i, eachline[1])
        counter += 1
      end
    end
    counter
  end

  def health(depth)
    get_nodes_at_depth(depth).map do |node|
      children = node_count(node)
      total = node_count
      [node.score,
      node_count(node),
      ((children.to_f / total.to_f) * 100).floor]
    end
  end

  def get_nodes_at_depth(depth, node = root, nodes = [])
    return nodes if node == nil
    get_nodes_at_depth(depth, node.left_node, nodes)
    if node.depth == depth
      nodes << node
    end
    get_nodes_at_depth(depth, node.right_node, nodes)
  end

  def node_count(node = root, count = [])
    return count if node == nil
    node_count(node.left_node, count)
    count << node.title
    node_count(node.right_node, count)
    count.length
  end

  def count_children(score, node = root, count = ["root"], depth = @depth)
    return count if node == nil
    count_children(score, node.left_node, count)
    if node.depth < depth
      count << node.title
    end
    count_children(score, node.right_node, count)
    count.length
  end
  # Extensions
  def leaves(node = root, count = [])
    return count if node == nil
    leaves(node.left_node, count)
    if node.left_node.nil? && node.right_node.nil?
      count << node.title
    end
    leaves(node.right_node, count)
    count.length
  end
  #
  # def height
  #
  # end
end
