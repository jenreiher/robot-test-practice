class Laser < Weapon

	attr_reader :name, :weight, :damage

	def initialize
		super("Laser", 125, 25)
		@range = 1
	end

end