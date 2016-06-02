class Item

	attr_reader :name, :weight

	def initialize(name, weight)
		@name = name
		@weight = weight
	end

	def feed(who_to_feed)
		who_to_feed.heal(20)
	end
end