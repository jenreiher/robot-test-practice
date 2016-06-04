class Robot

	attr_reader :position, :weight_carried, :items, :health
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
		# try to pickup the item
		if can_pickup?(item)
			# the item was not too heavy :)
			@items << item
			# the item is picked up

			if item.is_a?(Weapon)
				# the item was a weapon :)
					@equipped_weapon = item
					# the weapon was properly equipped
			end

			if item.is_a?(BoxOfBolts) 
				# the item is b.o.b.
				if health <= 80
					# check if the health is high enough to heal
					item.feed(self)
					# feed the robot the bolts
					#return true
				end
				
			end

			return true

		else 
			return false
			# the item was too heavy :()
		end

	end

	def can_pickup?(item)
		(item.weight + items_weight) <= CAPACITY	
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

		if weapon_equipped?

			if is_equipped_grenade? && (enemy.position[1] == (self.position[1] + 2)) || (enemy.position[1] == (self.position[1] - 2 ))
				@equipped_weapon.hit(enemy)
				@equipped_weapon = nil
				return true	
			elsif !is_equipped_grenade? && (enemy.position[1] == (self.position[1] + 1)) || (enemy.position[1] == (self.position[1] - 1 ))
				@equipped_weapon.hit(enemy)
			end

		elsif !weapon_equipped?

			if (enemy.position[1] == (self.position[1] + 1)) || (enemy.position[1] == (self.position[1] - 1 ))
				enemy.wound(@hitpoints)
				return true
			else
				return false
			end			

		end

		return false

	end

	def weapon_equipped?
		@equipped_weapon != nil
	end

	def is_equipped_grenade?
		@equipped_weapon.is_a?(Grenade)
	end

	def heal(healing_power)
		@health += healing_power
		if @health > 100
			@health = 100
		end
	end

	def heal!(healing_power)
		if @health < 0
			raise "Zombie robots not allowed!"
		else
			@health += healing_power
		end

	end

end
