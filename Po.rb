class PoPower

attr_accessor :speed, :stamina, :power

	@@name
	@@pandapower ||={}

	#adding a name option and some flattery -eej
	def initialize(name)
	print "Hello, ",name,". Will you live up to your title of the chosen one?\n"
	@@name=name
	end
	
	#all of the poenergy attributes, comments and checks are new - eej

	def self.speed(poenergy)
		print "What is your speed?"
		speed=gets.strip.to_i
		until speed !=0
			print "You need to have some speed, and it needs to be a number, ",@@name,". You are causing problems. I won't quit on you though. Try again.\n"
			speed=gets.strip
		end
	
		until speed<=poenergy
			print "Speed needs to be less than 10. Re enter speed.\n"
			speed=gets.to_i
		end
		speed

	end
	
	def self.stamina(poenergy)
		stamina=gets.strip.to_i
		until stamina.to_i != 0
			puts "You have to have stamina and it needs to be in number form. You are causing problems. I won't quit on you though. Try again. available energy = " 
			print poenergy,"\n"
			stamina=gets.strip
		end		
			stamina=stamina.to_i
		until stamina<=poenergy
			print "Not enough attribute points available. Re enter stamina. Available energy: "
			stamina=gets.to_i			
			p poenergy,"\n"
		end
		stamina
	end		
	
	def self.power(poenergy)
		power=gets.strip.to_i
		until power != 0
		puts	"You need power and it needs to be a number. Don't give me this silliness. You are causing problems. I won't quit on you though. Try again. available energy = " 
			p poenergy
			power=gets.strip
		end
		power=power.to_i		
		until power<=poenergy
			print "Not enough attribute points available. Re enter power. Available energy: "
			p poenergy
			power=gets.to_i
			self.power(poenergy)
		end
		power	
	end	


	def self.pandaName()
		# Introduction
		print "Hi, my name is",@@name,", and I fulfilled my lifelong dream to be a Kung Fu Warrior!!! I'm also not human, which makes me a real trailblazer in the field of Kung Fu" #adding the player's name -eej
	end

	def self.taunt(tauntWho)
		# 	Different taunts for different foes
		if tauntWho != "Tai Lung"
			puts "What's the matter warrior boy? Afraid to fight an overweight, food-loving, panda?!?!?\n"
		else
			puts "Well well, big bad Tai Lung at last! Can't wait till you find out the Dragon Scroll is just an empty piece of paper!\n"
		end
	end

	def self.fight(foepower,pandapower)
		puts "Get ready! ",@@name," the Panda's coming for Yuuuuu! Get it, Yu, get it, Yu...anyone? No?\n" #adding name
		winner=rand(-foepower..pandapower)
		print "foepower is: \n"
		p foepower
		print "pandapower: \n"
		p pandapower
		print "the winner is: \n"		
		p winner
		winner
	end

	def self.aikiMove()
		puts "Bonus time!!! Had to throw some Aikido in there you know...\n"
	end

	def self.retreat(foewill,pandaspeed)
		puts "Just not my day I guess.\n"
		escape=rand(-foewill..pandaspeed)
		print "Your escape result: "
		p escape
		if escape>=0
			print "you made it out alive. Don't worry about what he says\n"
		elsif escape<0
			print "You were caught and devoured shortly after running away like a coward\n"	
		end
		escape
	end
end
