# frozen_string_literal: true

# Class for tree node containing data, left child, and right child
class Node
  attr_accessor :data, :left, :right

  def initialize(data:, left: nil, right: nil)
    @data = data
    @left = left
    @right = right
  end
end
