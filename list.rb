class List

	attr_accessor :first, :last, :count

	def initialize(first = nil, last = nil, count = 0)
		self.first = first
		self.last = last
		self.count = count
	end

end