# frozen_string_literal: true

require_relative 'node'

# Class for balanced binary search tree
class Tree
  attr_reader :root

  def initialize(array = [])
    @root = build_tree(array)
  end

  def pretty_print(node: root, prefix: '', is_left: true)
    pretty_print(node: node.right, prefix: "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node: node.left, prefix: "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def insert(value)
    self.root = bst_insert(root, value)
  end

  def delete(value)
    self.root = bst_delete(root, value)
  end

  def find(value)
    find_node(root, value)
  end

  def level_order(&block)
    if block_given?
      level_order_traversal(root, &block)
    else
      level_order_values(root)
    end
  end

  def inorder(&block)
    if block_given?
      inorder_traversal(root, &block)
    else
      values = []
      inorder_values(root, values)
      values
    end
  end

  def preorder(&block)
    if block_given?
      preorder_traversal(root, &block)
    else
      values = []
      preorder_values(root, values)
      values
    end
  end

  private

  attr_writer :root

  def build_tree(array)
    sorted_set = array.sort.uniq
    array_to_balanced_bst(sorted_set, 0, sorted_set.length - 1)
  end

  def array_to_balanced_bst(array, first_idx, last_idx)
    return nil if first_idx > last_idx

    middle_idx = first_idx + (last_idx - first_idx) / 2

    node = Node.new(data: array[middle_idx])

    node.left = array_to_balanced_bst(array, first_idx, middle_idx - 1)
    node.right = array_to_balanced_bst(array, middle_idx + 1, last_idx)

    node
  end

  def bst_insert(root, value)
    return Node.new(data: value) if root.nil?

    root.left = bst_insert(root.left, value) if value < root.data
    root.right = bst_insert(root.right, value) if value > root.data

    root
  end

  def bst_delete(root, value)
    return nil if root.nil?

    if value < root.data
      root.left = bst_delete(root.left, value)
    elsif value > root.data
      root.right = bst_delete(root.right, value)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      successor = successor(root)
      root.data = successor.data
      root.right = bst_delete(root.right, successor.data)
    end

    root
  end

  def successor(root)
    current = root.right
    current = current.left until current.nil? || current.left.nil?
    current
  end

  def find_node(root, value)
    return nil if root.nil?
    return root if value == root.data

    if value < root.data
      find_node(root.left, value)
    else
      find_node(root.right, value)
    end
  end

  def level_order_traversal(root, &block)
    return if root.nil?

    queue = [root]

    until queue.empty?
      node = queue.shift
      block.call(node)
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  def level_order_values(root)
    return [] if root.nil?

    values = []
    queue = [root]

    until queue.empty?
      node = queue.shift
      values << node.data
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end

    values
  end

  def inorder_traversal(root, &block)
    return if root.nil?

    inorder_traversal(root.left, &block)
    block.call(root)
    inorder_traversal(root.right, &block)
  end

  def inorder_values(root, values)
    return if root.nil?

    inorder_values(root.left, values)
    values << root.data
    inorder_values(root.right, values)
  end

  def preorder_traversal(root, &block)
    return if root.nil?

    block.call(root)
    preorder_traversal(root.left, &block)
    preorder_traversal(root.right, &block)
  end

  def preorder_values(root, values)
    return if root.nil?

    values << root.data
    preorder_values(root.left, values)
    preorder_values(root.right, values)
  end
end
