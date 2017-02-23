-- Общие функции и массивы
--пока не используется
function GetStdAddon(item, addon_type)
	local addons = item:GetStdPlugs()
	if addons == nil then return nil end
    for _,addon in ipairs(addons) do

        if addon:GetFamily() == Family.ifAddon and addon:GetAddonInfo():GetType() == addon_type then
            return addon:GetName()
        end


    end
	return nil
end

function GetAddon(item, addon_type)
	local addons = item:GetAddons()
	if addons == nil then return nil end
	for i = 1, #addons do
--Log(tostring(addons[i]:GetName()))
		if addons[i]:GetInfo():GetAddonInfo():GetType() == addon_type then
--Log(tostring(addons[i]:GetName()))
			return addons[i]
		end
	end
	return nil
end

function CanModWeapon(monster, use_item)
--cheat
--return true
	return HUDState() ~= 5
		and not IsBattle()
		and monster:HasItem(use_item)
		and not use_item:IsShopItem()
		and monster:GetHands() ~= nil
		and not monster:GetHands():IsShopItem()
		and monster:GetHands():GetInfo():GetFamily() == Family.ifWeapon
		and (#SquadGetItems("tool1")>0 or #SquadGetItems("tool2")>0 or monster:HasItem("tool3"))
end

 local ForestockItems = {
--std weapons
 ["Submachine-gun HK MP5A5 (9mm)"] = "Submachine-gun HK MP5A5 RIS (9mm)",
 ["Submachine-gun HK MP5A5 (9mm) folded"] = "Submachine-gun HK MP5A5 RIS (9mm) folded",
 ["Submachine-gun NR-08 (9mm)"] = "Submachine-gun NR-08 RIS (9mm)",
 ["Submachine-gun NR-08 (9mm) folded"] = "Submachine-gun NR-08 RIS (9mm) folded", 
 ["Submachine-gun HK MP5A5 (.40 S&W)"] = "Submachine-gun HK MP5A5 RIS (.40 S&W)",
 ["Submachine-gun HK MP5A5 (.40 S&W) folded"] = "Submachine-gun HK MP5A5 RIS (.40 S&W) folded",
 ["HK MP5A3 (10)"] = "Submachine-gun HK MP5A5 RIS (10)",
 ["HK MP5A3 (10) folded"] = "Submachine-gun HK MP5A5 RIS (10) folded",
 ["HK MP5A3 (22)"] = "HK MP5A5 RIS (22)",
 ["HK MP5A3 (22) folded"] = "HK MP5A5 RIS (22) folded",
 ["Assault Rifle HK53A3 (5.56mm)"] = "Assault Rifle HK53A3 RIS (5.56mm)",
 ["Assault Rifle HK53A3 (5.56mm) folded"] = "Assault Rifle HK53A3 RIS (5.56mm) folded",
 ["Assault Rifle DaewooK1O (5.56mm)"] = "Assault Rifle DaewooK1R (5.56mm)",
 ["Assault Rifle DaewooK1O (5.56mm) folded"] = "Assault Rifle DaewooK1R (5.56mm) folded",
 ["Assault Rifle DaewooK2O (5.56mm)"] = "Assault Rifle DaewooK2R (5.56mm)",
 ["Assault Rifle DaewooK2O (5.56mm) folded"] = "Assault Rifle DaewooK2R (5.56mm) folded",
 ["Assault Rifle Daewoo DR100 (5.56mm)"] = "Assault Rifle Daewoo DR100 RIS (5.56mm)",
 ["Assault Rifle Daewoo DR100 (5.56mm) folded"] = "Assault Rifle Daewoo DR100 RIS (5.56mm) folded",
 ["Assault Rifle Daewoo DR200 (5.56mm)"] = "Assault Rifle Daewoo DR200 RIS (5.56mm)",
 ["Assault Rifle Daewoo DR300 (7.62mm)"] = "Assault Rifle Daewoo DR300 RIS (7.62mm)",
 ["Assault Rifle M4A1 (5.56mm)"] = "Assault Rifle M4A1 RIS (5.56mm)",
 ["Assault Rifle M4A1 (5.56mm) folded"] = "Assault Rifle M4A1 RIS (5.56mm) folded",
 ["Assaul Rifle Type81"] = "Assaul Rifle Type81 Tac",
 ["Assaul Rifle Type81 folded"] = "Assaul Rifle Type81 Tac folded",
 ["Assaul Rifle Type81S"] = "Assaul Rifle Type81S Tac",
 ["HK MC51 (7.62x51mm)"] = "HK MC51 RIS (7.62x51mm)",
 ["HK MC51 (7.62x51mm) folded"] = "HK MC51 RIS (7.62x51mm) folded",
 ["HK MC51 S (7.62x51mm)"] = "HK MC51 RIS S (7.62x51mm)",
 ["HK MC51 CIV (7.62x51mm)"] = "HK MC51 RIS CIV (7.62x51mm)",
 ["HK MC51 CIV (7.62x51mm) folded"] = "HK MC51 RIS CIV (7.62x51mm) folded",
 ["HK MC51 S CIV (7.62x51mm)"] = "HK MC51 RIS S CIV (7.62x51mm)",
-- ["Assault Rifle Galil SAR (5.56mm)"] = "Assault Rifle Galil SAR (5.56mm)+M203",
-- ["Assault Rifle Galil AR (5.56mm)"] = "Assault Rifle Galil AR (5.56mm)+M203",
--parts
 ["MP5 forestock RIS"] = "MP5 forestock",
 ["MP5 forestock"] = "MP5 forestock RIS",
 ["HK53 forestock RIS"] = "HK53 forestock",
 ["HK53 forestock"] = "HK53 forestock RIS",
 ["M4 forestock RIS"] = "M4 forestock",
 ["M4 forestock"] = "M4 forestock RIS",
 ["DaewooRIS"] = "DaewooHG",
 ["DaewooHG"] = "DaewooRIS",
 ["Type81 forestock RIS"] = "Type81 forestock",
 ["Type81 forestock"] = "Type81 forestock RIS",
 ["MC51 forestock RIS"] = "MC51 forestock",
 ["MC51 forestock"] = "MC51 forestock RIS",
-- ["Galil forestock"] = "M203B (40mm LV)",
}

 local RISForestockItems = {
--weapons with RIS
 ["Submachine-gun HK MP5A5 RIS (9mm)"] = "Submachine-gun HK MP5A5 (9mm)",
 ["Submachine-gun HK MP5A5 RIS (9mm) folded"] = "Submachine-gun HK MP5A5 (9mm) folded", 
 ["Submachine-gun NR-08 RIS (9mm)"] = "Submachine-gun NR-08 (9mm)",
 ["Submachine-gun NR-08 RIS (9mm) folded"] = "Submachine-gun NR-08 (9mm) folded", 
 ["Submachine-gun HK MP5A5 RIS (.40 S&W)"] = "Submachine-gun HK MP5A5 (.40 S&W)",
 ["Submachine-gun HK MP5A5 RIS (.40 S&W) folded"] = "Submachine-gun HK MP5A5 (.40 S&W) folded",
 ["Submachine-gun HK MP5A5 RIS (10)"] = "HK MP5A3 (10)",
 ["Submachine-gun HK MP5A5 RIS (10) folded"] = "HK MP5A3 (10) folded",
 ["HK MP5A5 RIS (22)"] = "HK MP5A3 (22)",
 ["HK MP5A5 RIS (22) folded"] = "HK MP5A3 (22) folded",
 ["Assault Rifle DaewooK1R (5.56mm)"] = "Assault Rifle DaewooK1O (5.56mm)",
 ["Assault Rifle DaewooK1R (5.56mm) folded"] = "Assault Rifle DaewooK1O (5.56mm) folded",
 ["Assault Rifle DaewooK2R (5.56mm)"] = "Assault Rifle DaewooK2O (5.56mm)",
 ["Assault Rifle DaewooK2R (5.56mm) folded"] = "Assault Rifle DaewooK2O (5.56mm) folded",
 ["Assault Rifle Daewoo DR100 RIS (5.56mm)"] = "Assault Rifle Daewoo DR100 (5.56mm)",
 ["Assault Rifle Daewoo DR100 RIS (5.56mm) folded"] = "Assault Rifle Daewoo DR100 (5.56mm) folded",
 ["Assault Rifle Daewoo DR200 RIS (5.56mm)"] = "Assault Rifle Daewoo DR200 (5.56mm)",
 ["Assault Rifle Daewoo DR300 RIS (7.62mm)"] = "Assault Rifle Daewoo DR300 (7.62mm)",
 ["Assault Rifle HK53A3 RIS (5.56mm)"] = "Assault Rifle HK53A3 (5.56mm)",
 ["Assault Rifle HK53A3 RIS (5.56mm) folded"] = "Assault Rifle HK53A3 (5.56mm) folded",
 ["Assault Rifle M4A1 RIS (5.56mm)"] = "Assault Rifle M4A1 (5.56mm)",
 ["Assault Rifle M4A1 RIS (5.56mm) folded"] = "Assault Rifle M4A1 (5.56mm) folded",
 ["Assaul Rifle Type81 Tac"] = "Assaul Rifle Type81",
 ["Assaul Rifle Type81 Tac folded"] = "Assaul Rifle Type81 folded",
 ["Assaul Rifle Type81S Tac"] = "Assaul Rifle Type81S",
 ["HK MC51 RIS (7.62x51mm)"] = "HK MC51 (7.62x51mm)",
 ["HK MC51 RIS (7.62x51mm) folded"] = "HK MC51 (7.62x51mm) folded",
 ["HK MC51 RIS S (7.62x51mm)"] = "HK MC51 S (7.62x51mm)",
 ["HK MC51 RIS CIV (7.62x51mm)"] = "HK MC51 CIV (7.62x51mm)",
 ["HK MC51 RIS CIV (7.62x51mm) folded"] = "HK MC51 CIV (7.62x51mm) folded",
 ["HK MC51 RIS S CIV (7.62x51mm)"] = "HK MC51 S CIV (7.62x51mm)",
 --["Assault Rifle Galil SAR (5.56mm)+M203"] = "Assault Rifle Galil SAR (5.56mm)",
 --["Assault Rifle Galil AR (5.56mm)+M203"] = "Assault Rifle Galil AR (5.56mm)",
}

 local StockItems = {
--weapons with const stock
-- ["Submachine-gun HK MP5SD6 (9mm)"] = "Submachine-gun HK MP5SD5 (9mm)",
--parts
 ["MP5 butt A3"] = "MP5 butt A2",
 ["MP5 butt A2"] = "MP5 butt A3",
}

 local FoldStockItems = {
--weapons with foldable stock
 ["Submachine-gun HK MP5A5 (9mm)"] = "Submachine-gun HK MP5A5 (9mm)",
 ["Submachine-gun HK MP5A5 (9mm) folded"] = "Submachine-gun HK MP5A5 (9mm)", 
 ["Submachine-gun NR-08 (9mm)"] = "Submachine-gun NR-08 (9mm)",
 ["Submachine-gun NR-08 (9mm) folded"] = "Submachine-gun NR-08 (9mm)", 
 ["Submachine-gun HK MP5A5 (.40 S&W)"] = "Submachine-gun HK MP5A5 (.40 S&W)",
 ["Submachine-gun HK MP5A5 (.40 S&W) folded"] = "Submachine-gun HK MP5A5 (.40 S&W)",
 ["Submachine-gun HK MP5SD5 (9mm)"] = "Submachine-gun HK MP5SD5 (9mm)",
 ["Submachine-gun HK MP5SD5 (9mm) folded"] = "Submachine-gun HK MP5SD5 (9mm)",
 ["Submachine-gun HK MP5+M203 (9mm)"] = "Submachine-gun HK MP5+M203 (9mm)",
 ["Submachine-gun HK MP5+M203 (9mm) folded"] = "Submachine-gun HK MP5+M203 (9mm)",
 ["Submachine-gun HK MP5+M203 (40)"] = "Submachine-gun HK MP5+M203 (40)",
 ["Submachine-gun HK MP5+M203 (40) folded"] = "Submachine-gun HK MP5+M203 (40)",
 ["Submachine-gun HK MP5+M203 (10)"] = "Submachine-gun HK MP5+M203 (10)",
 ["Submachine-gun HK MP5+M203 (10) folded"] = "Submachine-gun HK MP5+M203 (10)",
 ["HK MP5A3 (10)"] = "HK MP5A3 (10)",
 ["HK MP5A3 (10) folded"] = "HK MP5A3 (10)",
 ["HK MP5A3 (22)"] = "HK MP5A3 (22)",
 ["HK MP5A3 (22) folded"] = "HK MP5A3 (22)",
 ["HK MP5SD5 22"] = "HK MP5SD5 22",
 ["HK MP5SD5 22 folded"] = "HK MP5SD5 22",
 ["Assault Rifle HK53A3 (5.56mm)"] = "Assault Rifle HK53A3 (5.56mm)",
 ["Assault Rifle HK53A3 (5.56mm) folded"] = "Assault Rifle HK53A3 (5.56mm)",
 ["HK MC51 (7.62x51mm)"] = "HK MC51 (7.62x51mm)",
 ["HK MC51 (7.62x51mm) folded"] = "HK MC51 (7.62x51mm)",
 ["Assault Rifle G41 (5.56mm)"] = "Assault Rifle G41 (5.56mm)",
 ["Assault Rifle G41 (5.56mm) folded"] = "Assault Rifle G41 (5.56mm)",
 ["Assault Rifle G41K (5.56mm)"] = "Assault Rifle G41K (5.56mm)",
 ["Assault Rifle G41K (5.56mm) folded"] = "Assault Rifle G41K (5.56mm)",
 
--with RIS
 ["Submachine-gun HK MP5A5 RIS (9mm)"] = "Submachine-gun HK MP5A5 RIS (9mm)",
 ["Submachine-gun HK MP5A5 RIS (9mm) folded"] = "Submachine-gun HK MP5A5 RIS (9mm) folded",
 ["Submachine-gun HK MP5A5 RIS (.40 S&W)"] = "Submachine-gun HK MP5A5 RIS (.40 S&W)",
 ["Submachine-gun HK MP5A5 RIS (.40 S&W) folded"] = "Submachine-gun HK MP5A5 RIS (.40 S&W) folded",
 ["Submachine-gun HK MP5A5 RIS (10)"] = "Submachine-gun HK MP5A5 RIS (10)",
 ["Submachine-gun HK MP5A5 RIS (10) folded"] = "Submachine-gun HK MP5A5 RIS (10)",
 [ "HK MP5A5 RIS (22)"] =  "HK MP5A5 RIS (22)",
 [ "HK MP5A5 RIS (22) folded"] =  "HK MP5A5 RIS (22)",
 ["Assault Rifle HK53A3 RIS (5.56mm)"] = "Assault Rifle HK53A3 RIS (5.56mm)",
 ["Assault Rifle HK53A3 RIS (5.56mm) folded"] = "Assault Rifle HK53A3 RIS (5.56mm) folded",
--stocks
 ["MP5 butt A3"] = "MP5 Butt",
 ["MP5 Butt"] = "MP5 butt A3",
 ["MP5 Butt folded"] = "MP5 butt A3",
 ["MP5 butt A2"] = "MP5 Butt solid",
 ["MP5 Butt solid"] = "MP5 butt A2",
}

 local FoldBayonetItems = {
 ["M44_Bayonet_unfolded"] = "M44_Bayonet",
 ["Sks bayonet_unfolded"] = "Sks bayonet",
 ["Type56 Neddle Bayonet_unfolded"] = "Type56 Neddle Bayonet",
 ["Carcano91 Bayonet ABERTA"] = "Carcano91 Bayonet FOLDED",
--folded
 ["M44_Bayonet"] = "M44_Bayonet_unfolded",
 ["Sks bayonet"] = "Sks bayonet_unfolded",
 ["Type56 Neddle Bayonet"] = "Type56 Neddle Bayonet_unfolded",
 ["Carcano91 Bayonet FOLDED"] = "Carcano91 Bayonet ABERTA",
}

local FoldBipodItems = {
    ["AUG Integrated Bipod"] = "AUG Integrated Bipod folded",
    ["Barret bipod"] = "Barret bipod folded",
    ["FALO Integrated Bipod"] = "FALO Integrated Bipod folded",
    ["G3SG1 bipod"] = "G3SG1 bipod folded",
    ["HK Integrated Bipod"] = "HK Integrated Bipod folded",
    ["M60 Integrated Bipod"] = "M60 Integrated Bipod folded",
    ["Machinegun Bipod (PKM)"] = "Machinegun Bipod (PKM) folded",
    ["Machinegun Bipod (RPD)"] = "Machinegun Bipod (RPD) folded",
    ["Machinegun Bipod (RPK)"] = "Machinegun Bipod (RPK) folded",
    ["MG3 bipod"] = "MG3 bipod folded",
    ["Minimi_bipod"] = "Minimi_bipod folded",
    ["Sniper Bipod (DSR-1)"] = "Sniper Bipod (DSR-1) folded",
    ["SVU bipod"] = "SVU bipod folded",
    ["Galil bipod"] = "Galil bipod folded",
    ["Type 64 Bipod"] = "Type 64 Bipod Folded",
    ["Type 96 Bipod"] = "Type 96 Bipod Folded",
    ["Type 99 Bipod"] = "Type 99 Bipod Folded",
    ["Bipod MG34"] = "Bipod MG34 Folded",
    ["Stoner63 Bipod"] = "Stoner63 Bipod Folded",
    ["FN Mag Bipod"] = "FN Mag Bipod Folded",
    ["Lewis Bipod"] = "Lewis Bipod Folded",
    ["RP46Bipod"] = "RP46Bipod Folded",
    ["BAR bipod"] = "BAR bipod Folded",
    ["Type88Bipod"] = "Type88Bipod Folded",
	["T81 Bipod"] = "T81 Bipod Folded",
    ["Machinegun Bipod (DP27)"] = "Machinegun Bipod (DP27) Folded",
    ["PZB39 Bipod"] = "PZB39 Bipod Folded",
    ["HS50 bipod"] = "HS50 bipod Folded",
    ["CheyTac bipod"] = "CheyTac bipod Folded",
    ["OSV96 Bipod"] = "OSV96 Bipod Folded",
    ["KSVK Bipod"] = "KSVK Bipod Folded",
    ["AMR2 Bipod"] = "AMR2 Bipod Folded",
    ["WZ35 Bipod"] = "WZ35 Bipod Folded",
    --съемные REMOVABLES
    ["G36 bipod"] = "G36 bipod folded",
	["NEGEV Bipod"] = "NEGEV Bipod Folded",
    ["L96A1 bipod"] = "L96A1 bipod folded",
    ["L86_Bipod"] = "L86_Bipod folded",
    ["SV98 bipod"] = "SV98 bipod folded",
    ["Sniper Bipod Series 1A2"] = "Sniper Bipod Series 1A2 folded",
    ["Harris Bipod WR"] = "Harris Bipod WR folded",
    ["SIG bipod"] = "SIG bipod folded",
    ["Tactical Bipod BM"] = "Tactical Bipod BM folded",
	["Type 89 Bipod"] = "Type 89 Bipod Folded",
    ["Famas Bipod"] = "Famas Bipod Folded",
    ["Arisaka Bipod"] = "Arisaka Bipod Folded",
	["QBBBipod"] = "QBBBipod Folded",
	["AR7090 Bipod"] = "AR7090 Bipod Folded",
	["SIG550 Bipod"] = "SIG550 Bipod Folded",
	["QBUBipod"] = "QBUBipod Folded",
	["RPK Bipod Nova"] = "RPK Bipod Nova Folded",
	["RPK Bipod Nova Wide"] = "RPK Bipod Nova Wide Folded",
	["RPK12 Bipod"] = "RPK12 Bipod Folded",
	["Zastava Bipod"] = "Zastava Bipod Folded",
	["Valmet78 Bipod"] = "Valmet78 Bipod Folded",
}
local UnFoldBipodItems = {}
for unfolded,folded in pairs(FoldBipodItems) do
    UnFoldBipodItems[folded] = unfolded
end

 local SawedoffGuns = {
 ["Carabine Winchester 1892 trapper (.45 Colt)"] = "Carabine Winchester Sawedoff (.45 Colt)",
 ["Carabine Winchester 1892 (.44 Magnum)"] = "Carabine Winchester Sawedoff (.44 Magnum)",
 ["Carabine Winchester 1892 trapper (.44 Magnum)"] = "Carabine Winchester Sawedoff (.44 Magnum)",
 ["Rifle Mosin_m91-30 (7.62x54mm)"] = "Rifle Mosin Sawedoff (7.62x54 mm)",
 ["Shotgun CoachGun (12ga)"] = "Shotgun CoachGun SawedOff (12ga)",
 ["Shotgun CoachGun (20ga)"] = "Sgun2Bs (20ga)",
 ["Rifle Elephant Gun"] = "Rifle Elephant Gun Sawnoff",
 ["Rifle Elephant Gun Unique"] = "Rifle Elephant Gun Unique Sawnoff",
}

-- Функции проверки, можно ли отобразить пункт меню
function CanCutBarrel(item)
	local monster = GetCurrentMerc()
	-- проверяем что данный итем находится у нас в инвентаре и что у нас есть необходимые инструменты
	return	CanModWeapon(monster, item)
		and SawedoffGuns[monster:GetHands():GetName()] ~= nil
end

function CanAddForestock(item)
	local monster = GetCurrentMerc()
	local ForestockCompatibility = {
		["Submachine-gun HK MP5A5 RIS (9mm)"] = "MP5 forestock",
		["Submachine-gun HK MP5A5 RIS (9mm) folded"] = "MP5 forestock",
		["Submachine-gun NR-08 RIS (9mm)"] = "MP5 forestock",
		["Submachine-gun NR-08 RIS (9mm) folded"] = "MP5 forestock",
		["Submachine-gun HK MP5A5 RIS (.40 S&W)"] = "MP5 forestock",
		["Submachine-gun HK MP5A5 RIS (.40 S&W) folded"] = "MP5 forestock",
		["Submachine-gun HK MP5A5 RIS (10)"] = "MP5 forestock",
		["Submachine-gun HK MP5A5 RIS (10) folded"] = "MP5 forestock",
		["HK MP5A5 RIS (22)"] = "MP5 forestock",
		["HK MP5A5 RIS (22) folded"] = "MP5 forestock",
		["Assault Rifle DaewooK1R (5.56mm)"] = "DaewooHG",
		["Assault Rifle DaewooK1R (5.56mm) folded"] = "DaewooHG",
		["Assault Rifle DaewooK2R (5.56mm)"] = "DaewooHG",
		["Assault Rifle DaewooK2R (5.56mm) folded"] = "DaewooHG",
		["Assault Rifle Daewoo DR100 RIS (5.56mm)"] = "DaewooHG",
		["Assault Rifle Daewoo DR100 RIS (5.56mm) folded"] = "DaewooHG",
		["Assault Rifle Daewoo DR200 RIS (5.56mm)"] = "DaewooHG",
		["Assault Rifle Daewoo DR300 RIS (7.62mm)"] = "DaewooHG",
		["Assault Rifle HK53A3 RIS (5.56mm)"] = "HK53 forestock",
		["Assault Rifle HK53A3 RIS (5.56mm) folded"] = "HK53 forestock",
		["Assault Rifle M4A1 RIS (5.56mm)"] = "M4 forestock",
		["Assault Rifle M4A1 RIS (5.56mm) folded"] = "M4 forestock",
		["Assaul Rifle Type81 Tac"] = "Type81 forestock",
		["Assaul Rifle Type81 Tac folded"] = "Type81 forestock",
		["Assaul Rifle Type81S Tac"] = "Type81 forestock",
		["HK MC51 RIS (7.62x51mm)"] = "MC51 forestock",
		["HK MC51 RIS (7.62x51mm) folded"] = "MC51 forestock",
		["HK MC51 RIS S (7.62x51mm)"] = "MC51 forestock",
		["HK MC51 RIS CIV (7.62x51mm)"] = "MC51 forestock",
		["HK MC51 RIS CIV (7.62x51mm) folded"] = "MC51 forestock",
		["HK MC51 RIS S CIV (7.62x51mm)"] = "MC51 forestock",
	}

	-- проверяем что доступна модификация цевья
	if ForestockCompatibility[monster:GetHands():GetName()] == item:GetName() then
		return	CanModWeapon(monster, item)
			and RISForestockItems[monster:GetHands():GetName()] ~= nil
	end
end

function CanAddRISForestock(item)
	local monster = GetCurrentMerc()
	local RISForestockCompatibility = {
		["Submachine-gun HK MP5A5 (9mm)"] = "MP5 forestock RIS",
		["Submachine-gun HK MP5A5 (9mm) folded"] = "MP5 forestock RIS",
		["Submachine-gun NR-08 (9mm)"] = "MP5 forestock RIS",
		["Submachine-gun NR-08 (9mm) folded"] = "MP5 forestock RIS",
		["Submachine-gun HK MP5A5 (.40 S&W)"] = "MP5 forestock RIS",
		["Submachine-gun HK MP5A5 (.40 S&W) folded"] = "MP5 forestock RIS",
		["HK MP5A3 (10)"] = "MP5 forestock RIS",
		["HK MP5A3 (10) folded"] = "MP5 forestock RIS",
		["HK MP5A3 (22)"] = "MP5 forestock RIS",
		["HK MP5A3 (22) folded"] = "MP5 forestock RIS",
		["Assault Rifle HK53A3 (5.56mm)"] = "HK53 forestock RIS",
		["Assault Rifle HK53A3 (5.56mm) folded"] = "HK53 forestock RIS",
		["Assault Rifle DaewooK1O (5.56mm)"] = "DaewooRIS",
		["Assault Rifle DaewooK1O (5.56mm) folded"] = "DaewooRIS",
		["Assault Rifle DaewooK2O (5.56mm)"] = "DaewooRIS",
		["Assault Rifle DaewooK2O (5.56mm) folded"] = "DaewooRIS",
		["Assault Rifle Daewoo DR100 (5.56mm)"] = "DaewooRIS",
		["Assault Rifle Daewoo DR100 (5.56mm) folded"] = "DaewooRIS",
		["Assault Rifle Daewoo DR200 (5.56mm)"] = "DaewooRIS",
		["Assault Rifle Daewoo DR300 (7.62mm)"] = "DaewooRIS",
		["Assault Rifle M4A1 (5.56mm)"] = "M4 forestock RIS",
		["Assault Rifle M4A1 (5.56mm) folded"] = "M4 forestock RIS",
		["Assaul Rifle Type81"] = "Type81 forestock RIS",
		["Assaul Rifle Type81 folded"] = "Type81 forestock RIS",
		["Assaul Rifle Type81S"] = "Type81 forestock RIS",
		["HK MC51 (7.62x51mm)"] = "MC51 forestock RIS",
		["HK MC51 (7.62x51mm) folded"] = "MC51 forestock RIS",
		["HK MC51 S (7.62x51mm)"] = "MC51 forestock RIS",
		["HK MC51 CIV (7.62x51mm)"] = "MC51 forestock RIS",
		["HK MC51 CIV (7.62x51mm) folded"] = "MC51 forestock RIS",
		["HK MC51 S CIV (7.62x51mm)"] = "MC51 forestock RIS",
	}

	-- проверяем что доступна модификация цевья
	if RISForestockCompatibility[monster:GetHands():GetName()] == item:GetName() then
		return	CanModWeapon(monster, item)
			and ForestockItems[monster:GetHands():GetName()] ~= nil
	end
end

function CanChangeFoldStock(item)
	local monster = GetCurrentMerc()
	local device = GetAddon(monster:GetHands(), AddonTypes.adStock)
	-- проверяем что доступна модификация приклада
	return	CanModWeapon(monster, item)
		and FoldStockItems[monster:GetHands():GetName()] ~= nil
		and item:GetName() ~= FoldStockItems[device:GetName()]
end

function CanChangeStock(item)
	local monster = GetCurrentMerc()
	local device = GetAddon(monster:GetHands(), AddonTypes.adStock)
	-- проверяем что доступна модификация приклада
	-- либо цельнолитая модель
	-- либо модульная, но не с таким же прикладом

	return	CanModWeapon(monster, item)
		and (StockItems[monster:GetHands():GetName()] ~= nil
		or (FoldStockItems[monster:GetHands():GetName()] ~= nil and item:GetName() ~= FoldStockItems[device:GetName()]))

end

function CanFoldBayonet(item)
	local monster = GetCurrentMerc()
	-- проверяем что доступно складывание штыка
	return	FoldBayonetItems[item:GetName()] ~= nil
		and GetAddon(monster:GetHands(), AddonTypes.adBayonet) == item
end

function CanFoldBipod(item)
	local monster = GetCurrentMerc()
    local hands = monster:GetHands()
	-- проверяем что доступно складывание сошек
    return hands ~= nil and GetAddon(hands, AddonTypes.adBipod) == item
    --[[ Поидее это всё вообще не нужно, ведь мы уже проверяем пункт у того предмета, для которого разрешено!
	if GetAddon(monster:GetHands(), AddonTypes.adBipod) == item then
		if FoldBipodItems[item:GetName()] ~= nil then
			return true
		else
			for key, value in pairs(FoldBipodItems) do
				if value == item:GetName() then return true end
			end
		end
	end

	return false
	]]
end

-- Функция-обработчик клика по пункту меню
function CutBarrel (item)
    local monster = GetCurrentMerc()
    local hands_item = monster:GetHands()
    local similar_item = SawedoffGuns[hands_item:GetName()]
    
    if similar_item ~= nil then
	hands_item:ChangeItemType(similar_item)
        SmartSkip(240, 30)
    else
	monster:Say(_t"lang/lua/tuning/fail")
    end
end

function ChangeForestock(item)
 local monster = GetCurrentMerc()
 local item_name, success
 local hands_item = monster:GetHands()
 local similar_item = ForestockItems[hands_item:GetName()]
 if similar_item == nil then similar_item = RISForestockItems[hands_item:GetName()] end

 if similar_item ~= nil then
	local device1 = monster:GetHands():RemoveAddon(AddonTypes.adLaser)
	local device2 = monster:GetHands():RemoveAddon(AddonTypes.adLight)

	hands_item:ChangeItemType(similar_item)
	item:ChangeItemType(ForestockItems[item:GetName()])


	if device1 ~=nil then
		item_name, success = monster:AddItem(device1)
		if not success then DropItem(device1) end
	end
	if device2 ~=nil then
		item_name, success = monster:AddItem(device2)
		if not success then DropItem(device2) end
	end
	monster:AddChangeItemAction(30)
 else
	monster:Say(_t"lang/lua/tuning/cant_replace_fore-end")
 end
end

function ChangeStock(item)
 local permanent_stock = false
 local monster = GetCurrentMerc()
 local hands_item = monster:GetHands()
 local similar_item = FoldStockItems[hands_item:GetName()]
 local butt = nil

 if similar_item == nil then 
	similar_item = StockItems[hands_item:GetName()]
	permanent_stock = true
 end

 if similar_item ~= nil then
--снимаем имеющийся приклад
	local device = monster:GetHands():RemoveAddon(AddonTypes.adStock)

--планирование выдачи снятого приклада
	if (device ~= nil) then 
		butt = FoldStockItems[device:GetName()]
		monster:DeleteItem(device)
	else
		if (permanent_stock == true) then
			butt = "MP5 butt A2"
		end
	end

--замена оружия в руках, если требуется
	if(hands_item:GetName() ~= similar_item) then
		hands_item:ChangeItemType(similar_item) end

--установить приклад-аттач, если требуется
	local new_butt = FoldStockItems[item:GetName()]
	if new_butt ~= nil then hands_item:AttachAddon(new_butt) end

--произвести замену использованного приклада в инвентаре
--иначе - просто удалить донорский приклад
	if (butt ~= nil) then
		item:ChangeItemType(butt)
	else
		monster:DeleteItem(item)
	end
	monster:AddChangeItemAction(30)
 else
	monster:Say(_t"lang/lua/tuning/cant_replace_butt")
 end
end

function FoldBayonet(item)
 local monster = GetCurrentMerc()
 local hands_item = monster:GetHands()
 local similar_item = FoldBayonetItems[item:GetName()]

 if similar_item ~= nil then
--снимаем имеющийся штык
	local device = hands_item:RemoveAddon(AddonTypes.adBayonet)
--замена
	if (device ~= nil) then 
		device:ChangeItemType(similar_item)
		hands_item:AttachAddon(similar_item)
		monster:AddChangeItemAction(2)
	end
 else
	monster:Say(_t"lang/lua/tuning/cant_toggle_bayonet")
 end
end

function FoldBipod(item)
 local monster = GetCurrentMerc()
 local hands_item = monster:GetHands()
 local similar_item = FoldBipodItems[item:GetName()]
 if similar_item == nil then
	for key, value in pairs(FoldBipodItems) do
		if value == item:GetName() then
			similar_item = key
			break
		end
	end
 end

 if similar_item ~= nil then
--снимаем имеющиеся сошки
	local device = hands_item:RemoveAddon(AddonTypes.adBipod)
--замена
	if (device ~= nil) then 
		device:ChangeItemType(similar_item)
		hands_item:AttachAddon(device)
		monster:AddChangeItemAction(2)
	end
 else
	monster:Say(_t"lang/lua/tuning/cant_toggle_bipods")
 end
end

local function CanFoldWeaponBipod(item)
    if item:GetFamily() == Family.ifWeapon then
        local bipod = GetAddon(item, AddonTypes.adBipod)
        return bipod ~= nil and FoldBipodItems[bipod:GetName()] ~= nil
    end
    return false
end

local function CanUnfoldWeaponBipod(item)
    if item:GetFamily() == Family.ifWeapon then
        local bipod = GetAddon(item, AddonTypes.adBipod)
        return bipod ~= nil and UnFoldBipodItems[bipod:GetName()] ~= nil
    end
    return false
end

local function FoldWeaponBipod(item)
    local bipod = item:RemoveAddon(AddonTypes.adBipod)

    if bipod ~= nil then
        local folded = FoldBipodItems[bipod:GetName()]
        bipod:ChangeItemType(folded)
        item:AttachAddon(bipod)
        GetCurrentMerc():AddChangeItemAction(2)
    end
end

local function UnfoldWeaponBipod(item)
    local bipod = item:RemoveAddon(AddonTypes.adBipod)

    if bipod ~= nil then
        local unfolded = UnFoldBipodItems[bipod:GetName()]
        bipod:ChangeItemType(unfolded)
        item:AttachAddon(bipod)
        GetCurrentMerc():AddChangeItemAction(2)
    end
end


-- Создание пункта меню и привязка к нему функции обработчика и анонимной функции проверки доступности данного пункта меню
-- четвёртый параметр - функция проверки, можно ли отобразить данный пункт меню
local action_cut_barrel = _t"lang/lua/tuning/cut_barrel"

AddItemContextMenu("Carabine Winchester 1892 (.44 Magnum)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Carabine Winchester 1892 trapper (.45 Colt)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Carabine Winchester 1892 trapper (.44 Magnum)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Rifle Mosin_m91-30 (7.62x54mm)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Shotgun CoachGun (12ga)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Shotgun CoachGun (20ga)", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Rifle Elephant Gun", action_cut_barrel, CutBarrel, CanCutBarrel)
AddItemContextMenu("Rifle Elephant Gun Unique", action_cut_barrel, CutBarrel, CanCutBarrel)

local action_replace_for_end = _t"lang/lua/tuning/replace_for-end"
local action_replace_butt = _t"lang/lua/tuning/replace_butt"

AddItemContextMenu("MP5 forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("MP5 forestock RIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("HK53 forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("HK53 forestock RIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("M4 forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("M4 forestock RIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("DaewooHG", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("DaewooRIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("Type81 forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("Type81 forestock RIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("MC51 forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("MC51 forestock RIS", action_replace_for_end, ChangeForestock, CanAddRISForestock)
--AddItemContextMenu("Galil forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("M203B (40mm LV)", _t"lang/lua/tuning/mount", ChangeForestock, CanAddRISForestock)
AddItemContextMenu("MP5 butt A2", action_replace_butt, ChangeStock, CanChangeFoldStock)
AddItemContextMenu("MP5 butt A3", action_replace_butt, ChangeStock, CanChangeStock)

local action_fold = _t"lang/lua/tuning/fold"
local action_unfold = _t"lang/lua/tuning/unfold"

AddItemContextMenu("M44_Bayonet_unfolded", action_fold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Sks bayonet_unfolded", action_fold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Type56 Neddle Bayonet_unfolded", action_fold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Carcano91 Bayonet ABERTA", action_fold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("M44_Bayonet", action_unfold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Sks bayonet", action_unfold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Type56 Neddle Bayonet", action_unfold, FoldBayonet, CanFoldBayonet)
AddItemContextMenu("Carcano91 Bayonet FOLDED", action_unfold, FoldBayonet, CanFoldBayonet)

AddItemContextMenu("AUG Integrated Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("FALO Integrated Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Barret bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("G3SG1 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("HK Integrated Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("M60 Integrated Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (PKM)", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (RPD)", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (RPK)", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("MG3 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Minimi_bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Sniper Bipod (DSR-1)", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SVU bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("G36 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("L86_Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("L96A1 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SV98 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Sniper Bipod Series 1A2", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Harris Bipod WR", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Galil bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SIG bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Tactical Bipod BM", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 89 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 64 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Famas Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Arisaka Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 96 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 99 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("QBBBipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Bipod MG34", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Stoner63 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("FN Mag Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Lewis Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RP46Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("BAR bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type88Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("NEGEV Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (DP27)", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("PZB39 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("HS50 bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("CheyTac bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("OSV96 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("KSVK Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("AMR2 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("WZ35 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("AR7090 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SIG550 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("QBUBipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK Bipod Nova", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK Bipod Nova Wide", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK12 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Zastava Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Valmet78 Bipod", action_fold, FoldBipod, CanFoldBipod)

AddItemContextMenu("AUG Integrated Bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("FALO Integrated Bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Barret bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("G3SG1 bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("HK Integrated Bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("M60 Integrated Bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (PKM) folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (RPD) folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (RPK) folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("MG3 bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Minimi_bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Sniper Bipod (DSR-1) folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SVU bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("G36 bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("L86_Bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("L96A1 bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SV98 bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Sniper Bipod Series 1A2 folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Harris Bipod WR folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Galil bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SIG bipod folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Tactical Bipod BM folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 89 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 64 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Famas Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Arisaka Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 96 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type 99 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("QBBBipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Bipod MG34 Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Stoner63 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("FN Mag Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Lewis Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RP46Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("BAR bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Type88Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("NEGEV Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Machinegun Bipod (DP27) Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("PZB39 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("HS50 bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("CheyTac bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("OSV96 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("KSVK Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("AMR2 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("WZ35 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("AR7090 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SIG550 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("QBUBipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK Bipod Nova Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK Bipod Nova Wide Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("RPK12 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Zastava Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Valmet78 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)

AddContextMenu(_t"lang/lua/tuning/fold_bipods", FoldWeaponBipod, CanFoldWeaponBipod)
AddContextMenu(_t"lang/lua/tuning/unfold_bipods", UnfoldWeaponBipod, CanUnfoldWeaponBipod)

