class Laser < Weapon

	attr_reader :name, :weight, :damage

	def initialize
		super("Laser", 125, 25)
		#@name = "Laser"
		#@weight = 125
		#@damage = 25
	end

end