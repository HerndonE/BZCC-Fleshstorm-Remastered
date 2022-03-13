--[[

  _________      .__                ___________    .__  .__   
 /   _____/ ____ |__| ____   ____   \__    ___/___ |  | |  |  
 \_____  \_/ ___\|  |/  _ \ /    \    |    | /  _ \|  | |  |  
 /        \  \___|  (  <_> )   |  \   |    |(  <_> )  |_|  |__
/_______  /\___  >__|\____/|___|  /   |____| \____/|____/____/
        \/     \/               \/                            
                                                              
Battlezone Combat Commander: Fleshstorm Mission 3
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 3 of Fleshstorm expansion.
References: FS03.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   AttackerCount = 0,
   --Handles--
   Recycler,
   Player,
   EnemyRec1,
   EnemyRec2,
   Tech,
   Turr1,
   Turr2,
   Turr3,
   Turr4,
   Turr5,
   Turr6,
   Rckt1,
   Rckt2,
   Rckt3,
   Rckt4,
   Walk1,
   Walk2,
   Walk3,
   Sct1,
   Sct2,
   Sct3,
   Tnk1,
   Tnk2,
   Attacker,
   tow1,
   tow2,
   tow3,
   tow4,
   def1,
   def2,
   def3,
   def4,
   def5,
   Swalk1,
   Swalk2,
   Swalk3,
   Swalk4,
   star_nav,

   --Objectives--
   startxt = "With LT Harker dead\nyou are now incharge\nof the recycler , however\nwe need to upgrade it first\nget those scavs deployed\nwhile you're waiting." 
   techtxt = "OK the recycler\nhas now been upgraded\nget it deployed and\nbegin the assualt on\nthe enemy installation\nto the north-west ."
   rec1txt = "Excellent work , the enemy\ninstallation has been neutralised\nour forces are now able to\nmove out of the canyon ,\nnow lets retake that StarPort ."
   allies = "Commander you better get some\ndefences up here , we've\ngot a large enemy force\nfurther up the canyon , and\nthey're closing fast ."
   WinText = "well done you have\ncleared the way\nto the Starport."
   lastorders = "You have eliminated all enemy\nbases in this area, destroy the\nenemy force blocking the way\nto the starport, and\nany extra units that arrive."  


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

   GetByLabel,Tech,"Tech"
   Ally(5,6)
   Ally(1,2)
   SetScrap(1,40)
   SetScrap(5,20)
   SetScrap(6,20)
   
   Mission.Turr1 = BuildObject("svturr",6,"turr1")
   Mission.Turr2 = BuildObject("svturr",6,"turr2")
   Mission.Turr3 = BuildObject("svturr",6,"turr3")
   Mission.Turr4 = BuildObject("svturr",6,"turr4")
   Mission.Turr5 = BuildObject("svturr",6,"turr5")
   Mission.Turr6 = BuildObject("svturr",6,"turr6")
   Mission.def1 = BuildObject("svturr",6,"def1")
   Mission.def2 = BuildObject("svturr",6,"def2")
   Mission.def3 = BuildObject("svturr",6,"def3")
   Mission.def4 = BuildObject("svturr",6,"def4")
   Mission.def5 = BuildObject("svturr",6,"def5")
   Mission.tow1 = BuildObject("sbgtow",5,"tow1")
   Mission.tow2 = BuildObject("sbgtow",5,"tow2")
   Mission.tow3 = BuildObject("sbgtow",5,"tow3")
   Mission.tow4 = BuildObject("sbgtow",5,"tow4")
   ClearObjectives()
   AddObjective(Mission.startxt, "white", 10.0)
   GoTo(Recycler,"Rec_path1",1)
   Mission.EnemyRec1 = BuildObject(">sbrecy_b",5,"RecyclerEnemy")
   Mission.EnemyRec2 = BuildObject(">sbrecy_b",6,"RecyclerEnemy2")
   --WAIT,30
   SetAIP("FS03.aip",5)
   SetAIP("FS03b.aip",6)



end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end

function ifObjectIsAlive()

if(not IsBuilding(Mission.EnemyRec2)) then
Mission.EnemyRec2 = GetHandle("MyRecycler")
ClearObjectives()
AddObjective("FS03fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end


if(not IsBuilding(Mission.Recycler)) then
Mission.Recycler = GetHandle("MyRecycler")
ClearObjectives()
AddObjective("FS03fail.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

end