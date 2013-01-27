module Po
	def self.pandaName()
		# Introduction
		puts "Hi, my name is Po, and I fulfilled my lifelong dream to be a Kung Fu Warrior!!!"
	end

	def self.taunt(tauntWho)
		# Different taunts for different foes
		if tauntWho != "Tai Leung"
			puts "What's the matter warrior boy? Afraid to fight an overweight, food-loving, panda?!?!?\n"
		else
			puts "Well well, big bad Tai Leung at last! Can't wait till you find out the Dragon Scroll is just an empty piece of paper!\n"
		end
	end

	def self.fight()
		puts "Get ready! Po the Panda's coming for Yuuuuu! Get it, Yu, get it, Yu...anyone? No?\n"
	end

	def self.aikiMove()
		puts "Bonus time!!! Had to throw some Aikido in there you know...\n"

	end

	def self.retreat()
		puts "Just not my day I guess.\n"
	end
end