class Robot

	attr_reader :position, :health

	CAPACITY = 250

	def initialize
		@position = [0,0]
		@items = []
		@weight_carried = 0
		@health = 100
		@hitpoints = 5
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
		if item[1] < CAPACITY
			items << item
			return true
		else
			return false
		end
	end

	def items_weight(item)
		weight_of_item = item[1]
		@weight_carried += weight_of_item
	end

	def wound(damage)
		@health -= damage
		if @health < 0
			 @health = 0			
		end
	end

	def attack(enemy)
		enemy.wound(@hitpoints)
	end

	def heal(healing_power)
		@health += healing_power
		if @health > 100
			@health =100
		end
	end



end
