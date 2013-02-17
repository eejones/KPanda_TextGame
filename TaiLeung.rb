#changing his name to TaiLung since apparently that is how the Kung Fun Panda fans spell it. They aren't concerned with the average spelling of 'Leung'.
	
class TaiPower

	#adding an initialize routine to actually use the class -eej
	def initialize(name)
		print "\n TaiLung:\nI will end you ",name,"\n\n"
	end

	def self.snowLeopard(pandapower)
		puts "I was the adopted son of Sifu! Now, death will come to him!\n\n"
	end

	def self.rage()
		puts "Witness my power, in these nerve strikes unknown to all!\n\n"
	end

	def self.kill()
		puts "You've made a big mistake panda. Time to die!\n\n"
	end

	def self.tauntreaction(lifechange)  #adding taunt life change messages - eej
		if lifechange==0
			puts "Your taunts have no effect on me. Life change= "
			p lifechange
		elsif lifechange>0 
			puts " 'Your taunts make me angry!!' -TaiLung's anger has weakened him"
			p lifechange
		elsif lifechange<0 
			puts " 'I'm tired of your insolence! -TaiLung is now stronger as your taunts give him rest"
			p lifechange
		end
	end	
end
