--[[

.____                     __    .____                        
|    |   _____    _______/  |_  |    |    ____   ____  ______
|    |   \__  \  /  ___/\   __\ |    |  _/ __ \ / ___\/  ___/
|    |___ / __ \_\___ \  |  |   |    |__\  ___// /_/  >___ \ 
|_______ (____  /____  > |__|   |_______ \___  >___  /____  >
        \/    \/     \/                 \/   \/_____/     \/ 

Battlezone Combat Commander: Fleshstorm Mission 4
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 4 of Fleshstorm expansion.
References: FS04.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   Recycler,
   Player,
   dropship,
   const,
   collapse_1,
   collapse_2,
   collapse_3,
   collapse_4,
   collapse_5,
   collapse_6,
   nav_1,
   nav_2,
   nav_3,
   nav_4,
   scav1,
   scav2,
   scav3,
   scav4,
   Attacker,
   rocks,
   radar,
   power,
   
   --[[
   [positions]
   Crabs1,286,19,-1641
   Crabs2,1197,53,-446
   Crabs3,-228,24,-198
   Crabs4,-1614,42,-212
   Crabs5,-683,42,-584
   Crabs6,-362,36,-925
   Crabs7,548,20,555
   ]]--
   
   --Objectives--
   Orders = "Commander,escort the constructor\nwhile it builds a series of plasma\nbatteries,be careful of unstable\nterrain."
   Scavs = "It appears that the local wildlife\nhas taken a dislike to us,protect\nthose extractors at all costs "
   Const = "The terrain ahead is highly\nunstable guide the constructor\nthrough to nav beacon 3 ."
   Const2 = "Well done , one more left to\ngo,guide the constructor to\nnav beacon 4,but be\nquick,the alien fleet is\nalmost upon us. "
   Fleet = "ATTENTION , we are getting reports\nthat the alien fleet is non-hostile\nrepeat,alien fleet is non-hostile,\nabort mission immediately ."
   NewOrders = "We don't have much time,we need\nto shut down the plasma batteries,\n you can to do this from\nthe radar tracking station\nhighlighted on your HUD."
   Radar = "It's too late , we don't have time\n to shut the station down manually\nyou'll have to find another way\nto take it offline." 
   Win = "Well done you have shutdown the\nradar tracking system in time ."

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
Mission.dropship = GetHandle("dropship")
Mission.nav_1 = GetHandle("nav_1")
Mission.nav_2 = GetHandle("nav_2")
Mission.nav_3 = GetHandle("nav_3")
Mission.nav_4 = GetHandle("nav_4")
Mission.collapse_1 = GetHandle("collapse_1")
Mission.collapse_2 = GetHandle("collapse_2")
Mission.collapse_3 = GetHandle("collapse_3")
Mission.collapse_4 = GetHandle("collapse_4")
Mission.collapse_5 = GetHandle("collapse_5")
Mission.collapse_6 = GetHandle("collapse_6")
Mission.rocks = GetHandle("rocks")
Mission.radar = GetHandle("radar")
Mission.power = GetHandle("power")

end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end

function ifObjectIsAlive()

if(not IsAlive(Mission.const)) then
Mission.const = GetHandle("const")
ClearObjectives()
AddObjective("FS04fail1.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.scav1)) then
Mission.scav1 = GetHandle("scav1")
ClearObjectives()
AddObjective("FS04fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.scav2)) then
Mission.scav2 = GetHandle("scav2")
ClearObjectives()
AddObjective("FS04fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.scav3)) then
Mission.scav3 = GetHandle("scav3")
ClearObjectives()
AddObjective("FS04fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.scav4)) then
Mission.scav4 = GetHandle("scav4")
ClearObjectives()
AddObjective("FS04fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsBuilding(Mission.power)) then 
Mission.power = GetHandle("power")
ClearObjectives()
AddObjective("FS04fail3.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end