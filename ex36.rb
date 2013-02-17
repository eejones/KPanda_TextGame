# Need the character modules (Po and TaiLung)
require './Po'
require './TaiLeung'

class Game #add attributes to make this more interesting - eej
attr_accessor :speed, :stamina, :power, :life, :clawsharpness, :will

@@poenergy=30
@@pandapower ||={}
@@taipower ||={}
@@foepower ||={}
@@foepower[:life]=10
@@foepower[:will]=5
@@foepower[:clawsharpness]=5
@@taipower[:life]=20
@@taipower[:will]=10
@@taipower[:clawsharpness]=10

#change how the game starts now that there are attributes for po/player's name -eej
def self.precursor
	print "What is your name?"
	name=gets.strip
		if name=="" 
		name="Po"
		end
	@@name=name	
	PoPower.new(name)
	TaiPower.new(name)
	@@name=name	
	print "Hello ",name,". Will you be the panda warrior that we dream of? \n" #more flattery -eej
	@@pandapower[:speed]=PoPower.speed(@@poenergy)
	@@poenergy=@@poenergy-@@pandapower[:speed]
	print "What is your stamina?"
	@@pandapower[:stamina]=PoPower.stamina(@@poenergy)	
	@@poenergy=@@poenergy-@@pandapower[:stamina]
	print "What is your power?"
	@@pandapower[:power]=PoPower.power(@@poenergy)
	@@poenergy=@@poenergy-@@pandapower[:power]
	print "These are your your powers:"
	p @@pandapower
	
	self.startGame()
end

def self.prompt()
	print "> "
end

def self.prisonLevel(whichLevel)
	puts "Level %s is now beginning...\n\n" % whichLevel
end

def self.poDead()
    # End Game
	print "Game over!. ",@@name,". You retreated. Sucks to be you dude. At least you took your best shot to live another day! \n" #changed to better reflect a retreat. -eej
	Process.exit(0)
end

def self.fightTaiLung()
	puts "What would you like to do in the fight against Tai Lung?\n"
	prompt(); which_action = gets.chomp();
	i=5
	tauntcount=0
	if which_action == "taunt"
         	PoPower.taunt("Tai Lung")
        	TaiPower.rage()
		#Adding repercussions (positive or negative depending on taunt count) for TaiLeung -eej
		tauntcount=tauntcount+1
		negativetaunt=0-tauntcount
		lifechange=rand(-tauntcount..3)
		@@taipower[:life]=@@taipower[:life]+lifechange
		TaiPower.tauntreaction(lifechange)
	       	puts "Go for the kill now. Type 'fight' to finish him off!\n\n"
		self.result(lifechange,"taunt")
    	elsif which_action == "fight"
        	puts "Fight to the death dude! No giving up now!\n\n"
        	puts "Try an aiki move to wrap this up.\n\n"
		winner=PoPower.fight(@@taipower[:clawsharpness],@@pandapower[:power])		
		print "This is the name of the winner:"
		print winningname(winner,"TaiLung")
		self.victor(winner,i)
		self.result(winner,"fight")
	elsif which_action == "aikimove"
		puts "Fought and won against Tai Lung! Great job!\n\n"
		Process.exit(0)
	elsif which_action == "retreat"
	        ending=PoPower.retreat(@@taipower[:will],@@pandapower[:speed])
		result(ending,"retreat")
	else
		puts "Make a proper move dude! Don't let Tai Lung get away!\n\n"
		fightTaiLung()
	end
end

def self.startGame()
    # Start at the beginning
	i = 1
	levelBegin = false
	tauntcount=0	
	quit=0
	prisonSetting = <<PRISON_PLOT
	
	goes to the prison where Tai Lung is being kept.\n
	When he arrives, the guards are locked away in a cell and Tai Lung is nowhere to be found.\n
	Now you must navigate the prison, find and fight Tai Lung, and lock him in the prison forever\n\n
