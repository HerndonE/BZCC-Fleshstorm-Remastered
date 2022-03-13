--[[

   _____      _________                         .__                   _____                      
  /  _  \    /   _____/__ ______________________|__| ______ ____     /     \   _______  __ ____  
 /  /_\  \   \_____  \|  |  \_  __ \____ \_  __ \  |/  ___// __ \   /  \ /  \ /  _ \  \/ // __ \ 
/    |    \  /        \  |  /|  | \/  |_> >  | \/  |\___ \\  ___/  /    Y    (  <_> )   /\  ___/ 
\____|__  / /_______  /____/ |__|  |   __/|__|  |__/____  >\___  > \____|__  /\____/ \_/  \___  >
        \/          \/             |__|                 \/     \/          \/                 \/ 

Battlezone Combat Commander: Fleshstorm Mission 7
Event Scripting Conversion: Ethan Herndon "F9bomber"
Author(s):
Description: Mission 7 of Fleshstorm expansion.
References: FS07.bzs
]] --

local Mission = {
   --Integers--
   TPS = 0,
   MissionTimer = 0,
   TurnCounter = 0,
   --Handles--
   Recycler,
   Player,
   Probe,
   Attacker,
   Attacker2,
   t3rec,
   t3Recycler,
   t3fact,
   t3power1,
   t3power2,
   t3power3,
   t3com1,
   t3com2,
   t3GT1,
   t3GT2,
   t3GT3,
   PRproc,
   PRfact,
   PRcyard,
   PRpow_1,
   PRpow_2,
   PRpow_3,
   PRpow_4,
   PRGT_1,
   PRGT_2,
   PRGT_3,
   PRGT_4,
   PRGT_5,
   PRmine_1,
   PRmine_2,
   PRmine_3,
   PRcons,
   base_nav,
   swarm_nav,
   Brec,
   PlayerFac,
   PlayerPow,
   PlayerBay,
   PlayerArmo,
   PRoverlord,
   Sbuild,
   Swalk1,
   Swalk2,
   Backup1,
   Backup,
   PRserv_1,
   PRserv_2,
   Mlead1,
   Mlead2,
   Mwing1,
   Mwing2,
   Mwing3,
   Mwing4,
   Mwing5,
   SwarmRec,
   newguy,
   
   --Objectives--
   Orders1 = "Commander setup base at the nav\nbeacon,prevent the swarm from\nleaving the infested zone.\nDo not enter this zone\nmechana defenses are still active."
   death1 = "NEAR THE BEACON NOT HALF\nA MILE AWAY,MISSION FAILED"
   EDF = "Commander the EDF base to the\neast has been compromised,their\nRecycler is lost,take your\nforces and defend the area\nuntil a replacement arrives."
   NewOrders = "Well done the breach is sealed\nhowever a significant swarm force\nhas broken through find\nand eliminate them,they\nwere last spotted moving north."
   SwarmDead = "The Swarm force has been\ndestroyed.We are picking up\npowerful energy readings from\nthe ruins in this sector\ninvestigate and find the source."
   Probe = "Commander whatever the hell\nthat thing is, guard it\nwith your life,backup is on\nit's way."
   Orders2 = "We've dropped a nav at the\nlast known position of the\nswarm force,a powerful energy\nsource in the area is\nblocking our scans."   

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

Ally(1,2)
Ally(1,3)
Ally(2,3)
Ally(5,6)
Ally(5,2)
SetScrap(1, 40)
SetScrap(2, 40)
SetScrap(3, 40)
SetScrap(5, 40)


Mission.Probe = GetHandle("Probe")



Mission.t3fact = BuildObject("ibfact",3,"t3fact")
Mission.t3rec = BuildObject("ibrecy",3,"t3rec")
Mission.t3power1 = BuildObject("ibpgen",3,"t3power1")
Mission.t3power2 = BuildObject("ibpgen",3,"t3power2")
Mission.t3power3 = BuildObject("ibpgen",3,"t3power3")
Mission.t3com1 = BuildObject("ibcbun",3,"t3com1")
Mission.t3com2 = BuildObject("ibcbun",3,"t3com2")
Mission.t3GT1 = BuildObject("ibgtow",3,"t3GT1")
Mission.t3GT2 = BuildObject("ibgtow",3,"t3GT2")
Mission.t3GT3 = BuildObject("ibgtow",3,"t3GT3")
Mission.PRproc = BuildObject("pbproc",2,"PRproc")
Mission.PRfact = BuildObject("pbfact",2,"PRfact")
Mission.PRcyard = BuildObject("pbrecy",2,"PRcyard")
Mission.PRpow_1 = BuildObject("pbpgen",2,"PRpow_1")
Mission.PRpow_2 = BuildObject("pbpgen",2,"PRpow_2")
Mission.PRpow_3 = BuildObject("pbpgen",2,"PRpow_3")
Mission.PRpow_3 = BuildObject("pbpgen",2,"PRpow_4")
Mission.PRGT_1 = BuildObject("pbgtow",2,"PRGT_1")
Mission.PRGT_2 = BuildObject("pbgtow",2,"PRGT_2")
Mission.PRGT_3 = BuildObject("pbgtow",2,"PRGT_3")
Mission.PRGT_4 = BuildObject("pbgtow",2,"PRGT_4")
Mission.PRGT_4 = BuildObject("pbgtow",2,"PRGT_5")
Mission.PRmine_1 = BuildObject("pbsturr",2,"PRmine_1")
Mission.PRmine_2 = BuildObject("pbmturr",2,"PRmine_2")
Mission.PRmine_3 = BuildObject("pbsturr",2,"PRmine_3")
Mission.PRoverlord = BuildObject("pvcons",2,"PRove")
Mission.PRserv_1 = BuildObject("pvserv",2,"PRserv_1")
Mission.PRserv_2 = BuildObject("pvserv",2,"PRserv_2")

     Mission.Sbuild = BuildObject("Svcons",5,"Sbuild")
     SetAIP("FS07_s1.aip",5)

    Mission.base_nav = BuildObject("ibnav",1,"base")
    SetLabel(base_nav,"Base Area")
    --BeaconOn,base_nav --highlighted nav beacon? -- EH
    ClearObjectives()
	AddObjective(Mission.Orders1, "white", 10.0)
    SetAIP("FS07_e1.aip",3)
    SetAIP("FS07_p1.aip",2)
    --RunSpeed,CheckOverlord,1,false



end

function Update() --This function runs on every frame.
Mission.TurnCounter = Mission.TurnCounter + 1

missionCode() --Calling our missionCode function in Update.
end

function missionCode() --

end
