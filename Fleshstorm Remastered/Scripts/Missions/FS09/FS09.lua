--[[

___________.__                _____                     ___.                         
\__    ___/|  |__   ____     /     \   ____   _________ \_ |__ _____    ______ ____  
  |    |   |  |  \_/ __ \   /  \ /  \_/ __ \ / ___\__  \ | __ \\__  \  /  ___// __ \ 
  |    |   |   Y  \  ___/  /    Y    \  ___// /_/  > __ \| \_\ \/ __ \_\___ \\  ___/ 
  |____|   |___|  /\___  > \____|__  /\___  >___  (____  /___  (____  /____  >\___  >
                \/     \/          \/     \/_____/     \/    \/     \/     \/     \/ 

Battlezone Combat Commander: Fleshstorm Mission 9
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 9 of Fleshstorm expansion.
References: FS09.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   Player,
   drop,
   escort1,
   escort2,
   escort3,
   escort4,
   recy,
   attacker,
   swarmAA1,
   swarmAA2,
   swarmAA3,
   swarmAA4,
   swarmAA5,
   swarmAA6,
   swarmAA7,
   swarmAA8,
   swarmAA9,
   swarmAA10,
   reinforce,
   swarmrec,
 
   --Objectives--
   Orders1 = "Protect the Recycler convoy as\nit makes it's way through the\njungle. The more swarm AA units\nyou destroy the more dropships\nwe can send in."
   AA1Dead = "Well done you've taken out a\ngroup of AA units , A Dropship\n with reinforcements is on it's\nway down to you."
   AtBase = "Congratulations you made it\nthrough , now establish a base\n and take out the swarm\ninstallation to the\nnorth west."

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

Mission.recy = GetHandle("Recycler")
Mission.Player = GetPlayerHandle(1)


Mission.escort1 = GetHandle("escort1")
Mission.escort2 = GetHandle("escort2")
Mission.escort3 = GetHandle("escort3")
Mission.escort4 = GetHandle("escort4")
SetScrap(1,40)

   GoTo(recy,"recpath_1",1)
   --wait,2
   Follow(Mission.escort1,Mission.recy,1)
   --wait,2
   Follow(Mission.escort2,Mission.recy,1)
   --wait,2
   Follow(Mission.escort3,Mission.recy,1)
   --wait,2
   Follow(Mission.escort4,Mission.recy,1)

    ClearObjectives()
	AddObjective(Mission.Orders1, "white", 10.0)

    Mission.attacker = BuildObject("svscA_D",6,"swarm1")
    Attack(Mission.attacker,Mission.recy,1)
    --wait,2
    Mission.attacker = BuildObject("svscA_D",6,"swarm1")
    Attack(Mission.attacker,Mission.recy,1)
    --wait,2
    Mission.attacker = BuildObject("svscout_L",6,"swarm1")
    Attack(Mission.attacker,Mission.recy,1)
    --wait,2
    Mission.attacker = BuildObject("svscout_L",6,"swarm1")
    Attack(Mission.attacker,Mission.recy,1)
    --wait,2
    Mission.attacker = BuildObject("svscout_L",6,"swarm1")
    Attack(Mission.attacker,Mission.recy,1)
    --wait,2

end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end
function ifObjectIsAlive()

if(not IsBuilding(Mission.recy)) then 
Mission.recy = GetHandle("Recycler")
ClearObjectives()
AddObjective("FS09fail1.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end