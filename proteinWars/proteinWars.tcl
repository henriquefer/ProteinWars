package provide vmdGame 1.0

#### Load Packages ###################################################
#lappend auto_path /Users/nunomac/Documents/Dropbox/Code/VMDplugins/vmdGame/Final
# Nota o lappned temn de estar no vmdRC


#### INIT ############################################################
namespace eval vmdGame:: {
	namespace export vmdGame
	
		#### Load Packages				
		package require guiProteinWars 			1.0
		package require gameEngine 		1.0
		package require message 		1.0
		package require scoreEngine 	1.0
		package require starsEngine 	1.0
		package require levelsEngine 	1.0
		package require vmdEngine 		1.0
		package require keys	 		1.0
		package require soundEngine 	1.0
		package require demoEngine 		1.0
		

		#### Program Variables

		## General
		variable version	    	"0.1"
        variable topGui         	".vmdGame"
		variable levelsID			0
		variable Directory			"/Users/hfernandes/Documents/Software_development/vmdGame/proteinWars" ;#directory of levels
		variable levelsDirectory 	"$Directory/levels"
		variable soundMessagePID	0
		variable soundAlarmPID		0
		variable timePID			0
		variable bgSoundPID			0
		variable startSoundPID		0
		variable sound				""
		variable demo 				on
		variable viewpoints 0
		
		
		## images
		variable imgFiles		"welcome.gif proteinWars.gif"
		variable imgKeywords	"imgWelcome imgGameWindow"

		## widget variables
		variable score		0
		variable lifes		5
		variable health		100
		variable fuel 		100
		variable protein 	""
		variable disease 	""
		variable level 		1
		variable pills 		0
		variable messageSide ""
		variable control 0
		
		## score targets
		variable score_1	""
		variable score_2	""
		variable score_3	""
		
		
		#vmdEngine
		variable windowXX 0
		variable windowYY 0
		variable actualSelection all
		variable repid 0
		variable mousePick 0
		variable mouseMolPick 0
		variable resid ""
		variable resname ""
		variable residue ""
		variable representationType ""

}

proc vmdGame::start {} {
		
			# load Images
			vmdGame::loadImages

			# load levels
			vmdGame::loadLevels
		
			# start GUI
		    vmdGame::buildGui
			
			# trace variables
			trace var vmdGame::score w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop score]
			trace var vmdGame::levelsID w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop level]
			trace var vmdGame::pills w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop pills]
			trace var vmdGame::protein w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop protein]
			trace var vmdGame::disease w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop disease]
			trace var vmdGame::messageSide w [list vmdGame::updateVariables $vmdGame::topGui.frame0.canvasTop messageside]
			eval "trace variable ::vmd_pick_atom_silent w vmdGame::printtrace"
			eval "trace variable ::vmd_pick_mol_silent w vmdGame::printtrace1"

			## set Controls
			vmdGame::keys	

			material add invisible
			material change ambient invisible 0
			material change specular invisible 0
			material change diffuse invisible 0
			material change shininess invisible 0
			material change mirror invisible 0 
			material change opacity invisible 0		
			
			## Start engine of Game
			vmdGame::engineStart
			
			# Change Page
			vmdGame::PageSelect 1
			
			
			
}


########### Start
#vmdGame::start

