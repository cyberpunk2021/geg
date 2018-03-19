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
-- std weapons
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
 ["Machinegun RK71MG (5.56)"] = "Machinegun RK71MG HG (5.56)",
 ["Machinegun RK71MG (308)"] = "Machinegun RK71MG HG (308)",
 ["Machinegun RK71MG (7.62)"] = "Machinegun RK71MG HG (7.62)",
 ["Assault Rifle RK71W (5.56)"] = "Assault Rifle RK71W2 (5.56)",
 ["Assault Rifle RK71W CIV (5.56)"] = "Assault Rifle RK71W2 CIV (5.56)",
 ["Assault Rifle RK71W (7.62)"] = "Assault Rifle RK71W2 (7.62)",
 ["Assault Rifle RK71W CIV (7.62)"] = "Assault Rifle RK71W2 CIV (7.62)",
-- ["Assault Rifle Galil SAR (5.56mm)"] = "Assault Rifle Galil SAR (5.56mm)+M203",
-- ["Assault Rifle Galil AR (5.56mm)"] = "Assault Rifle Galil AR (5.56mm)+M203",

-- RIS kits
 ["Revolver Unica 6 (.357)"] = "Revolver Unica 6 RIS (.357)",
 ["Revolver Unica 6 (.44)"] = "Revolver Unica 6 RIS (.44)",
 ["PP90M1 (9x19)"] = "PP90M1 RIS (9x19)",
 ["PP90M1 (9x19) folded"] = "PP90M1 RIS (9x19) folded",
 ["PP90M1 (9x19)"] = "PP90M1 RIS (9x19)",
 ["PP90M1 (9x19) folded"] = "PP90M1 RIS (9x19) folded",
 ["IMBEL M964A1 MD1"] = "IMBEL ParaFal (7.62x51mm)",
 ["IMBEL M964A1 MD1 folded"] = "IMBEL ParaFal (7.62x51mm) folded",
 ["Carabine IMBEL M964A1 MD3"] = "Carabine IMBEL ParaFal (7.62x51mm)",
 ["Carabine IMBEL M964A1 MD3 folded"] = "Carabine IMBEL ParaFal (7.62x51mm) folded",
 ["Carabine M1A (7.62x51mm)"] = "Carabine M1A RIS (7.62x51mm)",
 ["Carabine M1A WOOD (7.62x51mm)"] = "Carabine M1A WOOD RIS (7.62x51mm)",
 ["Carabine M1A Scout (7.62x51mm)"] = "Carabine M1A Scout RIS (7.62x51mm)",
 ["Carabine M1A Scout POLY (7.62x51mm)"] = "Carabine M1A Scout POLY RIS (7.62x51mm)",
 ["Carabine SOCOM16 NO RIS (7.62x51mm)"] = "Carabine SOCOM16 (7.62x51mm)",
 ["Carabine SOCOM16 WOOD NO RIS (7.62x51mm)"] = "Carabine SOCOM16 WOOD RIS (7.62x51mm)",

-- parts
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
 ["RK71HG"] = "RK71W2HG",
 ["RK71W2HG"] = "RK71HG",
-- ["Galil forestock"] = "M203B (40mm LV)",
 
-- RIS parts
 ["RIS kit (Mateba Model 6)"] = "Stock kit (Mateba Model 6)",
 ["Stock kit (Mateba Model 6)"] = "RIS kit (Mateba Model 6)",
 ["RIS kit (PP-90M1)"] = "Stock kit (PP-90M1)",
 ["Stock kit (PP-90M1)"] = "RIS kit (PP-90M1)",
 ["RIS kit (IMBEL M964A1)"] = "Stock kit (IMBEL M964A1)",
 ["Stock kit (IMBEL M964A1)"] = "RIS kit (IMBEL M964A1)",
 ["RIS kit (M1A)"] = "Stock kit (M1A)",
 ["Stock kit (M1A)"] = "RIS kit (M1A)",
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
 ["Machinegun RK71MG HG (5.56)"] = "Machinegun RK71MG (5.56)",
 ["Machinegun RK71MG HG (308)"] = "Machinegun RK71MG (308)",
 ["Machinegun RK71MG HG (7.62)"] = "Machinegun RK71MG (7.62)",
 ["Assault Rifle RK71W2 (5.56)"] = "Assault Rifle RK71W (5.56)",
 ["Assault Rifle RK71W2 CIV (5.56)"] = "Assault Rifle RK71W CIV (5.56)",
 ["Assault Rifle RK71W2 (7.62)"] = "Assault Rifle RK71W (7.62)",
 ["Assault Rifle RK71W2 CIV (7.62)"] = "Assault Rifle RK71W CIV (7.62)",
-- ["Assault Rifle Galil SAR (5.56mm)+M203"] = "Assault Rifle Galil SAR (5.56mm)",
-- ["Assault Rifle Galil AR (5.56mm)+M203"] = "Assault Rifle Galil AR (5.56mm)",

