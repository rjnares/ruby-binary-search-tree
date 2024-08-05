# frozen_string_literal: true

require_relative 'lib/tree'

random_num_array = Array.new(15) { rand(1..100) }

tree = Tree.new(random_num_array)

puts "Tree of #{random_num_array.length} random values"
puts

tree.pretty_print

puts
puts "Tree is balanced: #{tree.balanced?}"
puts
puts "Level-order values: #{tree.level_order}"
puts
puts "Pre-order values: #{tree.preorder}"
puts
puts "Post-order values: #{tree.postorder}"
puts
puts "In-order values: #{tree.inorder}"
puts
puts 'Unbalancing tree...'
puts

tree.insert(105)
tree.insert(200)
tree.insert(150)
tree.insert(180)
tree.insert(115)
tree.insert(195)
tree.insert(140)

tree.pretty_print

puts
puts "Tree is balanced: #{tree.balanced?}"
puts
puts 'Balancing tree...'
puts

tree.rebalance

tree.pretty_print

puts
puts "Tree is balanced: #{tree.balanced?}"
puts
puts "Level-order values: #{tree.level_order}"
puts
puts "Pre-order values: #{tree.preorder}"
puts
puts "Post-order values: #{tree.postorder}"
puts
puts "In-order values: #{tree.inorder}"
