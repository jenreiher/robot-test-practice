class Weapon < Item

	attr_reader :name, :weight, :damage

	def initialize(name, weight, damage)
		@name = "power_shock"
		@weight = 10
		@damage = 45
	end

	def hit(who_to_hit)
		who_to_hit.wound(@damage)

	end

end