-- RIS kits
 ["Revolver Unica 6 RIS (.357)"] = "Revolver Unica 6 (.357)",
 ["Revolver Unica 6 RIS (.44)"] = "Revolver Unica 6 (.44)",
 ["PP90M1 RIS (9x19)"] = "PP90M1 (9x19)",
 ["PP90M1 RIS (9x19) folded"] = "PP90M1 (9x19) folded",
 ["IMBEL ParaFal (7.62x51mm)"] = "IMBEL M964A1 MD1",
 ["IMBEL ParaFal (7.62x51mm) folded"] = "IMBEL M964A1 MD1 folded",
 ["Carabine IMBEL ParaFal (7.62x51mm)"] = "Carabine IMBEL M964A1 MD3",
 ["Carabine IMBEL ParaFal (7.62x51mm) folded"] = "Carabine IMBEL M964A1 MD3 folded",
 ["Carabine M1A RIS (7.62x51mm)"] = "Carabine M1A (7.62x51mm)",
 ["Carabine M1A WOOD RIS (7.62x51mm)"] = "Carabine M1A WOOD (7.62x51mm)",
 ["Carabine M1A Scout RIS (7.62x51mm)"] = "Carabine M1A Scout (7.62x51mm)",
 ["Carabine M1A Scout POLY RIS (7.62x51mm)"] = "Carabine M1A Scout POLY (7.62x51mm)",
 ["Carabine SOCOM16 (7.62x51mm)"] = "Carabine SOCOM16 NO RIS (7.62x51mm)",
 ["Carabine SOCOM16 WOOD RIS (7.62x51mm)"] = "Carabine SOCOM16 WOOD NO RIS (7.62x51mm)",
}

 local StockItems = {
--weapons with const stock
-- ["Submachine-gun HK MP5SD6 (9mm)"] = "Submachine-gun HK MP5SD5 (9mm)",
--parts
 ["MP5 butt A3"] = "MP5 butt A2",
 ["MP5 butt A2"] = "MP5 butt A3",
 ["Car15 Stock"] = "M4A1 Stock",
 ["M4A1 Stock"] = "Car15 Stock",
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
 ["Assault Rifle HK33EA3 (5.56mm)"] = "Assault Rifle HK33EA3 (5.56mm)",
 ["Assault Rifle HK33EA3 (5.56mm) folded"] = "Assault Rifle HK33EA3 (5.56mm)",
 ["Assault Rifle HK53A3 (5.56mm)"] = "Assault Rifle HK53A3 (5.56mm)",
 ["Assault Rifle HK53A3 (5.56mm) folded"] = "Assault Rifle HK53A3 (5.56mm)",
 ["Assault Rifle HK91A3 (7.62x51mm)"] = "Assault Rifle HK91A3 (7.62x51mm)",
 ["Assault Rifle HK91A3 (7.62x51mm) folded"] = "Assault Rifle HK91A3 (7.62x51mm)",
 ["Assault Rifle HK93EA3 (5.56mm)"] = "Assault Rifle HK93EA3 (5.56mm)",
 ["Assault Rifle HK93EA3 (5.56mm) folded"] = "Assault Rifle HK93EA3 (5.56mm)",
 ["HK MC51 (7.62x51mm)"] = "HK MC51 (7.62x51mm)",
 ["HK MC51 (7.62x51mm) folded"] = "HK MC51 (7.62x51mm)",
 ["HK MC51 CIV (7.62x51mm)"] = "HK MC51 CIV (7.62x51mm)",
 ["HK MC51 CIV (7.62x51mm) folded"] = "HK MC51 CIV (7.62x51mm)",
 ["HK MC51 RIS (7.62x51mm)"] = "HK MC51 RIS (7.62x51mm)",
 ["HK MC51 RIS (7.62x51mm) folded"] = "HK MC51 RIS (7.62x51mm)",
 ["HK MC51 RIS FG (7.62x51mm)"] = "HK MC51 RIS FG (7.62x51mm)",
 ["HK MC51 RIS FG (7.62x51mm) folded"] = "HK MC51 RIS FG (7.62x51mm)",
 ["HK MC51 RIS CIV (7.62x51mm)"] = "HK MC51 RIS CIV (7.62x51mm)",
 ["HK MC51 RIS CIV (7.62x51mm) folded"] = "HK MC51 RIS CIV (7.62x51mm)",
 ["HK MC51 RIS CIV FG (7.62x51mm)"] = "HK MC51 RIS CIV FG (7.62x51mm)",
 ["HK MC51 RIS CIV FG (7.62x51mm) folded"] = "HK MC51 RIS CIV FG (7.62x51mm)",
 ["Assault Rifle G3A4 (7.62x51mm)"] = "Assault Rifle G3A4 (7.62x51mm)",
 ["Assault Rifle G3A4 (7.62x51mm) folded"] = "Assault Rifle G3A4 (7.62x51mm)",
 ["Assault Rifle G3KA4 (7.62x51mm)"] = "Assault Rifle G3KA4 (7.62x51mm)",
 ["Assault Rifle G3KA4 (7.62x51mm) folded"] = "Assault Rifle G3KA4 (7.62x51mm)",
 ["Assault Rifle G41 (5.56mm)"] = "Assault Rifle G41 (5.56mm)",
 ["Assault Rifle G41 (5.56mm) folded"] = "Assault Rifle G41 (5.56mm)",
 ["Assault Rifle G41K (5.56mm)"] = "Assault Rifle G41K (5.56mm)",
 ["Assault Rifle G41K (5.56mm) folded"] = "Assault Rifle G41K (5.56mm)",
 
--ARs
 ["Assault Rifle M4A1 CIV (5.56mm)"] = "Assault Rifle M4A1 CIV (5.56mm)",	-- corrected by gpgpgpgp: always converts to unfolded variants, since when a butt ITEM name is given, the returned butt ADDON name is the unfolded one's (example: ITEM name "Car15 Stock" returns "m4_butt", "M4A1 Stock" returns "m4sopmod_butt")
 ["Assault Rifle M4A1 CIV (5.56mm) folded"] = "Assault Rifle M4A1 CIV (5.56mm)",
 ["Assault Rifle M654 (5.56mm)"] = "Assault Rifle M654 (5.56mm)",
 ["Assault Rifle M654 (5.56mm) folded"] = "Assault Rifle M654 (5.56mm)",
 ["Assault Rifle XM177 (22)"] = "Assault Rifle XM177 (22)",
 ["Assault Rifle XM177 (22) folded"] = "Assault Rifle XM177 (22)",
 ["Small Assault Rifle M933 (22)"] = "Small Assault Rifle M933 (22)",
 ["Small Assault Rifle M933 (22) folded"] = "Small Assault Rifle M933 (22)",
 ["Assault Rifle M4 SOPMOD (22)"] = "Assault Rifle M4 SOPMOD (22)",
 ["Assault Rifle M4 SOPMOD (22) folded"] = "Assault Rifle M4 SOPMOD (22)",
 ["Assault Rifle M4 SOPMOD FG (22)"] = "Assault Rifle M4 SOPMOD FG (22)",
 ["Assault Rifle M4 SOPMOD FG (22) folded"] = "Assault Rifle M4 SOPMOD FG (22)",
 ["SW MP15 LB 22"] = "SW MP15 LB 22",
 ["SW MP15 LB 22 folded"] = "SW MP15 LB 22",
 ["HK416 22"] = "HK416 22",
 ["HK416 22 folded"] = "HK416 22",
 ["Submachine-gun Colt SMG (9mm)"] = "Submachine-gun Colt SMG (9mm)",
 ["Submachine-gun Colt SMG (9mm) folded"] = "Submachine-gun Colt SMG (9mm)",
 ["Submachine-gun Colt 635 WR (9mm)"] = "Submachine-gun Colt 635 WR (9mm)",
 ["Submachine-gun Colt 635 WR (9mm) folded"] = "Submachine-gun Colt 635 WR (9mm)",
 ["Submachine-gun Colt 635 WR LB (9mm)"] = "Submachine-gun Colt 635 WR LB (9mm)",
 ["Submachine-gun Colt 635 WR LB (9mm) folded"] = "Submachine-gun Colt 635 WR LB (9mm)",
 ["Submachine-gun K9 (9mm)"] = "Submachine-gun K9 (9mm)",
 ["Submachine-gun K9 (9mm) folded"] = "Submachine-gun K9 (9mm)",
 ["Submachine-gun K40 (.40)"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K40 (.40) folded"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K45 (.45ACP)"] = "Submachine-gun K45 (.45ACP)",
 ["Submachine-gun K45 (.45ACP) folded"] = "Submachine-gun K45 (.45ACP)",
 ["Submachine-gun K40 (.40)"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K40 (.40) folded"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K10 (.10)"] = "Submachine-gun K10 (.10)",
 ["Submachine-gun K10 (.10) folded"] = "Submachine-gun K10 (.10)",
 ["Assault Rifle AR-15A2 (5.56mm)"] = "Assault Rifle AR-15A2 (5.56mm)",
 ["Assault Rifle AR-15A2 (5.56mm) folded"] = "Assault Rifle AR-15A2 (5.56mm)",
 ["Assault Rifle Government Carbine (5.56mm)"] = "Assault Rifle Government Carbine (5.56mm)",
 ["Assault Rifle Government Carbine (5.56mm) folded"] = "Assault Rifle Government Carbine (5.56mm)",
 ["Assault Rifle XM-15-E2S (5.56mm)"] = "Assault Rifle XM-15-E2S (5.56mm)",
 ["Assault Rifle XM-15-E2S (5.56mm) folded"] = "Assault Rifle XM-15-E2S (5.56mm)",
 ["Assault Rifle XM-15-E2S FG (5.56mm)"] = "Assault Rifle XM-15-E2S FG (5.56mm)",
 ["Assault Rifle XM-15-E2S FG (5.56mm) folded"] = "Assault Rifle XM-15-E2S FG (5.56mm)",
 ["Assault Rifle AR-15 CQB (.300 BLK)"] = "Assault Rifle AR-15 CQB (.300 BLK)",
 ["Assault Rifle AR-15 CQB (.300 BLK) folded"] = "Assault Rifle AR-15 CQB (.300 BLK)",
 ["Assault Rifle AR-15 CQB AG (.300 BLK)"] = "Assault Rifle AR-15 CQB AG (.300 BLK)",
 ["Assault Rifle AR-15 CQB AG (.300 BLK) folded"] = "Assault Rifle AR-15 CQB AG (.300 BLK)",
 ["Assault Rifle AR-15 (.300 BLK)"] = "Assault Rifle AR-15 (.300 BLK)",
 ["Assault Rifle AR-15 (.300 BLK) folded"] = "Assault Rifle AR-15 (.300 BLK)",
 ["Small Assault Rifle CAR-15 M619 (5.56mm)"] = "Small Assault Rifle CAR-15 M619 (5.56mm)",
 ["Small Assault Rifle CAR-15 M619 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M619 (5.56mm)",
 ["Small Assault Rifle CAR-15 New (5.56mm)"] = "Small Assault Rifle CAR-15 New (5.56mm)",
 ["Small Assault Rifle CAR-15 New (5.56mm) folded"] = "Small Assault Rifle CAR-15 New (5.56mm)",
 ["Small Assault Rifle CAR-15 M639 (5.56mm)"] = "Small Assault Rifle CAR-15 M639 (5.56mm)",
 ["Small Assault Rifle CAR-15 M639 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M639 (5.56mm)",
 ["Small Assault Rifle CAR-15 M640 (5.56mm)"] = "Small Assault Rifle CAR-15 M640 (5.56mm)",
 ["Small Assault Rifle CAR-15 M640 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M640 (5.56mm)",
 ["Assault Rifle M653 (5.56mm)"] = "Assault Rifle M653 (5.56mm)",
 ["Assault Rifle M653 (5.56mm) folded"] = "Assault Rifle M653 (5.56mm)",
 ["Assault Rifle Colt 723 (5.56mm)"] = "Assault Rifle Colt 723 (5.56mm)",
 ["Assault Rifle Colt 723 (5.56mm) folded"] = "Assault Rifle Colt 723 (5.56mm)",
 ["Assault Rifle CAR-15 (5.56mm)"] = "Assault Rifle CAR-15 (5.56mm)",
 ["Assault Rifle CAR-15 (5.56mm) folded"] = "Assault Rifle CAR-15 (5.56mm)",
 ["Assault Rifle Colt 727 (5.56mm)"] = "Assault Rifle Colt 727 (5.56mm)",
 ["Assault Rifle Colt 727 (5.56mm) folded"] = "Assault Rifle Colt 727 (5.56mm)",
 ["Assault Rifle Colt Commando 733"] = "Assault Rifle Colt Commando 733",
 ["Assault Rifle Colt Commando 733 folded"] = "Assault Rifle Colt Commando 733",
 ["Assault Rifle Colt Commando 933"] = "Assault Rifle Colt Commando 933",
 ["Assault Rifle Colt Commando 933 folded"] = "Assault Rifle Colt Commando 933",
 ["Assault Rifle Colt Commando 933 FG"] = "Assault Rifle Colt Commando 933 FG",
 ["Assault Rifle Colt Commando 933 FG folded"] = "Assault Rifle Colt Commando 933 FG",
 ["Assault Rifle M4A1 (5.56mm)"] = "Assault Rifle M4A1 (5.56mm)",
 ["Assault Rifle M4A1 (5.56mm) folded"] = "Assault Rifle M4A1 (5.56mm)",
 ["Assault Rifle M4A1+M203"] = "Assault Rifle M4A1+M203",
 ["Assault Rifle M4A1+M203 folded"] = "Assault Rifle M4A1+M203",
 ["Assault Rifle M4A1 RIS (5.56mm)"] = "Assault Rifle M4A1 RIS (5.56mm)",
 ["Assault Rifle M4A1 RIS (5.56mm) folded"] = "Assault Rifle M4A1 RIS (5.56mm)",
 ["Assault Rifle M4A1 RIS FG (5.56mm)"] = "Assault Rifle M4A1 RIS FG (5.56mm)",
 ["Assault Rifle M4A1 RIS FG (5.56mm) folded"] = "Assault Rifle M4A1 RIS FG (5.56mm)",
 ["Assault Rifle CQA (5.56mm)"] = "Assault Rifle CQA (5.56mm)",
 ["Assault Rifle CQA (5.56mm) folded"] = "Assault Rifle CQA (5.56mm)",
 ["Small Assault Rifle M4 CQB-R (5.56mm)"] = "Small Assault Rifle M4 CQB-R (5.56mm)",
 ["Small Assault Rifle M4 CQB-R (5.56mm) folded"] = "Small Assault Rifle M4 CQB-R (5.56mm)",
 ["Small Assault Rifle M4 CQB-R FG (5.56mm)"] = "Small Assault Rifle M4 CQB-R FG (5.56mm)",
 ["Small Assault Rifle M4 CQB-R FG (5.56mm) folded"] = "Small Assault Rifle M4 CQB-R FG (5.56mm)",
 ["Assault Rifle LAC (5.56mm)"] = "Assault Rifle LAC (5.56mm)",
 ["Assault Rifle LAC (5.56mm) folded"] = "Assault Rifle LAC (5.56mm)",
 ["Assault Rifle C7FT PDW (5.56mm)"] = "Assault Rifle C7FT PDW (5.56mm)",
 ["Assault Rifle C7FT PDW (5.56mm) folded"] = "Assault Rifle C7FT PDW (5.56mm)",
 ["Assault Rifle C7FT PDW B (5.56mm)"] = "Assault Rifle C7FT PDW B (5.56mm)",
 ["Assault Rifle C7FT PDW B (5.56mm) folded"] = "Assault Rifle C7FT PDW B (5.56mm)",
 ["Assault Rifle C7FT (5.56mm)"] = "Assault Rifle C7FT (5.56mm)",
 ["Assault Rifle C7FT (5.56mm) folded"] = "Assault Rifle C7FT (5.56mm)",
 ["Assault Rifle C7FT B (5.56mm)"] = "Assault Rifle C7FT B (5.56mm)",
 ["Assault Rifle C7FT B (5.56mm) folded"] = "Assault Rifle C7FT B (5.56mm)",
 ["Assault Rifle C8 (5.56mm)"] = "Assault Rifle C8 (5.56mm)",
 ["Assault Rifle C8 (5.56mm) folded"] = "Assault Rifle C8 (5.56mm)",
 ["Assault Rifle C7FT CAR (5.56mm)"] = "Assault Rifle C7FT CAR (5.56mm)",
 ["Assault Rifle C7FT CAR (5.56mm) folded"] = "Assault Rifle C7FT CAR (5.56mm)",
 ["Assault Rifle C7FT CAR B (5.56mm)"] = "Assault Rifle C7FT CAR B (5.56mm)",
 ["Assault Rifle C7FT CAR B (5.56mm) folded"] = "Assault Rifle C7FT CAR B (5.56mm)",
 ["REC7 PDW NATO"] = "REC7 PDW NATO",
 ["REC7 PDW NATO folded"] = "REC7 PDW NATO",
 ["REC7 PDW NATO FG"] = "REC7 PDW NATO FG",
 ["REC7 PDW NATO FG folded"] = "REC7 PDW NATO FG",
 ["REC7 NATO"] = "REC7 NATO",
 ["REC7 NATO folded"] = "REC7 NATO",
 ["REC7 NATO FG"] = "REC7 NATO FG",
 ["REC7 NATO FG folded"] = "REC7 NATO FG",
 ["REC7 PDW SPC"] = "REC7 PDW SPC",
 ["REC7 PDW SPC folded"] = "REC7 PDW SPC",
 ["REC7 PDW SPC FG"] = "REC7 PDW SPC FG",
 ["REC7 PDW SPC FG folded"] = "REC7 PDW SPC FG",
 ["REC7 SPC"] = "REC7 SPC",
 ["REC7 SPC folded"] = "REC7 SPC",
 ["REC7 SPC FG"] = "REC7 SPC FG",
 ["REC7 SPC FG folded"] = "REC7 SPC FG",
 ["LWRC PSD 556"] = "LWRC PSD 556",
 ["LWRC PSD 556 folded"] = "LWRC PSD 556",
 ["LWRC PSD 556 FG"] = "LWRC PSD 556 FG",
 ["LWRC PSD 556 FG folded"] = "LWRC PSD 556 FG",
 ["LWRC PSD 556 BLK"] = "LWRC PSD 556 BLK",
 ["LWRC PSD 556 BLK folded"] = "LWRC PSD 556 BLK",
 ["LWRC PSD 556 BLK FG"] = "LWRC PSD 556 BLK FG",
 ["LWRC PSD 556 BLK FG folded"] = "LWRC PSD 556 BLK FG",
 ["LWRC PSD"] = "LWRC PSD",
 ["LWRC PSD folded"] = "LWRC PSD",
 ["LWRC PSD FG"] = "LWRC PSD FG",
 ["LWRC PSD FG folded"] = "LWRC PSD FG",
 ["LWRC PSD BLK"] = "LWRC PSD BLK",
 ["LWRC PSD BLK folded"] = "LWRC PSD BLK",
 ["LWRC PSD BLK FG"] = "LWRC PSD BLK FG",
 ["LWRC PSD BLK FG folded"] = "LWRC PSD BLK FG",
 ["Assault Rifle T65K2 Carbine (5.56mm)"] = "Assault Rifle T65K2 Carbine (5.56mm)",
 ["Assault Rifle T65K2 Carbine (5.56mm) folded"] = "Assault Rifle T65K2 Carbine (5.56mm)",
 ["Assault Rifle T65K2 Carbine BK (5.56mm)"] = "Assault Rifle T65K2 Carbine BK (5.56mm)",
 ["Assault Rifle T65K2 Carbine BK (5.56mm) folded"] = "Assault Rifle T65K2 Carbine BK (5.56mm)",
 ["Assault Rifle T86 (5.56mm)"] = "Assault Rifle T86 (5.56mm)",
 ["Assault Rifle T86 (5.56mm) folded"] = "Assault Rifle T86 (5.56mm)",
 ["Assault Rifle T91 (5.56mm)"] = "Assault Rifle T91 (5.56mm)",
 ["Assault Rifle T91 (5.56mm) folded"] = "Assault Rifle T91 (5.56mm)",
 ["Assault Rifle M4A1 Real (5.56mm)"] = "Assault Rifle M4A1 Real (5.56mm)",
 ["Assault Rifle M4A1 Real (5.56mm) folded"] = "Assault Rifle M4A1 Real (5.56mm)",
 ["Assault Rifle M4A1 Old (5.56mm)"] = "Assault Rifle M4A1 Old (5.56mm)",
 ["Assault Rifle M4A1 Old (5.56mm) folded"] = "Assault Rifle M4A1 Old (5.56mm)",
 ["Assault Rifle LVOAS (5.56x45mm)"] = "Assault Rifle LVOAS (5.56x45mm)",
 ["Assault Rifle LVOAS (5.56x45mm) folded"] = "Assault Rifle LVOAS (5.56x45mm)",
 ["Assault Rifle LVOAS FG (5.56x45mm)"] = "Assault Rifle LVOAS FG (5.56x45mm)",
 ["Assault Rifle LVOAS FG (5.56x45mm) folded"] = "Assault Rifle LVOAS FG (5.56x45mm)",
 ["HK416CQB"] = "HK416CQB",
 ["HK416CQB folded"] = "HK416CQB",
 ["HK416CQB FG"] = "HK416CQB FG",
 ["HK416CQB FG folded"] = "HK416CQB FG",
 ["HK416 14DRS"] = "HK416 14DRS",
 ["HK416 14DRS folded"] = "HK416 14DRS",
 ["HK416 14DRS FG"] = "HK416 14DRS FG",
 ["HK416 14DRS FG folded"] = "HK416 14DRS FG",
 ["HK416"] = "HK416",
 ["HK416 folded"] = "HK416",
 ["HK416 FG"] = "HK416 FG",
 ["HK416 FG folded"] = "HK416 FG",
 ["HK416 D20RS"] = "HK416 D20RS",
 ["HK416 D20RS folded"] = "HK416 D20RS",
 ["HK417 12Inch CQB"] = "HK417 12Inch CQB",
 ["HK417 12Inch CQB folded"] = "HK417 12Inch CQB",
 ["HK417 12Inch CQB FG"] = "HK417 12Inch CQB FG",
 ["HK417 12Inch CQB FG folded"] = "HK417 12Inch CQB FG",
 ["HK417 16Inch"] = "HK417 16Inch",
 ["HK417 16Inch folded"] = "HK417 16Inch",
 ["HK417 16Inch FG"] = "HK417 16Inch FG",
 ["HK417 16Inch FG folded"] = "HK417 16Inch FG",
 ["HK417 20Inch"] = "HK417 20Inch",
 ["HK417 20Inch folded"] = "HK417 20Inch",
 ["HK417 20Inch FG"] = "HK417 20Inch FG",
 ["HK417 20Inch FG folded"] = "HK417 20Inch FG",
 ["Assault Rifle MK18 CQC (5.56mm)"] = "Assault Rifle MK18 CQC (5.56mm)",
 ["Assault Rifle MK18 CQC (5.56mm) folded"] = "Assault Rifle MK18 CQC (5.56mm)",
 ["Assault Rifle MK18 CQC FG (5.56mm)"] = "Assault Rifle MK18 CQC FG (5.56mm)",
 ["Assault Rifle MK18 CQC FG (5.56mm) folded"] = "Assault Rifle MK18 CQC FG (5.56mm)",
 ["Assault Rifle MK18 CAR (5.56mm)"] = "Assault Rifle MK18 CAR (5.56mm)",
 ["Assault Rifle MK18 CAR (5.56mm) folded"] = "Assault Rifle MK18 CAR (5.56mm)",
 ["Assault Rifle MK18 CAR FG (5.56mm)"] = "Assault Rifle MK18 CAR FG (5.56mm)",
 ["Assault Rifle MK18 CAR FG (5.56mm) folded"] = "Assault Rifle MK18 CAR FG (5.56mm)",
 ["Assault Rifle MK18 (5.56mm)"] = "Assault Rifle MK18 (5.56mm)",
 ["Assault Rifle MK18 (5.56mm) folded"] = "Assault Rifle MK18 (5.56mm)",
 ["Assault Rifle MK18 FG (5.56mm)"] = "Assault Rifle MK18 FG (5.56mm)",
 ["Assault Rifle MK18 FG (5.56mm) folded"] = "Assault Rifle MK18 FG (5.56mm)",
 ["MOE Warrior CQB"] = "MOE Warrior CQB",
 ["MOE Warrior CQB folded"] = "MOE Warrior CQB",
 ["MOE Warrior CQB BK"] = "MOE Warrior CQB BK",
 ["MOE Warrior CQB BK folded"] = "MOE Warrior CQB BK",
 ["MOE Warrior"] = "MOE Warrior",
 ["MOE Warrior folded"] = "MOE Warrior",
 ["MOE Warrior BK"] = "MOE Warrior BK",
 ["MOE Warrior BK folded"] = "MOE Warrior BK",
 ["MOE Warrior LB"] = "MOE Warrior LB",
 ["MOE Warrior LB folded"] = "MOE Warrior LB",
 ["MOE Warrior LB BK"] = "MOE Warrior LB BK",
 ["MOE Warrior LB BK folded"] = "MOE Warrior LB BK",
 ["MOE Warrior G2"] = "MOE Warrior G2",
 ["MOE Warrior G2 folded"] = "MOE Warrior G2",
 ["MOE Warrior G2 BK"] = "MOE Warrior G2 BK",
 ["MOE Warrior G2 BK folded"] = "MOE Warrior G2 BK",
 ["MOE Warrior G2 LB"] = "MOE Warrior G2 LB",
 ["MOE Warrior G2 LB folded"] = "MOE Warrior G2 LB",
 ["MOE Warrior G2 LB BK"] = "MOE Warrior G2 LB BK",
 ["MOE Warrior G2 LB BK folded"] = "MOE Warrior G2 LB BK",
 ["Assault Rifle AR15 5.56x45 no FG"] = "Assault Rifle AR15 5.56x45 no FG",
 ["Assault Rifle AR15 5.56x45 no FG folded"] = "Assault Rifle AR15 5.56x45 no FG",
 ["Assault Rifle AR15 5.56x45"] = "Assault Rifle AR15 5.56x45",
 ["Assault Rifle AR15 5.56x45 folded"] = "Assault Rifle AR15 5.56x45",
 ["Assault Rifle DPMS 308 no FG"] = "Assault Rifle DPMS 308 no FG",
 ["Assault Rifle DPMS 308 no FG folded"] = "Assault Rifle DPMS 308 no FG",
 ["Assault Rifle DPMS 308"] = "Assault Rifle DPMS 308",
 ["Assault Rifle DPMS 308 folded"] = "Assault Rifle DPMS 308",
 ["SW MP15 CQC"] = "SW MP15 CQC",
 ["SW MP15 CQC folded"] = "SW MP15 CQC",
 ["SW MP15 CQC FG"] = "SW MP15 CQC FG",
 ["SW MP15 CQC FG folded"] = "SW MP15 CQC FG",
 ["SW MP15"] = "SW MP15",
 ["SW MP15 folded"] = "SW MP15",
 ["SW MP15 FG"] = "SW MP15 FG",
 ["SW MP15 FG folded"] = "SW MP15 FG",
 ["SW MP15 LB"] = "SW MP15 LB",
 ["SW MP15 LB folded"] = "SW MP15 LB",
 ["SW MP15 LB FG"] = "SW MP15 LB FG",
 ["SW MP15 LB FG folded"] = "SW MP15 LB FG",
 ["Wilson NATO"] = "Wilson NATO",
 ["Wilson NATO folded"] = "Wilson NATO",
 ["Wilson NATO FG"] = "Wilson NATO FG",
 ["Wilson NATO FG folded"] = "Wilson NATO FG",
 ["Wilson SPC"] = "Wilson SPC",
 ["Wilson SPC folded"] = "Wilson SPC",
 ["Wilson SPC FG"] = "Wilson SPC FG",
 ["Wilson SPC FG folded"] = "Wilson SPC FG",
 ["Wilson458"] = "Wilson458",
 ["Wilson458 folded"] = "Wilson458",
 ["Wilson458 FG"] = "Wilson458 FG",
 ["Wilson458 FG folded"] = "Wilson458 FG",
 ["Assault Rifle Predatar"] = "Assault Rifle Predatar",
 ["Assault Rifle Predatar folded"] = "Assault Rifle Predatar",
 ["Small Assault Rifle M933 Grendel (6.5)"] = "Small Assault Rifle M933 Grendel (6.5)",
 ["Small Assault Rifle M933 Grendel (6.5) folded"] = "Small Assault Rifle M933 Grendel (6.5)",
 ["Small Assault Rifle M933 Grendel FG (6.5)"] = "Small Assault Rifle M933 Grendel FG (6.5)",
 ["Small Assault Rifle M933 Grendel FG (6.5) folded"] = "Small Assault Rifle M933 Grendel FG (6.5)",
 ["Assault Rifle M4 Grendel (6.5)"] = "Assault Rifle M4 Grendel (6.5)",
 ["Assault Rifle M4 Grendel (6.5) folded"] = "Assault Rifle M4 Grendel (6.5)",
 ["Assault Rifle M4 Grendel FG (6.5)"] = "Assault Rifle M4 Grendel FG (6.5)",
 ["Assault Rifle M4 Grendel FG (6.5) folded"] = "Assault Rifle M4 Grendel FG (6.5)",
 ["Assault Rifle LAC Grendel (6.5)"] = "Assault Rifle LAC Grendel (6.5)",
 ["Assault Rifle LAC Grendel (6.5) folded"] = "Assault Rifle LAC Grendel (6.5)",
 ["Assault Rifle LAC Grendel FG (6.5)"] = "Assault Rifle LAC Grendel FG (6.5)",
 ["Assault Rifle LAC Grendel FG (6.5) folded"] = "Assault Rifle LAC Grendel FG (6.5)",
 ["Assault Rifle M4A1 CQB (.300 BLK)"] = "Assault Rifle M4A1 CQB (.300 BLK)",
 ["Assault Rifle M4A1 CQB (.300 BLK) folded"] = "Assault Rifle M4A1 CQB (.300 BLK)",
 ["Assault Rifle M4A1 CQB AG (.300 BLK)"] = "Assault Rifle M4A1 CQB AG (.300 BLK)",
 ["Assault Rifle M4A1 CQB AG (.300 BLK) folded"] = "Assault Rifle M4A1 CQB AG (.300 BLK)",
 ["Assault Rifle M4A1 (.300 BLK)"] = "Assault Rifle M4A1 (.300 BLK)",
 ["Assault Rifle M4A1 (.300 BLK) folded"] = "Assault Rifle M4A1 (.300 BLK)",
 ["SW MP15 300BLK CQC"] = "SW MP15 300BLK CQC",
 ["SW MP15 300BLK CQC folded"] = "SW MP15 300BLK CQC",
 ["SW MP15 300BLK CQC FG"] = "SW MP15 300BLK CQC FG",
 ["SW MP15 300BLK CQC FG folded"] = "SW MP15 300BLK CQC FG",
 ["SW MP15 300BLK"] = "SW MP15 300BLK",
 ["SW MP15 300BLK folded"] = "SW MP15 300BLK",
 ["SW MP15 300BLK FG"] = "SW MP15 300BLK FG",
 ["SW MP15 300BLK FG folded"] = "SW MP15 300BLK FG",
 ["MOE Warrior 300BLK"] = "MOE Warrior 300BLK",
 ["MOE Warrior 300BLK folded"] = "MOE Warrior 300BLK",
 ["MOE Warrior 300BLK BK"] = "MOE Warrior 300BLK BK",
 ["MOE Warrior 300BLK BK folded"] = "MOE Warrior 300BLK BK",
 ["Small Assault Rifle M933 (300BLK)"] = "Small Assault Rifle M933 (300BLK)",
 ["Small Assault Rifle M933 (300BLK) folded"] = "Small Assault Rifle M933 (300BLK)",
 ["Small Assault Rifle M933 FG (300BLK)"] = "Small Assault Rifle M933 FG (300BLK)",
 ["Small Assault Rifle M933 FG (300BLK) folded"] = "Small Assault Rifle M933 FG (300BLK)",
 ["Assault Rifle M4 SOPMOD (300BLK)"] = "Assault Rifle M4 SOPMOD (300BLK)",
 ["Assault Rifle M4 SOPMOD (300BLK) folded"] = "Assault Rifle M4 SOPMOD (300BLK)",
 ["Assault Rifle M4 SOPMOD FG (300BLK)"] = "Assault Rifle M4 SOPMOD FG (300BLK)",
 ["Assault Rifle M4 SOPMOD FG (300BLK) folded"] = "Assault Rifle M4 SOPMOD FG (300BLK)",
 ["Assault Rifle SIG 556 CQC (5.56mm)"] = "Assault Rifle SIG 556 CQC (5.56mm)",
 ["Assault Rifle SIG 556 CQC (5.56mm) folded"] = "Assault Rifle SIG 556 CQC (5.56mm)",
 ["Assault Rifle SIG 556 CQC FG (5.56mm)"] = "Assault Rifle SIG 556 CQC FG (5.56mm)",
 ["Assault Rifle SIG 556 CQC FG (5.56mm) folded"] = "Assault Rifle SIG 556 CQC FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR (5.56mm)"] = "Assault Rifle SIG 556 CAR (5.56mm)",
 ["Assault Rifle SIG 556 CAR (5.56mm) folded"] = "Assault Rifle SIG 556 CAR (5.56mm)",
 ["Assault Rifle SIG 556 CAR FG (5.56mm)"] = "Assault Rifle SIG 556 CAR FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR FG (5.56mm) folded"] = "Assault Rifle SIG 556 CAR FG (5.56mm)",
 ["Assault Rifle SIG 556 (5.56mm)"] = "Assault Rifle SIG 556 (5.56mm)",
 ["Assault Rifle SIG 556 (5.56mm) folded"] = "Assault Rifle SIG 556 (5.56mm)",
 ["Assault Rifle SIG 556 FG (5.56mm)"] = "Assault Rifle SIG 556 FG (5.56mm)",
 ["Assault Rifle SIG 556 FG (5.56mm) folded"] = "Assault Rifle SIG 556 FG (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV (5.56mm)"] = "Assault Rifle SIG 556 CQC CIV (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CQC CIV (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CQC CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CQC CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV (5.56mm)"] = "Assault Rifle SIG 556 CAR CIV (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CAR CIV (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CAR CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CAR CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CIV (5.56mm)"] = "Assault Rifle SIG 556 CIV (5.56mm)",
 ["Assault Rifle SIG 556 CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CIV (5.56mm)",
 ["Assault Rifle SIG 556 CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CIV FG (5.56mm)",
 ["Small Assault Rifle M933 Beowulf (.50 BEO)"] = "Small Assault Rifle M933 Beowulf (.50 BEO)",
 ["Small Assault Rifle M933 Beowulf (.50 BEO) folded"] ="Small Assault Rifle M933 Beowulf (.50 BEO)",
 ["Small Assault Rifle M933 Beowulf FG (.50 BEO)"] = "Small Assault Rifle M933 Beowulf FG (.50 BEO)",
 ["Small Assault Rifle M933 Beowulf FG (.50 BEO) folded"] = "Small Assault Rifle M933 Beowulf FG (.50 BEO)",
 ["Assault Rifle M4 Beowulf (.50 BEO)"] = "Assault Rifle M4 Beowulf (.50 BEO)",
 ["Assault Rifle M4 Beowulf (.50 BEO) folded"] = "Assault Rifle M4 Beowulf (.50 BEO)",
 ["Assault Rifle M4 Beowulf FG (.50 BEO)"] = "Assault Rifle M4 Beowulf FG (.50 BEO)",
 ["Assault Rifle M4 Beowulf FG (.50 BEO) folded"] = "Assault Rifle M4 Beowulf FG (.50 BEO)",
 ["Assault Rifle LAC Beowulf (.50 BEO)"] = "Assault Rifle LAC Beowulf (.50 BEO)",
 ["Assault Rifle LAC Beowulf (.50 BEO) folded"] = "Assault Rifle LAC Beowulf (.50 BEO)",
 ["Assault Rifle LAC Beowulf FG (.50 BEO)"] = "Assault Rifle LAC Beowulf FG (.50 BEO)",
 ["Assault Rifle LAC Beowulf FG (.50 BEO) folded"] = "Assault Rifle LAC Beowulf FG (.50 BEO)",
 ["Assault Rifle SC2010 (7.62mm)"] = "Assault Rifle SC2010 (7.62mm)",
 ["Assault Rifle SC2010 (7.62mm) folded"] = "Assault Rifle SC2010 (7.62mm)",
 ["Assault Rifle SC2026 (7.62x39mm)"] = "Assault Rifle SC2026 (7.62x39mm)",
 ["Assault Rifle SC2026 (7.62x39mm) folded"] = "Assault Rifle SC2026 (7.62x39mm)",
 ["Assault Rifle SC2027 (7.62x51mm)"] = "Assault Rifle SC2027 (7.62x51mm)",
 ["Assault Rifle SC2027 (7.62x51mm) folded"] = "Assault Rifle SC2027 (7.62x51mm)",
 ["Pindad SS2 CQC RIS"] = "Pindad SS2 CQC RIS",
 ["Pindad SS2 CQC RIS folded"] = "Pindad SS2 CQC RIS",
 ["Pindad SS2 CQC RIS FG"] = "Pindad SS2 CQC RIS FG",
 ["Pindad SS2 CQC RIS FG folded"] = "Pindad SS2 CQC RIS FG",
 ["ACE CQC"] = "ACE CQC",
 ["ACE CQC folded"] = "ACE CQC",
 ["ACE CAR"] = "ACE CAR",
 ["ACE CAR folded"] = "ACE CAR",
 ["ACE"] = "ACE",
 ["ACE folded"] = "ACE",
 ["ACE CQC RUS"] = "ACE CQC RUS",
 ["ACE CQC RUS folded"] = "ACE CQC RUS",
 ["ACE RUS"] = "ACE RUS",
 ["ACE RUS folded"] = "ACE RUS",
 ["ACE CQC NATO"] = "ACE CQC NATO",
 ["ACE CQC NATO folded"] = "ACE CQC NATO",
 ["ACE CAR NATO"] = "ACE CAR NATO",
 ["ACE CAR NATO folded"] = "ACE CAR NATO",
 ["ACE NATO"] = "ACE NATO",
 ["ACE NATO folded"] = "ACE NATO",
 ["M27 IAR"] = "M27 IAR",
 ["M27 IAR folded"] = "M27 IAR",
 ["Assault Rifle T14 M4A1 (410)"] = "Assault Rifle T14 M4A1 (410)",
 ["Assault Rifle T14 M4A1 (410) folded"] = "Assault Rifle T14 M4A1 (410)",
 ["Assault Rifle T14 M4A1 FG (410)"] = "Assault Rifle T14 M4A1 FG (410)",
 ["Assault Rifle T14 M4A1 FG (410) folded"] = "Assault Rifle T14 M4A1 FG (410)",
 
--with RIS
 ["Submachine-gun HK MP5A5 RIS (9mm)"] = "Submachine-gun HK MP5A5 RIS (9mm)",
 ["Submachine-gun HK MP5A5 RIS (9mm) folded"] = "Submachine-gun HK MP5A5 RIS (9mm) folded",
 ["Submachine-gun NR-08 RIS (9mm)"] = "Submachine-gun NR-08 RIS (9mm)",
 ["Submachine-gun NR-08 RIS (9mm) folded"] = "Submachine-gun NR-08 RIS (9mm)",
 ["Submachine-gun HK MP5A5 RIS (.40 S&W)"] = "Submachine-gun HK MP5A5 RIS (.40 S&W)",
 ["Submachine-gun HK MP5A5 RIS (.40 S&W) folded"] = "Submachine-gun HK MP5A5 RIS (.40 S&W) folded",
 ["Submachine-gun HK MP5A5 RIS (10)"] = "Submachine-gun HK MP5A5 RIS (10)",
 ["Submachine-gun HK MP5A5 RIS (10) folded"] = "Submachine-gun HK MP5A5 RIS (10)",
 ["HK MP5A5 RIS (22)"] = "HK MP5A5 RIS (22)",
 ["HK MP5A5 RIS (22) folded"] = "HK MP5A5 RIS (22)",
 ["Assault Rifle HK53A3 RIS (5.56mm)"] = "Assault Rifle HK53A3 RIS (5.56mm)",
 ["Assault Rifle HK53A3 RIS (5.56mm) folded"] = "Assault Rifle HK53A3 RIS (5.56mm) folded",

--stocks
 ["MP5 butt A3"] = "MP5 Butt",
 ["MP5 Butt"] = "MP5 butt A3",
 ["MP5 Butt folded"] = "MP5 butt A3",
 ["MP5 butt A2"] = "MP5 Butt solid",
 ["MP5 Butt solid"] = "MP5 butt A2",
 ["Car15 Stock"] = "m4_butt",
 ["m4_butt"] = "Car15 Stock",
 ["m4_butt_folded"] = "Car15 Stock",
 ["M4A1 Stock"] = "m4sopmod_butt",
 ["m4sopmod_butt"] = "M4A1 Stock",
 ["m4sopmod_butt_folded"] = "M4A1 Stock",
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
    ["Hecate Bipod"] = "Hecate Bipod Folded",
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
	["Madsen Bipod"] = "Madsen Bipod Folded",
	["MG4 Bipod"] = "MG4 Bipod Folded",
	["SSG08 Bipod"] = "SSG08 Bipod Folded",
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
		["Machinegun RK71MG HG (5.56)"] = "RK71HG",
		["Machinegun RK71MG HG (308)"] = "RK71HG",
		["Machinegun RK71MG HG (7.62)"] = "RK71HG",
		["Assault Rifle RK71W2 (5.56)"] = "RK71HG",
		["Assault Rifle RK71W2 CIV (5.56)"] = "RK71HG",
		["Assault Rifle RK71W2 (7.62)"] = "RK71HG",
		["Assault Rifle RK71W2 CIV (7.62)"] = "RK71HG",

		-- RIS kits
		["Revolver Unica 6 RIS (.357)"] = "Stock kit (Mateba Model 6)",
		["Revolver Unica 6 RIS (.44)"] = "Stock kit (Mateba Model 6)",
		["PP90M1 RIS (9x19)"] = "Stock kit (PP-90M1)",
		["PP90M1 RIS (9x19) folded"] = "Stock kit (PP-90M1)",
		["IMBEL ParaFal (7.62x51mm)"] = "Stock kit (IMBEL M964A1)",
		["IMBEL ParaFal (7.62x51mm) folded"] = "Stock kit (IMBEL M964A1)",
		["Carabine IMBEL ParaFal (7.62x51mm)"] = "Stock kit (IMBEL M964A1)",
		["Carabine IMBEL ParaFal (7.62x51mm) folded"] = "Stock kit (IMBEL M964A1)",
		["Carabine M1A RIS (7.62x51mm)"] = "Stock kit (M1A)",
		["Carabine M1A WOOD RIS (7.62x51mm)"] = "Stock kit (M1A)",
		["Carabine M1A Scout RIS (7.62x51mm)"] = "Stock kit (M1A)",
		["Carabine M1A Scout POLY RIS (7.62x51mm)"] = "Stock kit (M1A)",
		["Carabine SOCOM16 (7.62x51mm)"] = "Stock kit (M1A)",
		["Carabine SOCOM16 WOOD RIS (7.62x51mm)"] = "Stock kit (M1A)",
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
		["Machinegun RK71MG (5.56)"] = "RK71W2HG",
		["Machinegun RK71MG (308)"] = "RK71W2HG",
		["Machinegun RK71MG (7.62)"] = "RK71W2HG",
		["Assault Rifle RK71W (5.56)"] = "RK71W2HG",
		["Assault Rifle RK71W CIV (5.56)"] = "RK71W2HG",
		["Assault Rifle RK71W (7.62)"] = "RK71W2HG",
		["Assault Rifle RK71W CIV (7.62)"] = "RK71W2HG",

		-- RIS kits
		["Revolver Unica 6 (.357)"] = "RIS kit (Mateba Model 6)",
		["Revolver Unica 6 (.44)"] = "RIS kit (Mateba Model 6)",
		["PP90M1 (9x19)"] = "RIS kit (PP-90M1)",
		["PP90M1 (9x19) folded"] = "RIS kit (PP-90M1)",
		["IMBEL M964A1 MD1"] = "RIS kit (IMBEL M964A1)",
		["IMBEL M964A1 MD1 folded"] = "RIS kit (IMBEL M964A1)",
		["Carabine IMBEL M964A1 MD3"] = "RIS kit (IMBEL M964A1)",
		["Carabine IMBEL M964A1 MD3 folded"] = "RIS kit (IMBEL M964A1)",
		["Carabine M1A (7.62x51mm)"] = "RIS kit (M1A)",
		["Carabine M1A WOOD (7.62x51mm)"] = "RIS kit (M1A)",
		["Carabine M1A Scout (7.62x51mm)"] = "RIS kit (M1A)",
		["Carabine M1A Scout POLY (7.62x51mm)"] = "RIS kit (M1A)",
		["Carabine SOCOM16 NO RIS (7.62x51mm)"] = "RIS kit (M1A)",
		["Carabine SOCOM16 WOOD NO RIS (7.62x51mm)"] = "RIS kit (M1A)",
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
AddItemContextMenu("RK71HG", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("RK71W2HG", action_replace_for_end, ChangeForestock, CanAddRISForestock)
--AddItemContextMenu("Galil forestock", action_replace_for_end, ChangeForestock, CanAddForestock)
AddItemContextMenu("M203B (40mm LV)", _t"lang/lua/tuning/mount", ChangeForestock, CanAddRISForestock)
AddItemContextMenu("MP5 butt A2", action_replace_butt, ChangeStock, CanChangeFoldStock)
AddItemContextMenu("MP5 butt A3", action_replace_butt, ChangeStock, CanChangeStock)
AddItemContextMenu("Car15 Stock", action_replace_butt, ChangeStock, CanChangeFoldStock)
AddItemContextMenu("M4A1 Stock", action_replace_butt, ChangeStock, CanChangeFoldStock)

local action_install_ris_kit = "Install a RIS on the weapon in hands"
local action_uninstall_ris_kit = "Take off the RIS on the weapon in hands"

AddItemContextMenu("Stock kit (Mateba Model 6)", action_uninstall_ris_kit, ChangeForestock, CanAddForestock)
AddItemContextMenu("RIS kit (Mateba Model 6)", action_install_ris_kit, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("Stock kit (PP-90M1)", action_uninstall_ris_kit, ChangeForestock, CanAddForestock)
AddItemContextMenu("RIS kit (PP-90M1)", action_install_ris_kit, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("Stock kit (IMBEL M964A1)", action_uninstall_ris_kit, ChangeForestock, CanAddForestock)
AddItemContextMenu("RIS kit (IMBEL M964A1)", action_install_ris_kit, ChangeForestock, CanAddRISForestock)
AddItemContextMenu("Stock kit (M1A)", action_uninstall_ris_kit, ChangeForestock, CanAddForestock)
AddItemContextMenu("RIS kit (M1A)", action_install_ris_kit, ChangeForestock, CanAddRISForestock)

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
AddItemContextMenu("Madsen Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("MG4 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SSG08 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("T81 Bipod", action_fold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Hecate Bipod", action_fold, FoldBipod, CanFoldBipod)

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
AddItemContextMenu("Madsen Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("MG4 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("SSG08 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("T81 Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)
AddItemContextMenu("Hecate Bipod Folded", action_unfold, FoldBipod, CanFoldBipod)

AddContextMenu(_t"lang/lua/tuning/fold_bipods", FoldWeaponBipod, CanFoldWeaponBipod)
AddContextMenu(_t"lang/lua/tuning/unfold_bipods", UnfoldWeaponBipod, CanUnfoldWeaponBipod)

-- begin added by gpgpgpgp

-- Search keyword "gpgpgpgp" for all edited positions (this file and WEAPONINFO)

-- this version features very minor changes in WEAPONINFO ini (mostly to disable vanilla folding) and using LUA script (instead of vanilla 7.62HC action) to fold stocks for these specific weapons featuring changable, foldable stocks.
-- you still need to fill out vanilla HLA tables to enable weapons' changing stocks feature.

 local LUAFoldStockWeapons = {
 ["Assault Rifle M4A1 CIV (5.56mm)"] = "Assault Rifle M4A1 CIV (5.56mm) folded",
 ["Assault Rifle M654 (5.56mm)"] = "Assault Rifle M654 (5.56mm) folded",
 ["Assault Rifle XM177 (22)"] = "Assault Rifle XM177 (22) folded",
 ["Small Assault Rifle M933 (22)"] = "Small Assault Rifle M933 (22) folded",
 ["Assault Rifle M4 SOPMOD (22)"] = "Assault Rifle M4 SOPMOD (22) folded",
 ["Assault Rifle M4 SOPMOD FG (22)"] = "Assault Rifle M4 SOPMOD FG (22) folded",
 ["SW MP15 LB 22"] = "SW MP15 LB 22 folded",
 ["HK416 22"] = "HK416 22 folded",
 ["Submachine-gun Colt SMG (9mm)"] = "Submachine-gun Colt SMG (9mm) folded",
 ["Submachine-gun Colt 635 WR (9mm)"] = "Submachine-gun Colt 635 WR (9mm) folded",
 ["Submachine-gun Colt 635 WR LB (9mm)"] = "Submachine-gun Colt 635 WR LB (9mm) folded",
 ["Submachine-gun K9 (9mm)"] = "Submachine-gun K9 (9mm) folded",
 ["Submachine-gun K40 (.40)"] = "Submachine-gun K40 (.40) folded",
 ["Submachine-gun K45 (.45ACP)"] = "Submachine-gun K45 (.45ACP) folded",
 ["Submachine-gun K40 (.40)"] = "Submachine-gun K40 (.40) folded",
 ["Submachine-gun K10 (.10)"] = "Submachine-gun K10 (.10) folded",
 ["Assault Rifle AR-15A2 (5.56mm)"] = "Assault Rifle AR-15A2 (5.56mm) folded",
 ["Assault Rifle Government Carbine (5.56mm)"] = "Assault Rifle Government Carbine (5.56mm) folded",
 ["Assault Rifle XM-15-E2S (5.56mm)"] = "Assault Rifle XM-15-E2S (5.56mm) folded",
 ["Assault Rifle XM-15-E2S FG (5.56mm)"] = "Assault Rifle XM-15-E2S FG (5.56mm) folded",
 ["Assault Rifle AR-15 CQB (.300 BLK)"] = "Assault Rifle AR-15 CQB (.300 BLK) folded",
 ["Assault Rifle AR-15 CQB AG (.300 BLK)"] = "Assault Rifle AR-15 CQB AG (.300 BLK) folded",
 ["Assault Rifle AR-15 (.300 BLK)"] = "Assault Rifle AR-15 (.300 BLK) folded",
 ["Small Assault Rifle CAR-15 M619 (5.56mm)"] = "Small Assault Rifle CAR-15 M619 (5.56mm) folded",
 ["Small Assault Rifle CAR-15 New (5.56mm)"] = "Small Assault Rifle CAR-15 New (5.56mm) folded",
 ["Small Assault Rifle CAR-15 M639 (5.56mm)"] = "Small Assault Rifle CAR-15 M639 (5.56mm) folded",
 ["Small Assault Rifle CAR-15 M640 (5.56mm)"] = "Small Assault Rifle CAR-15 M640 (5.56mm) folded",
 ["Assault Rifle M653 (5.56mm)"] = "Assault Rifle M653 (5.56mm) folded",
 ["Assault Rifle Colt 723 (5.56mm)"] = "Assault Rifle Colt 723 (5.56mm) folded",
 ["Assault Rifle CAR-15 (5.56mm)"] = "Assault Rifle CAR-15 (5.56mm) folded",
 ["Assault Rifle Colt 727 (5.56mm)"] = "Assault Rifle Colt 727 (5.56mm) folded",
 ["Assault Rifle Colt Commando 733"] = "Assault Rifle Colt Commando 733 folded",
 ["Assault Rifle Colt Commando 933"] = "Assault Rifle Colt Commando 933 folded",
 ["Assault Rifle Colt Commando 933 FG"] = "Assault Rifle Colt Commando 933 FG folded",
 ["Assault Rifle M4A1 (5.56mm)"] = "Assault Rifle M4A1 (5.56mm) folded",
 ["Assault Rifle M4A1+M203"] = "Assault Rifle M4A1+M203 folded",
 ["Assault Rifle M4A1 RIS (5.56mm)"] = "Assault Rifle M4A1 RIS (5.56mm) folded",
 ["Assault Rifle M4A1 RIS FG (5.56mm)"] = "Assault Rifle M4A1 RIS FG (5.56mm) folded",
 ["Assault Rifle CQA (5.56mm)"] = "Assault Rifle CQA (5.56mm) folded",
 ["Small Assault Rifle M4 CQB-R (5.56mm)"] = "Small Assault Rifle M4 CQB-R (5.56mm) folded",
 ["Small Assault Rifle M4 CQB-R FG (5.56mm)"] = "Small Assault Rifle M4 CQB-R FG (5.56mm) folded",
 ["Assault Rifle LAC (5.56mm)"] = "Assault Rifle LAC (5.56mm) folded",
 ["Assault Rifle C7FT PDW (5.56mm)"] = "Assault Rifle C7FT PDW (5.56mm) folded",
 ["Assault Rifle C7FT PDW B (5.56mm)"] = "Assault Rifle C7FT PDW B (5.56mm) folded",
 ["Assault Rifle C7FT (5.56mm)"] = "Assault Rifle C7FT (5.56mm) folded",
 ["Assault Rifle C7FT B (5.56mm)"] = "Assault Rifle C7FT B (5.56mm) folded",
 ["Assault Rifle C8 (5.56mm)"] = "Assault Rifle C8 (5.56mm) folded",
 ["Assault Rifle C7FT CAR (5.56mm)"] = "Assault Rifle C7FT CAR (5.56mm) folded",
 ["Assault Rifle C7FT CAR B (5.56mm)"] = "Assault Rifle C7FT CAR B (5.56mm) folded",
 ["REC7 PDW NATO"] = "REC7 PDW NATO folded",
 ["REC7 PDW NATO FG"] = "REC7 PDW NATO FG folded",
 ["REC7 NATO"] = "REC7 NATO folded",
 ["REC7 NATO FG"] = "REC7 NATO FG folded",
 ["REC7 PDW SPC"] = "REC7 PDW SPC folded",
 ["REC7 PDW SPC FG"] = "REC7 PDW SPC FG folded",
 ["REC7 SPC"] = "REC7 SPC folded",
 ["REC7 SPC FG"] = "REC7 SPC FG folded",
 ["LWRC PSD 556"] = "LWRC PSD 556 folded",
 ["LWRC PSD 556 FG"] = "LWRC PSD 556 FG folded",
 ["LWRC PSD 556 BLK"] = "LWRC PSD 556 BLK folded",
 ["LWRC PSD 556 BLK FG"] = "LWRC PSD 556 BLK FG folded",
 ["LWRC PSD"] = "LWRC PSD folded",
 ["LWRC PSD FG"] = "LWRC PSD FG folded",
 ["LWRC PSD BLK"] = "LWRC PSD BLK folded",
 ["LWRC PSD BLK FG"] = "LWRC PSD BLK FG folded",
 ["Assault Rifle T65K2 Carbine (5.56mm)"] = "Assault Rifle T65K2 Carbine (5.56mm) folded",
 ["Assault Rifle T65K2 Carbine BK (5.56mm)"] = "Assault Rifle T65K2 Carbine BK (5.56mm) folded",
 ["Assault Rifle T86 (5.56mm)"] = "Assault Rifle T86 (5.56mm) folded",
 ["Assault Rifle T91 (5.56mm)"] = "Assault Rifle T91 (5.56mm) folded",
 ["Assault Rifle M4A1 Real (5.56mm)"] = "Assault Rifle M4A1 Real (5.56mm) folded",
 ["Assault Rifle M4A1 Old (5.56mm)"] = "Assault Rifle M4A1 Old (5.56mm) folded",
 ["Assault Rifle LVOAS (5.56x45mm)"] = "Assault Rifle LVOAS (5.56x45mm) folded",
 ["Assault Rifle LVOAS FG (5.56x45mm)"] = "Assault Rifle LVOAS FG (5.56x45mm) folded",
 ["HK416CQB"] = "HK416CQB folded",
 ["HK416CQB FG"] = "HK416CQB FG folded",
 ["HK416 14DRS"] = "HK416 14DRS folded",
 ["HK416 14DRS FG"] = "HK416 14DRS FG folded",
 ["HK416"] = "HK416 folded",
 ["HK416 FG"] = "HK416 FG folded",
 ["HK416 D20RS"] = "HK416 D20RS folded",
 ["HK417 12Inch CQB"] = "HK417 12Inch CQB folded",
 ["HK417 12Inch CQB FG"] = "HK417 12Inch CQB FG folded",
 ["HK417 16Inch"] = "HK417 16Inch folded",
 ["HK417 16Inch FG"] = "HK417 16Inch FG folded",
 ["HK417 20Inch"] = "HK417 20Inch folded",
 ["HK417 20Inch FG"] = "HK417 20Inch FG folded",
 ["Assault Rifle MK18 CQC (5.56mm)"] = "Assault Rifle MK18 CQC (5.56mm) folded",
 ["Assault Rifle MK18 CQC FG (5.56mm)"] = "Assault Rifle MK18 CQC FG (5.56mm) folded",
 ["Assault Rifle MK18 CAR (5.56mm)"] = "Assault Rifle MK18 CAR (5.56mm) folded",
 ["Assault Rifle MK18 CAR FG (5.56mm)"] = "Assault Rifle MK18 CAR FG (5.56mm) folded",
 ["Assault Rifle MK18 (5.56mm)"] = "Assault Rifle MK18 (5.56mm) folded",
 ["Assault Rifle MK18 FG (5.56mm)"] = "Assault Rifle MK18 FG (5.56mm) folded",
 ["MOE Warrior CQB"] = "MOE Warrior CQB folded",
 ["MOE Warrior CQB BK"] = "MOE Warrior CQB BK folded",
 ["MOE Warrior"] = "MOE Warrior folded",
 ["MOE Warrior BK"] = "MOE Warrior BK folded",
 ["MOE Warrior LB"] = "MOE Warrior LB folded",
 ["MOE Warrior LB BK"] = "MOE Warrior LB BK folded",
 ["MOE Warrior G2"] = "MOE Warrior G2 folded",
 ["MOE Warrior G2 BK"] = "MOE Warrior G2 BK folded",
 ["MOE Warrior G2 LB"] = "MOE Warrior G2 LB folded",
 ["MOE Warrior G2 LB BK"] = "MOE Warrior G2 LB BK folded",
 ["Assault Rifle AR15 5.56x45 no FG"] = "Assault Rifle AR15 5.56x45 no FG folded",
 ["Assault Rifle AR15 5.56x45"] = "Assault Rifle AR15 5.56x45 folded",
 ["Assault Rifle DPMS 308 no FG"] = "Assault Rifle DPMS 308 no FG folded",
 ["Assault Rifle DPMS 308"] = "Assault Rifle DPMS 308 folded",
 ["SW MP15 CQC"] = "SW MP15 CQC folded",
 ["SW MP15 CQC FG"] = "SW MP15 CQC FG folded",
 ["SW MP15"] = "SW MP15 folded",
 ["SW MP15 FG"] = "SW MP15 FG folded",
 ["SW MP15 LB"] = "SW MP15 LB folded",
 ["SW MP15 LB FG"] = "SW MP15 LB FG folded",
 ["Wilson NATO"] = "Wilson NATO folded",
 ["Wilson NATO FG"] = "Wilson NATO FG folded",
 ["Wilson SPC"] = "Wilson SPC folded",
 ["Wilson SPC FG"] = "Wilson SPC FG folded",
 ["Wilson458"] = "Wilson458 folded",
 ["Wilson458 FG"] = "Wilson458 FG folded",
 ["Assault Rifle Predatar"] = "Assault Rifle Predatar folded",
 ["Small Assault Rifle M933 Grendel (6.5)"] = "Small Assault Rifle M933 Grendel (6.5) folded",
 ["Small Assault Rifle M933 Grendel FG (6.5)"] = "Small Assault Rifle M933 Grendel FG (6.5) folded",
 ["Assault Rifle M4 Grendel (6.5)"] = "Assault Rifle M4 Grendel (6.5) folded",
 ["Assault Rifle M4 Grendel FG (6.5)"] = "Assault Rifle M4 Grendel FG (6.5) folded",
 ["Assault Rifle LAC Grendel (6.5)"] = "Assault Rifle LAC Grendel (6.5) folded",
 ["Assault Rifle LAC Grendel FG (6.5)"] = "Assault Rifle LAC Grendel FG (6.5) folded",
 ["Assault Rifle M4A1 CQB (.300 BLK)"] = "Assault Rifle M4A1 CQB (.300 BLK) folded",
 ["Assault Rifle M4A1 CQB AG (.300 BLK)"] = "Assault Rifle M4A1 CQB AG (.300 BLK) folded",
 ["Assault Rifle M4A1 (.300 BLK)"] = "Assault Rifle M4A1 (.300 BLK) folded",
 ["SW MP15 300BLK CQC"] = "SW MP15 300BLK CQC folded",
 ["SW MP15 300BLK CQC FG"] = "SW MP15 300BLK CQC FG folded",
 ["SW MP15 300BLK"] = "SW MP15 300BLK folded",
 ["SW MP15 300BLK FG"] = "SW MP15 300BLK FG folded",
 ["MOE Warrior 300BLK"] = "MOE Warrior 300BLK folded",
 ["MOE Warrior 300BLK BK"] = "MOE Warrior 300BLK BK folded",
 ["Small Assault Rifle M933 (300BLK)"] = "Small Assault Rifle M933 (300BLK) folded",
 ["Small Assault Rifle M933 FG (300BLK)"] = "Small Assault Rifle M933 FG (300BLK) folded",
 ["Assault Rifle M4 SOPMOD (300BLK)"] = "Assault Rifle M4 SOPMOD (300BLK) folded",
 ["Assault Rifle M4 SOPMOD FG (300BLK)"] = "Assault Rifle M4 SOPMOD FG (300BLK) folded",
 ["Assault Rifle SIG 556 CQC (5.56mm)"] = "Assault Rifle SIG 556 CQC (5.56mm) folded",
 ["Assault Rifle SIG 556 CQC FG (5.56mm)"] = "Assault Rifle SIG 556 CQC FG (5.56mm) folded",
 ["Assault Rifle SIG 556 CAR (5.56mm)"] = "Assault Rifle SIG 556 CAR (5.56mm) folded",
 ["Assault Rifle SIG 556 CAR FG (5.56mm)"] = "Assault Rifle SIG 556 CAR FG (5.56mm) folded",
 ["Assault Rifle SIG 556 (5.56mm)"] = "Assault Rifle SIG 556 (5.56mm) folded",
 ["Assault Rifle SIG 556 FG (5.56mm)"] = "Assault Rifle SIG 556 FG (5.56mm) folded",
 ["Assault Rifle SIG 556 CQC CIV (5.56mm)"] = "Assault Rifle SIG 556 CQC CIV (5.56mm) folded",
 ["Assault Rifle SIG 556 CQC CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CQC CIV FG (5.56mm) folded",
 ["Assault Rifle SIG 556 CAR CIV (5.56mm)"] = "Assault Rifle SIG 556 CAR CIV (5.56mm) folded",
 ["Assault Rifle SIG 556 CAR CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CAR CIV FG (5.56mm) folded",
 ["Assault Rifle SIG 556 CIV (5.56mm)"] = "Assault Rifle SIG 556 CIV (5.56mm) folded",
 ["Assault Rifle SIG 556 CIV FG (5.56mm)"] = "Assault Rifle SIG 556 CIV FG (5.56mm) folded",
 ["Small Assault Rifle M933 Beowulf (.50 BEO)"] = "Small Assault Rifle M933 Beowulf (.50 BEO) folded",
 ["Small Assault Rifle M933 Beowulf (.50 BEO) folded"] ="Small Assault Rifle M933 Beowulf (.50 BEO) folded",
 ["Small Assault Rifle M933 Beowulf FG (.50 BEO)"] = "Small Assault Rifle M933 Beowulf FG (.50 BEO) folded",
 ["Assault Rifle M4 Beowulf (.50 BEO)"] = "Assault Rifle M4 Beowulf (.50 BEO) folded",
 ["Assault Rifle M4 Beowulf FG (.50 BEO)"] = "Assault Rifle M4 Beowulf FG (.50 BEO) folded",
 ["Assault Rifle LAC Beowulf (.50 BEO)"] = "Assault Rifle LAC Beowulf (.50 BEO) folded",
 ["Assault Rifle LAC Beowulf FG (.50 BEO)"] = "Assault Rifle LAC Beowulf FG (.50 BEO) folded",
 ["Assault Rifle SC2010 (7.62mm)"] = "Assault Rifle SC2010 (7.62mm) folded",
 ["Assault Rifle SC2026 (7.62x39mm)"] = "Assault Rifle SC2026 (7.62x39mm) folded",
 ["Assault Rifle SC2027 (7.62x51mm)"] = "Assault Rifle SC2027 (7.62x51mm) folded",
 ["Pindad SS2 CQC RIS"] = "Pindad SS2 CQC RIS folded",
 ["Pindad SS2 CQC RIS FG"] = "Pindad SS2 CQC RIS FG folded",
 ["ACE CQC"] = "ACE CQC folded",
 ["ACE CAR"] = "ACE CAR folded",
 ["ACE"] = "ACE folded",
 ["ACE CQC RUS"] = "ACE CQC RUS folded",
 ["ACE RUS"] = "ACE RUS folded",
 ["ACE CQC NATO"] = "ACE CQC NATO folded",
 ["ACE CAR NATO"] = "ACE CAR NATO folded",
 ["ACE NATO"] = "ACE NATO folded",
 ["M27 IAR"] = "M27 IAR folded",
 ["Assault Rifle T14 M4A1 (410)"] = "Assault Rifle T14 M4A1 (410) folded",
 ["Assault Rifle T14 M4A1 FG (410)"] = "Assault Rifle T14 M4A1 FG (410) folded",

}
 local LUAUnfoldStockWeapons = {
 ["Assault Rifle M4A1 CIV (5.56mm) folded"] = "Assault Rifle M4A1 CIV (5.56mm)",
 ["Assault Rifle M654 (5.56mm) folded"] = "Assault Rifle M654 (5.56mm)",
 ["Assault Rifle XM177 (22) folded"] = "Assault Rifle XM177 (22)",
 ["Small Assault Rifle M933 (22) folded"] = "Small Assault Rifle M933 (22)",
 ["Assault Rifle M4 SOPMOD (22) folded"] = "Assault Rifle M4 SOPMOD (22)",
 ["Assault Rifle M4 SOPMOD FG (22) folded"] = "Assault Rifle M4 SOPMOD FG (22)",
 ["SW MP15 LB 22 folded"] = "SW MP15 LB 22",
 ["HK416 22 folded"] = "HK416 22",
 ["Submachine-gun Colt SMG (9mm) folded"] = "Submachine-gun Colt SMG (9mm)",
 ["Submachine-gun Colt 635 WR (9mm) folded"] = "Submachine-gun Colt 635 WR (9mm)",
 ["Submachine-gun Colt 635 WR LB (9mm) folded"] = "Submachine-gun Colt 635 WR LB (9mm)",
 ["Submachine-gun K9 (9mm) folded"] = "Submachine-gun K9 (9mm)",
 ["Submachine-gun K40 (.40) folded"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K45 (.45ACP) folded"] = "Submachine-gun K45 (.45ACP)",
 ["Submachine-gun K40 (.40) folded"] = "Submachine-gun K40 (.40)",
 ["Submachine-gun K10 (.10) folded"] = "Submachine-gun K10 (.10)",
 ["Assault Rifle AR-15A2 (5.56mm) folded"] = "Assault Rifle AR-15A2 (5.56mm)",
 ["Assault Rifle Government Carbine (5.56mm) folded"] = "Assault Rifle Government Carbine (5.56mm)",
 ["Assault Rifle XM-15-E2S (5.56mm) folded"] = "Assault Rifle XM-15-E2S (5.56mm)",
 ["Assault Rifle XM-15-E2S FG (5.56mm) folded"] = "Assault Rifle XM-15-E2S FG (5.56mm)",
 ["Assault Rifle AR-15 CQB (.300 BLK) folded"] = "Assault Rifle AR-15 CQB (.300 BLK)",
 ["Assault Rifle AR-15 CQB AG (.300 BLK) folded"] = "Assault Rifle AR-15 CQB AG (.300 BLK)",
 ["Assault Rifle AR-15 (.300 BLK) folded"] = "Assault Rifle AR-15 (.300 BLK)",
 ["Small Assault Rifle CAR-15 M619 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M619 (5.56mm)",
 ["Small Assault Rifle CAR-15 New (5.56mm) folded"] = "Small Assault Rifle CAR-15 New (5.56mm)",
 ["Small Assault Rifle CAR-15 M639 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M639 (5.56mm)",
 ["Small Assault Rifle CAR-15 M640 (5.56mm) folded"] = "Small Assault Rifle CAR-15 M640 (5.56mm)",
 ["Assault Rifle M653 (5.56mm) folded"] = "Assault Rifle M653 (5.56mm)",
 ["Assault Rifle Colt 723 (5.56mm) folded"] = "Assault Rifle Colt 723 (5.56mm)",
 ["Assault Rifle CAR-15 (5.56mm) folded"] = "Assault Rifle CAR-15 (5.56mm)",
 ["Assault Rifle Colt 727 (5.56mm) folded"] = "Assault Rifle Colt 727 (5.56mm)",
 ["Assault Rifle Colt Commando 733 folded"] = "Assault Rifle Colt Commando 733",
 ["Assault Rifle Colt Commando 933 folded"] = "Assault Rifle Colt Commando 933",
 ["Assault Rifle Colt Commando 933 FG folded"] = "Assault Rifle Colt Commando 933 FG",
 ["Assault Rifle M4A1 (5.56mm) folded"] = "Assault Rifle M4A1 (5.56mm)",
 ["Assault Rifle M4A1+M203 folded"] = "Assault Rifle M4A1+M203",
 ["Assault Rifle M4A1 RIS (5.56mm) folded"] = "Assault Rifle M4A1 RIS (5.56mm)",
 ["Assault Rifle M4A1 RIS FG (5.56mm) folded"] = "Assault Rifle M4A1 RIS FG (5.56mm)",
 ["Assault Rifle CQA (5.56mm) folded"] = "Assault Rifle CQA (5.56mm)",
 ["Small Assault Rifle M4 CQB-R (5.56mm) folded"] = "Small Assault Rifle M4 CQB-R (5.56mm)",
 ["Small Assault Rifle M4 CQB-R FG (5.56mm) folded"] = "Small Assault Rifle M4 CQB-R FG (5.56mm)",
 ["Assault Rifle LAC (5.56mm) folded"] = "Assault Rifle LAC (5.56mm)",
 ["Assault Rifle C7FT PDW (5.56mm) folded"] = "Assault Rifle C7FT PDW (5.56mm)",
 ["Assault Rifle C7FT PDW B (5.56mm) folded"] = "Assault Rifle C7FT PDW B (5.56mm)",
 ["Assault Rifle C7FT (5.56mm) folded"] = "Assault Rifle C7FT (5.56mm)",
 ["Assault Rifle C7FT B (5.56mm) folded"] = "Assault Rifle C7FT B (5.56mm)",
 ["Assault Rifle C8 (5.56mm) folded"] = "Assault Rifle C8 (5.56mm)",
 ["Assault Rifle C7FT CAR (5.56mm) folded"] = "Assault Rifle C7FT CAR (5.56mm)",
 ["Assault Rifle C7FT CAR B (5.56mm) folded"] = "Assault Rifle C7FT CAR B (5.56mm)",
 ["REC7 PDW NATO folded"] = "REC7 PDW NATO",
 ["REC7 PDW NATO FG folded"] = "REC7 PDW NATO FG",
 ["REC7 NATO folded"] = "REC7 NATO",
 ["REC7 NATO FG folded"] = "REC7 NATO FG",
 ["REC7 PDW SPC folded"] = "REC7 PDW SPC",
 ["REC7 PDW SPC FG folded"] = "REC7 PDW SPC FG",
 ["REC7 SPC folded"] = "REC7 SPC",
 ["REC7 SPC FG folded"] = "REC7 SPC FG",
 ["LWRC PSD 556 folded"] = "LWRC PSD 556",
 ["LWRC PSD 556 FG folded"] = "LWRC PSD 556 FG",
 ["LWRC PSD 556 BLK folded"] = "LWRC PSD 556 BLK",
 ["LWRC PSD 556 BLK FG folded"] = "LWRC PSD 556 BLK FG",
 ["LWRC PSD folded"] = "LWRC PSD",
 ["LWRC PSD FG folded"] = "LWRC PSD FG",
 ["LWRC PSD BLK folded"] = "LWRC PSD BLK",
 ["LWRC PSD BLK FG folded"] = "LWRC PSD BLK FG",
 ["Assault Rifle T65K2 Carbine (5.56mm) folded"] = "Assault Rifle T65K2 Carbine (5.56mm)",
 ["Assault Rifle T65K2 Carbine BK (5.56mm) folded"] = "Assault Rifle T65K2 Carbine BK (5.56mm)",
 ["Assault Rifle T86 (5.56mm) folded"] = "Assault Rifle T86 (5.56mm)",
 ["Assault Rifle T91 (5.56mm) folded"] = "Assault Rifle T91 (5.56mm)",
 ["Assault Rifle M4A1 Real (5.56mm) folded"] = "Assault Rifle M4A1 Real (5.56mm)",
 ["Assault Rifle M4A1 Old (5.56mm) folded"] = "Assault Rifle M4A1 Old (5.56mm)",
 ["Assault Rifle LVOAS (5.56x45mm) folded"] = "Assault Rifle LVOAS (5.56x45mm)",
 ["Assault Rifle LVOAS FG (5.56x45mm) folded"] = "Assault Rifle LVOAS FG (5.56x45mm)",
 ["HK416CQB folded"] = "HK416CQB",
 ["HK416CQB FG folded"] = "HK416CQB FG",
 ["HK416 14DRS folded"] = "HK416 14DRS",
 ["HK416 14DRS FG folded"] = "HK416 14DRS FG",
 ["HK416 folded"] = "HK416",
 ["HK416 FG folded"] = "HK416 FG",
 ["HK416 D20RS folded"] = "HK416 D20RS",
 ["HK417 12Inch CQB folded"] = "HK417 12Inch CQB",
 ["HK417 12Inch CQB FG folded"] = "HK417 12Inch CQB FG",
 ["HK417 16Inch folded"] = "HK417 16Inch",
 ["HK417 16Inch FG folded"] = "HK417 16Inch FG",
 ["HK417 20Inch folded"] = "HK417 20Inch",
 ["HK417 20Inch FG folded"] = "HK417 20Inch FG",
 ["Assault Rifle MK18 CQC (5.56mm) folded"] = "Assault Rifle MK18 CQC (5.56mm)",
 ["Assault Rifle MK18 CQC FG (5.56mm) folded"] = "Assault Rifle MK18 CQC FG (5.56mm)",
 ["Assault Rifle MK18 CAR (5.56mm) folded"] = "Assault Rifle MK18 CAR (5.56mm)",
 ["Assault Rifle MK18 CAR FG (5.56mm) folded"] = "Assault Rifle MK18 CAR FG (5.56mm)",
 ["Assault Rifle MK18 (5.56mm) folded"] = "Assault Rifle MK18 (5.56mm)",
 ["Assault Rifle MK18 FG (5.56mm) folded"] = "Assault Rifle MK18 FG (5.56mm)",
 ["MOE Warrior CQB folded"] = "MOE Warrior CQB",
 ["MOE Warrior CQB BK folded"] = "MOE Warrior CQB BK",
 ["MOE Warrior folded"] = "MOE Warrior",
 ["MOE Warrior BK folded"] = "MOE Warrior BK",
 ["MOE Warrior LB folded"] = "MOE Warrior LB",
 ["MOE Warrior LB BK folded"] = "MOE Warrior LB BK",
 ["MOE Warrior G2 folded"] = "MOE Warrior G2",
 ["MOE Warrior G2 BK folded"] = "MOE Warrior G2 BK",
 ["MOE Warrior G2 LB folded"] = "MOE Warrior G2 LB",
 ["MOE Warrior G2 LB BK folded"] = "MOE Warrior G2 LB BK",
 ["Assault Rifle AR15 5.56x45 no FG folded"] = "Assault Rifle AR15 5.56x45 no FG",
 ["Assault Rifle AR15 5.56x45 folded"] = "Assault Rifle AR15 5.56x45",
 ["Assault Rifle DPMS 308 no FG folded"] = "Assault Rifle DPMS 308 no FG",
 ["Assault Rifle DPMS 308 folded"] = "Assault Rifle DPMS 308",
 ["SW MP15 CQC folded"] = "SW MP15 CQC",
 ["SW MP15 CQC FG folded"] = "SW MP15 CQC FG",
 ["SW MP15 folded"] = "SW MP15",
 ["SW MP15 FG folded"] = "SW MP15 FG",
 ["SW MP15 LB folded"] = "SW MP15 LB",
 ["SW MP15 LB FG folded"] = "SW MP15 LB FG",
 ["Wilson NATO folded"] = "Wilson NATO",
 ["Wilson NATO FG folded"] = "Wilson NATO FG",
 ["Wilson SPC folded"] = "Wilson SPC",
 ["Wilson SPC FG folded"] = "Wilson SPC FG",
 ["Wilson458 folded"] = "Wilson458",
 ["Wilson458 FG folded"] = "Wilson458 FG",
 ["Assault Rifle Predatar folded"] = "Assault Rifle Predatar",
 ["Small Assault Rifle M933 Grendel (6.5) folded"] = "Small Assault Rifle M933 Grendel (6.5)",
 ["Small Assault Rifle M933 Grendel FG (6.5) folded"] = "Small Assault Rifle M933 Grendel FG (6.5)",
 ["Assault Rifle M4 Grendel (6.5) folded"] = "Assault Rifle M4 Grendel (6.5)",
 ["Assault Rifle M4 Grendel FG (6.5) folded"] = "Assault Rifle M4 Grendel FG (6.5)",
 ["Assault Rifle LAC Grendel (6.5) folded"] = "Assault Rifle LAC Grendel (6.5)",
 ["Assault Rifle LAC Grendel FG (6.5) folded"] = "Assault Rifle LAC Grendel FG (6.5)",
 ["Assault Rifle M4A1 CQB (.300 BLK) folded"] = "Assault Rifle M4A1 CQB (.300 BLK)",
 ["Assault Rifle M4A1 CQB AG (.300 BLK) folded"] = "Assault Rifle M4A1 CQB AG (.300 BLK)",
 ["Assault Rifle M4A1 (.300 BLK) folded"] = "Assault Rifle M4A1 (.300 BLK)",
 ["SW MP15 300BLK CQC folded"] = "SW MP15 300BLK CQC",
 ["SW MP15 300BLK CQC FG folded"] = "SW MP15 300BLK CQC FG",
 ["SW MP15 300BLK folded"] = "SW MP15 300BLK",
 ["SW MP15 300BLK FG folded"] = "SW MP15 300BLK FG",
 ["MOE Warrior 300BLK folded"] = "MOE Warrior 300BLK",
 ["MOE Warrior 300BLK BK folded"] = "MOE Warrior 300BLK BK",
 ["Small Assault Rifle M933 (300BLK) folded"] = "Small Assault Rifle M933 (300BLK)",
 ["Small Assault Rifle M933 FG (300BLK) folded"] = "Small Assault Rifle M933 FG (300BLK)",
 ["Assault Rifle M4 SOPMOD (300BLK) folded"] = "Assault Rifle M4 SOPMOD (300BLK)",
 ["Assault Rifle M4 SOPMOD FG (300BLK) folded"] = "Assault Rifle M4 SOPMOD FG (300BLK)",
 ["Assault Rifle SIG 556 CQC (5.56mm) folded"] = "Assault Rifle SIG 556 CQC (5.56mm)",
 ["Assault Rifle SIG 556 CQC FG (5.56mm) folded"] = "Assault Rifle SIG 556 CQC FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR (5.56mm) folded"] = "Assault Rifle SIG 556 CAR (5.56mm)",
 ["Assault Rifle SIG 556 CAR FG (5.56mm) folded"] = "Assault Rifle SIG 556 CAR FG (5.56mm)",
 ["Assault Rifle SIG 556 (5.56mm) folded"] = "Assault Rifle SIG 556 (5.56mm)",
 ["Assault Rifle SIG 556 FG (5.56mm) folded"] = "Assault Rifle SIG 556 FG (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CQC CIV (5.56mm)",
 ["Assault Rifle SIG 556 CQC CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CQC CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CAR CIV (5.56mm)",
 ["Assault Rifle SIG 556 CAR CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CAR CIV FG (5.56mm)",
 ["Assault Rifle SIG 556 CIV (5.56mm) folded"] = "Assault Rifle SIG 556 CIV (5.56mm)",
 ["Assault Rifle SIG 556 CIV FG (5.56mm) folded"] = "Assault Rifle SIG 556 CIV FG (5.56mm)",
 ["Small Assault Rifle M933 Beowulf FG (.50 BEO) folded"] = "Small Assault Rifle M933 Beowulf FG (.50 BEO)",
 ["Assault Rifle M4 Beowulf (.50 BEO) folded"] = "Assault Rifle M4 Beowulf (.50 BEO)",
 ["Assault Rifle M4 Beowulf FG (.50 BEO) folded"] = "Assault Rifle M4 Beowulf FG (.50 BEO)",
 ["Assault Rifle LAC Beowulf (.50 BEO) folded"] = "Assault Rifle LAC Beowulf (.50 BEO)",
 ["Assault Rifle LAC Beowulf FG (.50 BEO) folded"] = "Assault Rifle LAC Beowulf FG (.50 BEO)",
 ["Assault Rifle SC2010 (7.62mm) folded"] = "Assault Rifle SC2010 (7.62mm)",
 ["Assault Rifle SC2026 (7.62x39mm) folded"] = "Assault Rifle SC2026 (7.62x39mm)",
 ["Assault Rifle SC2027 (7.62x51mm) folded"] = "Assault Rifle SC2027 (7.62x51mm)",
 ["Pindad SS2 CQC RIS folded"] = "Pindad SS2 CQC RIS",
 ["Pindad SS2 CQC RIS FG folded"] = "Pindad SS2 CQC RIS FG",
 ["ACE CQC folded"] = "ACE CQC",
 ["ACE CAR folded"] = "ACE CAR",
 ["ACE folded"] = "ACE",
 ["ACE CQC RUS folded"] = "ACE CQC RUS",
 ["ACE RUS folded"] = "ACE RUS",
 ["ACE CQC NATO folded"] = "ACE CQC NATO",
 ["ACE CAR NATO folded"] = "ACE CAR NATO",
 ["ACE NATO folded"] = "ACE NATO",
 ["M27 IAR folded"] = "M27 IAR",
 ["Assault Rifle T14 M4A1 (410) folded"] = "Assault Rifle T14 M4A1 (410)",
 ["Assault Rifle T14 M4A1 FG (410) folded"] = "Assault Rifle T14 M4A1 FG (410)",
}
 local LUAFoldUnfoldStockStocks = {
 ["m4_butt"] = "m4_butt_folded",
 ["m4_butt_folded"] = "m4_butt",
 ["m4sopmod_butt"] = "m4sopmod_butt_folded",
 ["m4sopmod_butt_folded"] = "m4sopmod_butt",
}

local function CanFoldStock(item)
	local monster = GetCurrentMerc()
	local hands = monster:GetHands()
    return hands ~= nil
		-- and HUDState() ~= 5	-- gpgpgpgp: needs testing (folding in shop etc). uncomment if any trouble occurs
		and item == hands
		and item:GetFamily() == Family.ifWeapon
		and LUAFoldStockWeapons[item:GetName()] ~= nil
end

local function CanUnfoldStock(item)
	local monster = GetCurrentMerc()
	local hands = monster:GetHands()
    return hands ~= nil
		-- and HUDState() ~= 5	-- gpgpgpgp: needs testing (folding in shop etc). uncomment if any trouble occurs
		and item == hands
		and item:GetFamily() == Family.ifWeapon
		and LUAUnfoldStockWeapons[item:GetName()] ~= nil	-- gpgpgpgp: only difference is here
end

local function FoldStock(item)
	local monster = GetCurrentMerc()
	local new_weapon = LUAFoldStockWeapons[item:GetName()]
    if new_weapon ~= nil then
		local butt = item:RemoveAddon(AddonTypes.adStock)	-- gpgpgpgp: handle the butt addon
		if butt ~= nil then
			monster:DeleteItem(butt)
			local new_butt = LUAFoldUnfoldStockStocks[butt:GetName()]
			if new_butt ~= nil then
				item:AttachAddon(new_butt)
			end
		end
		item:ChangeItemType(new_weapon)
        GetCurrentMerc():AddChangeItemAction(0.1085)	-- gpgpgpgp: is it a fixed value in vanilla game or is it calculated by character stats & weapon weight? 0.1085 (=2.17/20) is a temporary placeholder value.
    end
end

local function UnfoldStock(item)
	local monster = GetCurrentMerc()
	local new_weapon = LUAUnfoldStockWeapons[item:GetName()]	-- gpgpgpgp: only difference is here
    if new_weapon ~= nil then
		local butt = item:RemoveAddon(AddonTypes.adStock)	-- gpgpgpgp: handle the butt addon
		if butt ~= nil then
			monster:DeleteItem(butt)
			local new_butt = LUAFoldUnfoldStockStocks[butt:GetName()]
			if new_butt ~= nil then
				item:AttachAddon(new_butt)
			end
		end
		item:ChangeItemType(new_weapon)
        GetCurrentMerc():AddChangeItemAction(0.11)	-- gpgpgpgp: is it a fixed value in vanilla game or is it calculated by character stats & weapon weight? 0.11 is a temporary placeholder value.
    end
end


AddContextMenu(action_fold, FoldStock, CanFoldStock)
AddContextMenu(action_unfold, UnfoldStock, CanUnfoldStock)

-- end added by gpgpgpgp
