--[[

  _________                  .__              .__            _____    __  .__              __      __               __                    __   
 /   _____/__ ____________  _|__|__  _______  |  |     _____/ ____\ _/  |_|  |__   ____   /  \    /  \ ____ _____  |  | __ ____   _______/  |_ 
 \_____  \|  |  \_  __ \  \/ /  \  \/ /\__  \ |  |    /  _ \   __\  \   __\  |  \_/ __ \  \   \/\/   // __ \\__  \ |  |/ // __ \ /  ___/\   __\
 /        \  |  /|  | \/\   /|  |\   /  / __ \|  |__ (  <_> )  |     |  | |   Y  \  ___/   \        /\  ___/ / __ \|    <\  ___/ \___ \  |  |  
/_______  /____/ |__|    \_/ |__| \_/  (____  /____/  \____/|__|     |__| |___|  /\___  >   \__/\  /  \___  >____  /__|_ \\___  >____  > |__|  
        \/                                  \/                                 \/     \/         \/       \/     \/     \/    \/     \/        

Battlezone Combat Commander: Fleshstorm Mission 6
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 6 of Fleshstorm expansion.
References: FS06.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   player,
   SwarmGT1,
   SwarmGT2,
   SwarmGT3,
   SwarmGT4,
   SwarmGT5,
   PRDrop1,
   PRDrop2,
   PRDrop3,
   PRDrop4,
   LZ_nav,
   SwarmAA_1,
   SwarmAA_2,
   SwarmAA_3,
   SwarmAA_4,
   SwarmAA_5,
   SwarmAA_6,
   Crash_nav,
   PRConst,
   PRProc,
   PRescort1,
   PRescort2,
   PRescort3,
   PRGtow1,
   PRPgen1,
   Attacker,
   Prec,
   Pfact,
   SwarmRec,
   Parmo,
   Friend,

   --Objectives--
   Orders = "Commander take your team to the\nlanding zone and clear out the\nswarm infestation, secure the\narea before the Phaer-Rhan\ndropships arrive."
   Dropships = "Well done commander the LZ is\nsecure, the Phaer-Rhan will\narrive shortly." 
   Canyon = "Dammit, the swarm have gotten\nAA units along the canyon, they\nare tearing the dropships to\npieces, take out those swarm units\nimmediately." 
   Crashsite = "well done commander, we are\nrecieving a signal from a crashed\ndropship, go to the crashsite\nand escort the survivors to\nthe landing zone."
   Crashsite2 = "Escort that Phaer-Rhan Overlord\nto the landing zone ,this\nunit is vital , another essential\nunit , the processor has also\njust arrived at the LZ."
   LandingZone = "Well done , now help defend\nthe area while the Phaer_Rhan\nsetup base , make sure that\nprocessor is well protected ."
   BaseUp = "Excellent work, the Phaer Rhan\nnow have a factory built\nassist them in their attack on the\nSwarm base to the north." 

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

Ally,1,2
Mission.SwarmGT1 = GetHandle("SwarmGT1")
Mission.SwarmGT1 = GetHandle("SwarmGT2")
Mission.SwarmGT1 = GetHandle("SwarmGT3")
Mission.SwarmGT1 = GetHandle("SwarmGT4")
Mission.SwarmGT1 = GetHandle("SwarmGT5")
Mission.SwarmAA_1 = GetHandle("SwarmAA_1")
Mission.SwarmAA_2 = GetHandle("SwarmAA_2")
Mission.SwarmAA_3 = GetHandle("SwarmAA_3")
Mission.SwarmAA_4 = GetHandle("SwarmAA_4")
Mission.SwarmAA_5 = GetHandle("SwarmAA_5")
Mission.SwarmAA_6 = GetHandle("SwarmAA_6")

    Mission.LZ_nav = BuildObject("ibnav",1,"LZ")
    SetLabel(LZ_nav,"Landing Zone")
    --BeaconOn,LZ_nav --highlighted nav beacon? -- EH
    ClearObjectives()
	AddObjective(Mission.Orders, "white", 10.0)
    SetAIP(,"FS06_s1.aip",6)

    Mission.Attacker = BuildObject("svscA_D",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svscA_D",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svwalk_j",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svwalk_j",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svinst_J",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svinst_J",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svscA_D",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svscA_D",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svtank_J",6,"LZ")
    GoTo(Attacker,"attack_path",1)
    --wait,2
    Mission.Attacker = BuildObject("svtank_J",6,"LZ")
    GoTo(Attacker,"attack_path",1)


end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end

function ifObjectIsAlive()

if(not IsBuilding(Mission.SwarmRec)) then
Mission.SwarmRec = GetHandle("SwarmRec")
ClearObjectives()
AddObjective("FS06win.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.PRConst)) then
Mission.PRConst = GetHandle("PRConst")
ClearObjectives()
AddObjective("FS06fail1.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end

if(not IsAlive(Mission.PRProc)) then
Mission.PRProc = GetHandle("PRProc")
ClearObjectives()
AddObjective("FS06fail2.des", "red", 10.0)
FailMission(GetTime() + 10.0, " ")
end


end