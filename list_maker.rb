load 'list.rb'
load 'node.rb'

class ListMaker

	attr_accessor :list

	def initialize(list = nil)
		if list
			self.list = list
		else
			self.create_list
		end
	end

	def push(value)
		if self.list.first.nil?
			new_node = Node.new(nil, nil, value)
			new_node.n_node = new_node
			new_node.p_node = new_node
			self.list.first = new_node
			self.list.last = self.list.first
			self.list.count += self.list.count
		else
			new_node = Node.new(self.list.first, self.list.first, value)
			self.list.last = new_node
		end
		return new_node
	end

	def unshift(value)
		if self.list.first.nil?
			#then we have nothing, so set first and last to be the node
			# this nodes previous and next nodes should be itself
			node = Node.new(nil, nil, value)
			node.p_node = node
			node.n_node = node
			self.list.last = node
		else
			# if we do have a first node, we also have a last one and were going to
			# set the first node to the new node value
			# the first nodes previous node should now be the node we just unshifted on
			# the last nodes next node should now be the node we just unshifted on
			old_first = self.list.first
			# the node shifted on's next node is the old first, and the previous is the last
			node = Node.new(old_first, self.list.last, value)
			self.list.first.p_node = node
			self.list.last.n_node = node
		end
		# the first node kept track of by the list object has changed, set it to the new
		# node no matter what, increment the count
		self.list.first = node
		self.list.count += self.list.count
		return node
	end

	def create_list
		self.list = List.new unless self.list
	end

# push, pop, shift, unshift, remove(shift and pop should delegate to this maybe)

end