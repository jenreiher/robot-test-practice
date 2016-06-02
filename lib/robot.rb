class Robot

	attr_reader :position, :health, :weight_carried, :items
	attr_accessor :equipped_weapon

	CAPACITY = 250

	def initialize
		@position = [0,0]
		@items = []
		@health = 100
		@hitpoints = 5
		@equipped_weapon = nil
	end

	def move_left
		position[0] -= 1
	end

	def move_right
		position[0] += 1
	end

	def move_up
		position[1] += 1
	end

	def move_down
		position[1] -= 1
	end

	def items
		@items
	end

	def pick_up(item)
		if can_pickup?(item)
			if item.is_a?(Weapon)
				@equipped_weapon = item
			end
			items << item
			return true
		end
	end

	def can_pickup?(item)
		(item.weight + items_weight) <= 250	
	end

	def items_weight
		total_weight = 0
		items.each do |item|
			total_weight += item.weight
		end
		return total_weight
	end

	def wound(damage)
		@health -= damage
		if @health < 0
			 @health = 0			
		end
	end

	def attack(enemy)
		if @equipped_weapon == nil then 
			enemy.wound(@hitpoints)
		elsif
			@equipped_weapon.hit(enemy)
		end
	end

	def heal(healing_power)
		@health += healing_power
		if @health > 100
			@health =100
		end
	end

end
