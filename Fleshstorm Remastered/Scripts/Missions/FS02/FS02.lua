--[[

_________ .__      .__.__    __________                __                 __  .__               
\_   ___ \|__|__  _|__|  |   \______   \_______  _____/  |_  ____   _____/  |_|__| ____   ____  
/    \  \/|  \  \/ /  |  |    |     ___/\_  __ \/  _ \   __\/ __ \_/ ___\   __\  |/  _ \ /    \ 
\     \___|  |\   /|  |  |__  |    |     |  | \(  <_> )  | \  ___/\  \___|  | |  (  <_> )   |  \
 \______  /__| \_/ |__|____/  |____|     |__|   \____/|__|  \___  >\___  >__| |__|\____/|___|  /
        \/                                                      \/     \/                    \/ 

Battlezone Combat Commander: Fleshstorm Mission 2
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 2 of Fleshstorm expansion.
References: FS02.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   PilotCount = 0,
   --Handles--
   Recycler,
   Player,
   Recy,
   Leader,
   Barracks,
   apc_1,
   apc_2,
   apc_3,
   TempPilot,
   Attacker,
   Enemy_1,
   Enemy_2,
   Enemy_3,
   Enemy_4,
   Enemy_5,
   Enemy_6,
   Enemy_7,
   Enemy_8,
   Enemy_9,
   Outpost,
   Outpost_2,
   turr_1,
   turr_2,
   turr_3,
   turr_4,
   bones_1,
   Tank_1,
   Tank_2,
   Tank_3,
   Serv_1,
   
   --[[
   [positions]
   swarm1,1637,2,-1203
   swarm2,-1710,3,1575
   swarm3,-319,2,1496
   swarm4,1704,2,-335
   swarm5,1628,2,1586
   Pilots,-1079,2,-1726
   Reinf,-1262,-14,-1841
   ]]--
   
   --Objectives--
   Brief_1 = "The enemy have launched\na major offensive , many\nof our outposts have been overrun\nand we have lost control\nof the starport."
   Brief_2 = "We are regrouping our\nforces at the central command\ncomplex , we are evacuating all\nnon essential personnel via APC."
   Brief_3 = "Without dropships from the\nstarport we are unable to\nairlift the recycler out ,\nthis means you'll have to\nescort it to safety."
   Orders_1 = "Protect the APC's while\nthey evacuate our troops\nthen escort the recycler back\nto central command." 
   Pilots = "Well, done our troops\nhave arrived safely ,\nnow you must escort the\nrecycler through the canyons ,\ngood luck."
   Warning_1 = "Enemy turrets are blocking\n the way ahead , clear\nthem out so we can procede."
   Turrets = "Well done , the turrets\nhave been eliminated\nwe may continue."
   Force = "A large enemy force\nis blocking the way ahead,\nwe must neutralise them\nbefore we can move on ."
   WinText = "well done the recycler\nhas made it through.\nThe rest of the journey\nto central command is,\nclear of enemy forces ."

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

Mission.apc_1 = GetHandle("apc_1")
Mission.apc_2 = GetHandle("apc_2")
Mission.apc_3 = GetHandle("apc_3")
Mission.Outpost = GetHandle("Outpost")
Mission.Outpost_2 = GetHandle("Outpost_2")
Mission.bones_1 = GetHandle("bones_1")
Mission.turr_1 = GetHandle("turr_1")
Mission.turr_2 = GetHandle("turr_2")
Mission.turr_3 = GetHandle("turr_3")
Mission.turr_4 = GetHandle("turr_4")
SetScrap(1, 0)
Defend2(Mission.Leader, Mission.Recy, 1)
Goto(Mission.Recy, "bay", 0, 1)
--BeaconOn,Recy --highlighted nav beacon? -- EH
end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end

function ifObjectIsAlive()

if(not IsAlive(Mission.Leader)) then
Mission.Leader = GetHandle("Leader")
ClearObjectives()
AddObjective("FS02fail4.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsBuilding(Mission.Recy)) then
Mission.Recy = GetHandle("MyRecycler")
ClearObjectives()
AddObjective("FS02fail3.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end