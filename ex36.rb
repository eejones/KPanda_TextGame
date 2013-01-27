# Need the character modules (Po and TaiLeung)
require './Po'
require './TaiLeung'

def prompt()
	print "> "
end

def prisonLevel(whichLevel)
	puts "Level %s is now beginning...\n\n" % whichLevel
end

def poDead()
    # End Game
	puts "Game over!. You retreated. Sucks to be you dude. Great fighting skills there!\n"
	Process.exit(0)
end

def fightTaiLeung()
    puts "What would you like to do in the fight against Tai Leung?\n"
    prompt(); which_action = gets.chomp();

    if which_action == "taunt"
        Po.taunt("Tai Leung")
        TaiLeung.rage()
        puts "Go for the kill now. Type 'fight' to finish him off!\n\n"
        fightTaiLeung()
    elsif which_action == "fight"
        puts "Fight to the death dude! No giving up now!\n\n"
        puts "Try an aiki move to wrap this up.\n\n"
        fightTaiLeung()
    elsif which_action == "aikimove"
		puts "Fought and won against Tai Leung! Great job!\n\n"
		Process.exit(0)
    elsif which_action == "retreat"
        Po.retreat()
        TaiLeung.kill()
        poDead()
	else
		puts "Make a proper move dude! Don't let Tai Leung get away!\n\n"
		fightTaiLeung()
	end
end

def startGame()
    # Start at the beginning
	i = 1
	levelBegin = false

	prisonSetting = <<PRISON_PLOT
		Po goes to the prison where Tai Leung is being kept.\n 
		When he arrives, the guards are locked away in a cell and Tai Leung is nowhere to be found.\n
		Now Po must navigate the prison, find and fight Tai Leung, and lock him in the prison forever\n\n
PRISON_PLOT

	puts prisonSetting
    # Just fighting regular foes and not Tai Leung until Level 5
	while i < 5

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

        if po_action == "taunt"
        	Po.taunt("foe")     
        	puts "Your foe(s) anger is making them weaker. Now try fighting them\n\n"
        elsif po_action == "fight"
        	i += 1
        	Po.fight()
        	puts "Good job. You've beaten your foe(s)! On to the next level...\n\n"
        elsif po_action == "retreat"
        	Po.retreat()
        	poDead()
        elsif po_action == "aikimove"
        	Po.aikiMove()
        	i = 5
        else
        	puts "You need to choose one of 4 moves in Po's repertoire dude. Try again\n\n"
        end
    end 

    # Now you can fight Tai Leung
    if i == 5
    	puts "Entering Level 5...\n"
    	puts "Get ready to fight the formerly adopted son of Sifu!\n\n"
    	fightTaiLeung()
    end
end


startGame()
