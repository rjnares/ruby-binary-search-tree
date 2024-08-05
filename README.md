# Ruby Binary Search Tree

This is my implementation of the [Binary Search Tree](https://www.theodinproject.com/lessons/ruby-binary-search-trees) project assigned in the [Computer Science](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#a-bit-of-computer-science) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from [The Odin Project](https://www.theodinproject.com/).

## Project Description

The main goal of this project was to implement a balanced binary search tree data structure to understand how it stores and operates on data internally, and to apply various tree traversal strategies.

### Classes

My implementation includes the following classes:
* A `Node` class consisting of a data value, left child node link, and right child node link
* A `Tree` class representing a binary tree of connected `Node` objects

#### Node Class

The `Node` class contains the following instance methods:
* `#data` reads and writes the `data` instance variable value
* `#left` reads and writes the `left` instance variable value for the left child
* `#right` reads and writes the `right` instance variable value for the right child

#### Tree Class

The `Tree` class contains the following instance methods:
* `#root` reads the `root` instance variable value for the root `Node` of the tree, or `nil` if one does not exist
* `#build_tree(array)` builds a balanced binary tree using a sorted array of unique values
* `#insert(value)` creates and inserts a new `Node` object with the given `value` if it does not exist in the tree
* `#delete(value)` deletes a `Node` object with the given `value` if it exists in the tree
* `#find(value)` returns a `Node` with the given `value` if it exists in the tree, or `nil` otherwise
* `#level_order` returns an array of level-order values if a block is not given, otherwise, it will traverse the tree in level-order and yield each node to the given block
* `#inorder` returns an array of inorder values if a block is not given, otherwise, it will traverse the tree inorder and yield each node to the given block
* `#preorder` returns an array of preorder values if a block is not given, otherwise, it will traverse the tree preorder and yield each node to the given block
* `#postorder` returns an array of postorder values if a block is not given, otherwise, it will traverse the tree postorder and yield each node to the given block
* `#height(node)` returns the distance from a given `node` to its deepest leaf node
* `#depth(node)` returns the distance from the root node to the given `node`
* `#balanced?` returns `true` if the tree is balanced, or `false` otherwise
* `#rebalance` rebalances the tree and returns the root