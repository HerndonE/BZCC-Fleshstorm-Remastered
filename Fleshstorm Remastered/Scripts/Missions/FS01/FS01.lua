--[[

  ________                            .__        
 /  _____/  ____   ____   ____   _____|__| ______
/   \  ____/ __ \ /    \_/ __ \ /  ___/  |/  ___/
\    \_\  \  ___/|   |  \  ___/ \___ \|  |\___ \ 
 \______  /\___  >___|  /\___  >____  >__/____  >
        \/     \/     \/     \/     \/        \/ 

Battlezone Combat Commander: Fleshstorm Mission 1
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 1 of Fleshstorm expansion.
References: FS01.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   
   Index = 0,
   AttackerCount = 0,
   WaveCount = 0,
 
   --Handles--
   Recycler,
   
   IndexedObject,
   Attacker,
   Attacker0,
   Attacker1,
   Attacker2,
   Attacker3,
   Attacker4,
   Attacker5,
   Attacker6,
   Attacker7,
   Attacker8,
   --Attackers <6>
   MyRecycler,
   Wingman_1,
   Wingman_2,
   Leader,
   RepTeam,
   Player,
   Hangar,
   Outpost,
   Bones,
   Service_1,
   Service_2,
   GunTow,
   GunTow2,
   LastWalk,
   
   --Objectives--
   Orders_1 = "Lt Harker we have\nlost contact with outpost\none. Escort a repair team\nto the outpost, we need \nthat com bunker back online.",
   Orders_2 = "We're under attack , they're\neverywhere. Protect that repair\nteam at all costs, ensure they\nget safely back to base .",
   Orders_3 = "Build a scavenger and start making\nsome turrets a large enemy force\nis inbound ",  
   Obsevation = " Something is wrong here\nall the trees are dying\nand there's no sign of any\nanimal life at all.",
   Comms = "We've lost comms with base,\nall this dust is screwing things\nup, continue with the mission\nwe'll contact base when we get\nthe bunker online.",
   Outpost = "What the hell has happened here,\nthe outpost is totally destroyed.\nBaker,Davidson and Mckenzie\ncheck the perimeter for hostiles. ",
   Warning_1 = "Warning :Stay in Formation.",
   Objective_1 = "Well done , The Repair Team\nhas arrived back safely.",
   WinText = "Well done You Have Survived\nFor Now !!"

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

Mission.Player = GetPlayerHandle(1)
SetScrap(1,0)
AddObjective(Mission.Orders_1, "white", 10.0)
Mission.Recycler = GetHandle("MyRecycler")
Mission.Outpost = GetHandle("Outpost")
Mission.GunTow2 = GetHandle("GunTow2")
Mission.GunTow = GetHandle("GunTow")
Mission.Bones = GetHandle("Bones")
Mission.Wingman_1 = GetHandle("Wingman_1")
Mission.Wingman_2 = GetHandle("Wingman_2")
Goto(Mission.RepTeam, "Rep_Path", 0, 1)
--Wait,10
Follow(Mission.Wingman_1, Mission.Leader, 1)
Follow(Mission.Wingman_2, Mission.Leader, 1)
--BeaconOn,RepTeam --highlighted nav beacon? -- EH
Goto(Mission.RepTeam, "PatrolRte_1", 0, 1)
--Wait,40
ClearObjectives()
AddObjective(Mission.Obsevation, "white", 10.0)

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
AddObjective("failtext.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.RepTeam)) then
Mission.RepTeam = GetHandle("RepTeam")
ClearObjectives()
AddObjective("failtext2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsBuilding(Mission.Recycler)) then
Mission.Recycler = GetHandle("MyRecycler")
ClearObjectives()
AddObjective("failtext3.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsBuilding(Mission.Hangar)) then --If Hangar is a building leave it as IsBuilding -- EH
Mission.Hangar = GetHandle("Hangar")
ClearObjectives()
AddObjective("failtext.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end