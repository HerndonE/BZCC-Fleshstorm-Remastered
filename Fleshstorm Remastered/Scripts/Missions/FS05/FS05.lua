--[[

___________.__             ___________.__          __            _____    ___ ___             .___             
\__    ___/|  |__   ____   \_   _____/|__| _______/  |_    _____/ ____\  /   |   \_____     __| _/____ _____   
  |    |   |  |  \_/ __ \   |    __)  |  |/  ___/\   __\  /  _ \   __\  /    ~    \__  \   / __ |/ __ \\__  \  
  |    |   |   Y  \  ___/   |     \   |  |\___ \  |  |   (  <_> )  |    \    Y    // __ \_/ /_/ \  ___/ / __ \_
  |____|   |___|  /\___  >  \___  /   |__/____  > |__|    \____/|__|     \___|_  /(____  /\____ |\___  >____  /
                \/     \/       \/            \/                               \/      \/      \/    \/     \/ 

Battlezone Combat Commander: Fleshstorm Mission 5
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 5 of Fleshstorm expansion.
References: FS05.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   Recycler,
   Player,
   Drop1,
   Drop2,
   Drop3,
   Drop4,
   pool1,
   pool2,
   pool3,
   Tblue1,
   Tblue2,
   Tblue3,
   Tblue4,
   Attacker,
   nav_1,
   nav_2,
   nav_3,
   ruin_1,
   MechanaFact,
   coms,
   power,
   Snoop,
   SwarmFact,
   SwarmRec,
   swarm_nav,
   base_nav,


   --Objectives--
   Orders = "Blue Team will scout ahead for\nbiometal pools , we need you to\ndeploy the recycler and start\n setting up a base ."
   Pool1 = "This is Blue Team we have a pool\n for you , dropping Nav Beacon."
   Pool2 = "We have another pool for you ."
   Pool3 = "Here's another pool , send out\nthe scavs while we search for more."
   Ruins = "we're finding alien ruins, looks\n like they've been empty a long\ntime, we're finding remains of\nmilitary hardware must have been\na battle here."
   Attacked = "Commander some of these defences\nare still operational , we are\nunder attack."
   Attackers = "We have lost contact with team blue\nwe are detecting movement\njust north of their last known\nposition ,attempting to get\na visual of the area." 
   Mechana = "We seem to have accidentally\ntriggered some kind of ancient\nplanetary defense system prepare\nfor incoming attackers."
   Snoop = "We need to shut these defence systems\ndown fast, we are picking up some\nstrange transmitions in\nthe area dispatching a snooper\nscout to investigate." 
   Snoop2 = "Commander the snooper scout has arrived,\nit will track down and identify\nthe source of the transmitions\nkeep this unit safe at all costs."
   Coms = "Commander we've located the source of\nthe transmitions, it appears to be\nsome kind communications\nrelay, attempting to access the\nnetwork now."
   Hacked = "We've managed to temporarily disable\nthe alien defence systems you have\napprox 30 minutes to take \nout the swarm base before they come\nback online."
   WinText = "Well done commander, the Swarm\noutpost has been erradicated." 
   death1 = "DEPLOY NEAR THE BEACON NOT HALF\nA MILE AWAY,MISSION FAILED"


}

function Save()
   return Mission
end

function Load(...)
   if select("#", ...) > 0 then
      Mission = ...
   end
end

function AddObject(h) --This function is called when an object appears in the game.
  
end

function DeleteObject(h) --This function is called when an object is deleted in the game.
end

function InitialSetup()
Mission.TPS = EnableHighTPS()
AllowRandomTracks(true)
end

function Start() --This function is called upon the first frame
SetAutoGroupUnits(false)

Mission.Recycler = GetHandle("Recycler")
Mission.Player = GetPlayerHandle(1)
AddScrap(1, 40)

Ally(1,2)
Ally(5,6)
Ally(5,2)
Ally(6,2)

Mission.Drop1 = GetHandle("Drop1")
Mission.Drop2 = GetHandle("Drop2")
Mission.Drop3 = GetHandle("Drop3")
Mission.pool1 = GetHandle("pool1")
Mission.pool2 = GetHandle("pool2")
Mission.pool3 = GetHandle("pool3")
Mission.ruin_1 = GetHandle("ruin_1")
Mission.coms = GetHandle("coms")
Mission.SwarmFact = GetHandle("SwarmFact")
Mission.SwarmRec = GetHandle("SwarmRec")


SetTeamColor(2,10,10,128)
Mission.Tblue1 = BuildObject("ivtank",2,"friend_1")
SetLabel(Tblue1,"Blue 1")
Mission.Tblue2 = BuildObject("ivscout",2,"friend_2")
SetLabel(Tblue2,"Blue 2")
Mission.Tblue3 = BuildObject("ivscout",2,"friend_3")
SetLabel(Tblue3,"Blue 3")
Mission.Tblue4 = BuildObject("ivscout",2,"friend_4")
SetLabel(Tblue4,"Blue 4")
Mission.MechanaFact = BuildObject("obfact",5,"FactEnemy")
Mission.power = BuildObject("obpgen",5,"pgen")



end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end