PRISON_PLOT
	
	print @@name,prisonSetting
	    # Just fighting regular foes and not Tai Lung until Level 5
	#adding in other results to actions besides just printing out letters
	while i < 5 and @@foepower[:life]>0 and @@pandapower[:stamina]>0 and quit!=1
		if levelBegin == false
		prisonLevel(i)
		levelBegin = true
		end

		if i == 1
			puts "There is 1 enemy on this level."
	        else
			puts "There are #{i} enemies on this level."
        	end

		puts "What do you want to do?\n"
		puts "Choose: taunt, fight, retreat, or aikimove\n"
	        prompt(); po_action = gets.chomp()

	        if po_action == "taunt" and tauntcount<3
			PoPower.taunt("foe")
		        print "Your foe(s) anger is making them weaker. Now try fighting them\n\n" #adding taunt count and actually making the enemy weaker the first 2 times -eej
			tauntcount=tauntcount+1
			print "here is the taunt count: "
			p tauntcount
			print "here is the foe life left: "
			@@foepower[:life]=@@foepower[:life]-1
			p @@foepower[:life]
		elsif po_action == "taunt" and tauntcount >= 3
			print "Your foe's anger is starting to make him stronger now(?). Uh oh."
			@@foepower[:life]=@@foepower[:life]+1
			print "here is the foe life left: "
			tauntcount=tauntcount+1
			p @@foepower[:life]
		elsif po_action == "fight"
			i += 2
			winner=PoPower.fight(@@pandapower[:power],@@foepower[:clawsharpness])
			print "This is the winner from this round: "
			print winningname(winner,"foe")
			self.victor(winner,i)
		elsif po_action == "retreat"
			ending=PoPower.retreat(@@foepower[:will],@@pandapower[:speed])
			ending=ending.to_i
			self.result(ending,po_action)
			quit=1
        	elsif po_action == "aikimove"
			PoPower.aikiMove()
			i = 5
		else
			puts "You need to choose one of 4 moves in Po's repertoire dude. Try again\n\n"
		end

    # Now you can fight Tai Lung
		if i == 5 or @@foepower[:life]<=0
			puts "Entering Level 5...\n"
			puts "Get ready to fight the formerly adopted son of Sifu!\n\n"
			self.fightTaiLung()
		end
	end
	end
	def self.victor(winner,i) #give the attributes meaning as well - eej
		if winner>=0 and i==5
			@@taipower[:life]=@@taipower[:life]-1
			@@taipower[:will]=@@taipower[:will]-1
			@@pandapower[:power]=@@pandapower[:power]-1	
			p @@pandapower
			p @@foepower
			p @@taipower
		elsif winner>=0 and i<5
			@@foepower[:life]=@@foepower[:life]-2
			@@foepower[:will]=@@foepower[:will]-1
			@@pandapower[:power]=@@pandapower[:power]-1	
			p @@pandapower
			p @@foepower
			p @@taipower
		elsif winner<0 and i==5
			@@pandapower[:stamina]=@@pandapower[:stamina]-1
			@@taipower[:clawsharpness]=@@taipower[:clawsharpness]-1
			p @@pandapower
			p @@foepower
			p @@taipower
		elsif winner<0 and i<5
			@@pandapower[:stamina]=@@pandapower[:stamina]-1
			@@taipower[:clawsharpness]=@@taipower[:clawsharpness]-1
			p @@pandapower
			p @@foepower
			p @@taipower
		end
	end

	def self.winningname(winner,enemy)
		if winner>=0
		print @@name,"\n"
		else
		print enemy,"\n"
		end
	end
	def self.result(ending,scene)
		if scene=="retreat" and ending < 0
			print "\n\n You died. Game over. \n"
		elsif scene=="retreat" and ending>=0
			print "\n \n Successful escape \n"
		elsif scene=="fight" and @@pandapower[:stamina]<=0
			print "\n\n You died in battle. Game over. \n"
		elsif scene=="fight" and @@taipower[:life]<=0
			print "\n\n You defeated TaiLung. You have freed the animal world. VICTORY! \n"
		elsif scene=="prefight" and @@foepower[:life]<=0
			print "\n\n You defeated TaiLung's enforcers. \n"
			self.fightTaiLung()
		elsif scene=="fight" and @@pandapower[:stamina]>=0 and @@taipower[:life]>=0
			self.fightTaiLung()
		else
			self.fightTaiLung()		
		end
	end

self.precursor  #new start routine - eej
end
