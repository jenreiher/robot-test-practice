class Weapon < Item

	attr_accessor :name, :weight, :damage

	def initialize(name, weight, damage)
		@name = name
		@weight = weight
		@damage = damage
		@range = 1
	end


def name
		@name = "power_shock"
	end

	def weight
		@weight = 10
	end

	def damage
		@damage = 45
	end

	def range
		@range = 1
	end


	def hit(who_to_hit)
		who_to_hit.wound(damage)
	end

end