--[[

________          _____                             .____    .__                _________ .__                 .__  .__        
\______ \   _____/ ____\____   ____   ______ ____   |    |   |__| ____   ____   \_   ___ \|  |__ _____ _______|  | |__| ____  
 |    |  \_/ __ \   __\/ __ \ /    \ /  ___// __ \  |    |   |  |/    \_/ __ \  /    \  \/|  |  \\__  \\_  __ \  | |  |/ __ \ 
 |    `   \  ___/|  | \  ___/|   |  \\___ \\  ___/  |    |___|  |   |  \  ___/  \     \___|   Y  \/ __ \|  | \/  |_|  \  ___/ 
/_______  /\___  >__|  \___  >___|  /____  >\___  > |_______ \__|___|  /\___  >  \______  /___|  (____  /__|  |____/__|\___  >
        \/     \/          \/     \/     \/     \/          \/       \/     \/          \/     \/     \/                   \/ 

Battlezone Combat Commander: Fleshstorm Mission 8
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 8 of Fleshstorm expansion.
References: FS08.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   Recycler,
   Player,
   S1recy,
   S2recy,
   launcher1,
   launcher2,
   launcher3,
   Nav1,
   Nav2,
   Nav3,
   BaseNav,
   PRover,
   PRproc,
   PRgt1,
   PRgt2,
   PRgt3,
   PRgt4,
   PRgt5,
   PRsbay,
   PRcom,
   PRserv1,
   PRserv2,
   PRserv3,
   Turr1,
   Turr2,
   Turr3,

   --Objectives--

   Orders = "The Swarm is attempting to escape\ntake out those launchers\nwe've dropped navs to help you,\nbe quick, time is short."
   Orders2 = "Well done Commander, now build a\nbase and destroy the\nremaining swarm forces, a\nrecycler is on it's way\nto you."


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

Mission.S1recy = GetHandle("S1recy")
Mission.launcher1 = GetHandle("launcher1")
Mission.launcher2 = GetHandle("launcher2")
Mission.launcher3 = GetHandle("launcher3")

Mission.S2recy = BuildObject("sbrecy00",5,"S2recy")
Mission.PRproc = BuildObject("pbproc",2,"PRproc")
Mission.PRover = BuildObject("Pvcons",2,"PRover")
Mission.PRgt1 = BuildObject("Pbgtow",2,"PRgt1")
Mission.PRgt2 = BuildObject("Pbgtow",2,"PRgt2")
Mission.PRgt3 = BuildObject("Pbgtow",2,"PRgt3")
Mission.PRgt4 = BuildObject("Pbgtow",2,"PRgt4")
Mission.PRgt5 = BuildObject("Pbgtow",2,"PRgt5")
Mission.PRcom = BuildObject("Pbcoms",2,"PRcom")
Mission.PRsbay = BuildObject("Pbsbay",2,"PRsbay")
Mission.PRserv1 = BuildObject("Pvserv",2,"PRover")
Mission.PRserv2 = BuildObject("Pvserv",2,"PRover")
Mission.PRserv3 = BuildObject("Pvserv",2,"PRover")

  SetScrap(2,40)
  SetScrap(5,40)
  SetScrap(6,40)

    SetAIP("FS08_s1.aip",6)
    SetAIP("FS08_s2.aip",5)
    SetAIP("FS08_p1.aip",2)

    Mission.Nav1 = BuildObject("ibnav",1,"Nav1")
    SetLabel(Nav1,"Launcher1")
    --BeaconOn,Nav1 --highlighted nav beacon? -- EH
    Mission.Nav2 = BuildObject("ibnav",1,"Nav2")
    SetLabel(Nav2,"Launcher2")
    --BeaconOn,Nav1 --highlighted nav beacon? -- EH

    Mission.Nav3 = BuildObject("ibnav",1,"Nav3")
    SetLabel(Nav3,"Launcher3")
    --BeaconOn,Nav1 --highlighted nav beacon? -- EH

    ClearObjectives()
	AddObjective(Mission.Orders, "white", 10.0)

    StartCockpitTimer(600,200, 100)

end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end

function ifObjectIsAlive()

if(not IsBuilding(Mission.Recycler)) then 
Mission.Recycler = GetHandle("Recycler")
ClearObjectives()
AddObjective("FS08fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end