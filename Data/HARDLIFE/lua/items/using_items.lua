-- Общие функции и массивы
 local BoxItems = {
 ["PackedAmmoBox M193 (5.56/1000)"] = "BigWoodAmmoBox M193 (5.56/1000)",
 ["PackedAmmoBox M80 (7.62x51/800)"] = "Ammo Box 500 Noveske .308",
 ["PackedAmmoBox 7N6 (5.45/1000)"] = "BigWoodAmmoBox 7N6 (5.45/1000)",
 ["PackedAmmoBox 57-N-231S (7.62x39/1000)"] = "BigWoodAmmoBox 57-N-231S (7.62x39/1000)",
 ["PackedAmmoBox 7N1 (7.62x54/800)"] = "BigWoodAmmoBox 7N1 (7.62x54/800)",
 ["PackedAmmoBox CBC (9x19/500)"] = "Big Ammo box 500 (9x19)",
 ["PackedAmmoBox Palinero (9x18/500)"] = "BigAmmoBox (9x18/500)",
 ["PackedAmmoBox Norinco (9x18/500)"] = "Big Ammo box PBM (9x18)",
 ["PackedAmmoBox 7n21 (9x19/500)"] = "Ammo box 500 HLA (7N21)",
 ["PackedAmmoBox Algeira (.357 SIG/500)"] = "Ammo Box 500 (.357 SIG SP)",
 ["PackedAmmoBox Algeira (9x19/500)"] = "BigAmmoBox (9x19/500)",
 ["PackedAmmoBox Algeira (.38/500)"] = "Ammo box 500 (.38 Spl Algeira)",
 ["PackedAmmoBox CBC (.38/500)"] = "Big Ammo box (.38 spc HP)",
 ["PackedAmmoBox Algeira (.40 SW/500)"] = "Ammo box 500 (Algeira 40 S&W)",
 ["PackedAmmoBox CBC (.40 SW/500)"] = "Big Ammo box CBC (.40 S&W)",
 ["PackedAmmoBox Algeira (.357 Magnum/500)"] = "Ammo Box 500 (.357 Algeira)",
 ["PackedAmmoBox CBC (.357 Magnum/500)"] = "Big Ammo box CBC (.357 SP)",
 ["PackedAmmoBox Algeira (.45 ACP/500)"] = "BigAmmoBox (.45 ACP/500)",
 ["PackedAmmoBox Eagle (.45 ACP/500)"] = "Ammo box 500 HLA (Federal 230grn)",
 ["PackedAmmoBox (5.8x21/500)"] = "Ammo box DAP92 500 (5.8x21mm)",
 ["PackedAmmoBox Algeira (12ga/200)"] = "Ammo box 500 (00 Algeira)",
 ["PackedAmmoBox Palinero (12ga/200)"] = "Ammo box 500 (00 Palinero)",
 ["PackedAmmoBox Algeira (10mm/500)"] = "Ammo box 500 (10mm SP)",
 ["PackedAmmoBox Algeira (30-06/500)"] = "BigAmmoBox (30-60/400)",
 ["PackedAmmoBox DBP87 (5.8x42/500)"] = "Ammo box 500 (DBP87)",
 ["PackedAmmoBox DBP88 (5.8x42/500)"] = "Ammo box 500 (DBP88)",
 ["PackedAmmoBox DBP10 (5.8x42/500)"] = "Ammo box 500 (DBP10)",
 ["PackedAmmoBox Palinero (5.45x39/500)"] = "BigAmmoBox (5.45/500)",
 ["PackedAmmoBox Algeira (300 BLK/500)"] = "Ammo box 500 HLA (.300 Rem 220grn)",
 ["PackedAmmoBox Algeira (5.56/500)"] = "BigAmmoBox (5.56/500)",
 ["PackedAmmoBox CBC (5.56/500)"] = "BigWoodAmmoBox M193 (5.56/1000)",
 ["PackedAmmoBox Norinco (5.56x45/500)"] = "Ammo box 500 (223 Norinco)",
 ["PackedAmmoBox Algeira (6.8 SPC/500)"] = "Big Ammo box FMJ (6.8x43/500)",
 ["PackedAmmoBox Norinco (7.62x39/500)"] = "Ammo box 500 HLA 7.62x39 Norinco",
 ["PackedAmmoBox Palinero (7.62x39/500)"] = "BigAmmoBox (7.62x39/500)",
 ["PackedAmmoBox Algeira (7.62x51/500)"] = "BigAmmoBox (7.62x51/400)",
 ["PackedAmmoBox CBC (7.62x51 M80/500)"] = "BigWoodAmmoBox M80 (7.62x51/800)",
 ["PackedAmmoBox CBC (7.62x51 M933/500)"] = "BigWoodAmmoBox M993 (7.62x51/800)",
 ["PackedAmmoBox Palinero (7.62x54R/500)"] = "BigAmmoBox (7.62x54/400)",
 ["PackedAmmoBox Algeira (.300 WM/500)"] = "Ammo box 500 (.300 WM SP)",
 ["PackedAmmoBox Palinero (9x39/500)"] = "Big Ammo box 500 HLA (9x39)",
 ["PackedAmmoBox Algeira (.338 Lapua/500)"] = "Big Ammo box Surplus (LAPUA)", 
 ["BigWoodBoxM4A1"] = "Assault Rifle M4A1 (5.56mm)",
 ["BigWoodBoxM16A2"] = "Assault Rifle M16A2 (5.56mm)",
 ["BigWoodBoxG3"] = "Assault Rifle G3A3 (7.62x51mm)",
 ["BigWoodBoxG36"] = "Assault Rifle G36E (5.56mm)",
 ["BigWoodBoxAK103"] = "Assault Rifle AK-103 (7.62x39mm)",
 ["BigWoodBoxM7F"] = "Assault Rifle AR70 90 (5.56mm)",
 ["BigWoodBoxVektorZ88"] = "Pistol Beretta 92S (9mm)",
 ["BigWoodBoxPT1911"] = "Pistol PT1911 (45)",
 ["BigWoodBoxMP59mm"] = "Submachine-gun HK MP5A5 (9mm)",
 ["BigWoodBoxBizon"] = "Submachine-gun Bizon 2 (9x18mm)",
 ["BigWoodBoxVityaz"] = "Submachine-gun PP-19 Vityaz (9mm)",
 ["BigWoodBoxBTMP9"] = "Submachine-gun BT MP9 (9mm)",
 ["BigWoodBoxFEGAK63"] = "Assault Rifle AK-63F (7.62x39mm)",
 ["BigWoodBoxFEGAK63D"] = "Assault Rifle AK-63D (7.62x39mm)",
 ["BigWoodBoxAKM"] = "Assault Rifle AKM (7.62x39mm)",
 ["BigWoodBoxAKMN"] = "Assault Rifle AKMN (7.62x39mm)",
 ["BigWoodBoxM964Civ"] = "Carabine IMBEL M964A1",
 ["BigWoodBoxSAF9"] = "Submachine-gun FAMAE SAF (9mm)",
 ["BigWoodBoxMT40"] = "Submachine-gun Taurus MT-40 (.40 S&W)",
 ["BigWoodBoxKiparis"] = "Submachine-gun Kiparis (9mm)",
 ["BigWoodBoxSMT40"] = "Assault Rifle Taurus CQC (.40)",
 ["BigWoodBoxP90"] = "Submachine-gun FN P90 (5.7mm)",
 ["BigWoodBox9A91"] = "Assault Rifle 9A91 (9x39mm)",
 ["BigWoodBoxSPAS15"] = "SPAS15 (12ga)",
 ["BigWoodBoxSAFIRT14Classic"] = "Assault Rifle T14 (410)",
 ["BigWoodBoxMosquefal"] = "Rifle Mosquefal",
 ["BigWoodBoxAUGPARA"] = "Submachine-gun Steyr AUG (9mm)",
 ["BigWoodBoxK1A1"] = "Assault Rifle DaewooK1 (5.56mm)",
 ["BigWoodBoxK2"] = "Assault Rifle DaewooK2 (5.56mm)",
 ["BigWoodBoxSIG540"] = "Assault Rifle SG540 (5.56)",
 ["BigWoodBoxSIG542"] = "Assault Rifle SG542 (7.62x51mm)",
 ["BigWoodBoxGalil"] = "Assault Rifle Galil AR (7.62mm)",
 ["BigWoodBoxGalil556"] = "Assault Rifle Galil AR (5.56mm)",
 ["BigWoodBoxGalilACE556"] = "ACE",
 ["BigWoodBoxHK33"] = "Assault Rifle HK33EA2 (5.56mm)",
 ["BigWoodBoxMD97"] = "Assault Rifle IMBEL MD-97L (5.56mm)",
 ["BigWoodBoxPSL"] = "Sniper Rifle PSL (7.62x54mm)",
 ["BigWoodBoxIA2Cciv"] = "Assault Rifle IMBEL IA2C CIV (5.56mm)",
 ["BigWoodBoxIA2C"] = "Assault Rifle IMBEL IA2C (5.56mm)",
 ["BigWoodBoxType56"] = "Assault Rifle Type 56 Y (7.62x39mm)",
 ["BigWoodBoxType56i"] = "Assault Rifle Type56-1 Y (7.62x39mm)",
 ["BigWoodBoxType56ii"] = "Assault Rifle Type56-2 (7.62x39mm)",
 ["BigWoodBoxGovCarbine"] = "Assault Rifle AR-15A2 (5.56mm)",
 ["BigWoodBoxTacticalCarbine"] = "Assault Rifle Government Carbine (5.56mm)",
 ["BigWoodBoxM964"] = "IMBEL M964",
 ["BigWoodBoxAUGA1"] = "Assault Rifle Steyr AUG A1 (5.56mm)",
 ["BigWoodBoxAUGA2"] = "Assault Rifle Steyr AUG A2 SR (5.56mm)",
 ["BigWoodBoxNorincoCQ"] = "Assault Rifle Norinco CQ (5.56mm)",
 ["BigWoodBoxNorincoCQCIV"] = "Assault Rifle Norinco CQ CIV (5.56mm)",
 
 ["MEGABOX Algeira (9mm/2500)"] = "BigAmmoBox (9x19/500)",
 ["MEGABOX CBC (9mm/2500)"] = "Big Ammo box 500 (9x19)",
 ["MEGABOX FM (9mm/2500)"] = "CajaMunicionGrande (9mm/1000)",
 ["MEGABOX Algeira (5.56/3000)"] = "BigAmmoBox (5.56/500)",
 ["MEGABOX CBC (5.56/3000)"] = "Ammo box 500 (5.56 Noveske)",
 ["MEGABOX CBC AP (5.56/3000)"] = "BigWoodAmmoBox M955 (5.56/1000)",
 ["MEGABOX Norinco (5.56/3000)"] = "Ammo box 500 (223 Norinco)",
 ["MEGABOX Palinero (5.45x39/3000)"] = "BigAmmoBox (5.45/500)",
 ["MEGABOX Palinero (7.62x39/3000)"] = "BigAmmoBox (7.62x39/500)",
 ["MEGABOX Norinco (7.62x39/3000)"] = "Ammo box 500 HLA 7.62x39 Norinco",
 ["MEGABOX Palinero (7.62x54R/3000)"] = "BigAmmoBox (7.62x54/400)",
 ["MEGABOX Algeira (7.62/3000)"] = "BigAmmoBox (7.62x51/400)",
 ["MEGABOX CBC (7.62/3000)"] = "BigWoodAmmoBox M80 (7.62x51/800)",
 ["MEGABOX CBC AP (7.62/3000)"] = "BigWoodAmmoBox M993 (7.62x51/800)",
 ["MEGABOX FM (7.62/3000)"] = "CajaMunicionGrande (7.62/400)",
 ["MEGABOX Norinco (7.62/3000)"] = "Ammo Box 500 Duplex .308",
}

 local SimilarItems = {
 ["PVS-7B"] = "PVS-7B_up",
 ["Folded Ammo Belt"] = "Ammo Belt",
 ["Folded Basic Belt"] = "Basic Belt",
 ["Folded Belt_01"] = "Belt_01",
 ["Folded Belt_02"] = "Belt_02",
 ["Folded Belt_03"] = "Belt_03",
 ["Folded Belt_04"] = "Belt_04",
 ["Folded Tactical Belt"] = "Tactical Belt",
 ["Folded Tactical Vest"] = "Tactical Vest",
 ["Folded Razgr_molle"] = "Razgr_molle",
 ["Folded Razgr_smerch"] = "Razgr_smerch",
 ["Folded VestNew"] = "VestNew",
 ["Folded Ammo Cartouche6"] = "Ammo Cartouche6",
 ["Folded Ammo CartoucheVert"] = "Ammo CartoucheVert",
 ["Folded Ammo Cartouche"] = "Ammo Cartouche",
 ["Sack"] = "Sack folded",
 ["Helmet 6B6-3_up"] = "Helmet 6B6-3",
 ["Helmet Ballistic_up"] = "Helmet Ballistic",
 }

 local PartsOfItems = {
 ["Folded Ammo Belt"] = "Ammo Cartouche6",
 ["Folded Belt_02"] = "Ammo Cartouche",
 ["Folded Belt_03"] = "Ammo CartoucheVert",
 ["Folded Tactical Belt"] = "Ammo CartoucheVert",
 }

local ContainerItemsBoxMap = {}

local function AdoptBoxForItem(box, item)
    local newBoxName = ContainerItemsBoxMap[item:GetName()]
    if newBoxName ~= nil then
        local newBox = CreateItem(newBoxName)
        newBox:GetOtherData():SetItemsCount(0)
        local monster = GetCurrentMerc()
        monster:DeleteItem(box)
        monster:AddItem(newBox, true)
    end
end

local function CacheBoxesForAdoptation()
    --todo do not use this config directly, it's deprecated
    local conf = Config("containers")
    local items = conf:XPath("/root/Container")
    for _, node in ipairs(items) do
        local itemName = node:AttrStr("CanContainItem")
        local item = GetItem(itemName)
        if item ~= nil and item:IsGrenade() then
            ContainerItemsBoxMap[itemName] = tostring(node)
            AddItemContextMenu("Box_Wood_Empty", _t"lang/lua/using_items/adapt_for" .. item:GetRealName(), function(box) AdoptBoxForItem(box, item)  end, CanUnpackBox)
        end
    end

    conf:close()
end

-- Функции проверки, можно ли отобразить пункт меню
function CanUseItem(item)
	local monster = GetCurrentMerc()
	-- проверяем что не открыт интерфейс магазина, что данный предмет находится у нас в инвентаре и что этот предмет принадлежит нам
	return	HUDState() ~= 5
		and monster:HasItem(item) 
		and not item:IsShopItem()
		and item:GetCondition() > 0 
end

-- added by gpgpgpgp
local function IsItemInCar(item)
	if TheCar ~= nil and TheCar ~= NULL then
		local items = GetCarItems()
		for _, carItem in ipairs(items) do
			if carItem == item then
				return true
			end
		end
	end
	return false
end

-- added by gpgpgpgp
function CanFoldItem(item)
	return	HUDState() ~= 5
		and not IsBattle()
		and not item:IsShopItem()
		and item:GetCondition() > 0 
		and not IsItemInCar(item)
end

function CanUnpackBox(item)
	local monster = GetCurrentMerc()
	-- проверяем что данный итем находится у нас в инвентаре и что у нас есть необходимые инструменты
	return	HUDState() ~= 5
		and monster:HasItem(item)
		and not item:IsShopItem()
		and (monster:HasItem("tool2") or monster:HasItem("tool3"))
end

function Handle_BoxThrowOut_Menu(item)
	local monster = GetCurrentMerc()
	return item:GetOtherData():GetItemsCount() > 1
		and HUDState() ~= 5
		and monster:HasItem(item)
		and not item:IsShopItem()
end

-- Функция-обработчик клика по пункту меню
function AddEmptyCan(item)
	local monster = GetCurrentMerc()
	local hands = monster:GetHands()
	if hands ~= item then return end
	item:ChangeItemType("Car_can5_empty")
	if IsBattle() then monster:AddChangeItemAction(10) end
end

function Handle_BoxThrowOut(item)
	local monster = GetCurrentMerc()
	local info = item:GetInfo()
	for i = 1, item:GetOtherData():GetItemsCount() do
		local item = CreateItem(info:GetOtherInfo():GetCanContainItem())
		DropItem(item)
	end
	if IsBattle() then monster:AddChangeItemAction(3*item:GetOtherData():GetItemsCount()) end
	item:GetOtherData():SetItemsCount(0)
	-- как ещё один вариант:
	--item:ThrowContent()
end

function UnpackMedBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 DropItem("Box_Med_Supplies")
 DropItem("Field Paramedic Kit5")
 for i = 1, 6 do
   DropItem("Field Paramedic Kit1")
   if(i % 2 == 0) then DropItem("Field Paramedic Kit3") end
 end
 for i = 1, 4 do
   DropItem("Field Paramedic Kit2")
   if(i % 2 == 0) then DropItem("Field Paramedic Kit4") end
 end
 if IsBattle() then monster:AddChangeItemAction(10) end
end

function UnpackMedBox2(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 DropItem("Field Paramedic Kit5")
 DropItem("Field Paramedic Kit4")
 DropItem("Field Paramedic Kit3")
 DropItem("Field Paramedic Kit3")
 DropItem("Field Paramedic Kit2")
 DropItem("Field Paramedic Kit2")
 DropItem("Field Paramedic Kit2")
 DropItem("Field Paramedic Kit1")
 DropItem("Field Paramedic Kit1")
 DropItem("Field Paramedic Kit1")
 DropItem("Field Paramedic Kit1")
 if IsBattle() then monster:AddChangeItemAction(10) end
end

function UnpackTushBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 24 do
   DropItem("Food_tush_gov")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackCamoBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 15 do
   DropItem("Camo Kit")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackCleaningKitBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 10 do
   DropItem("Cleaning Kit")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackContactFuzeBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 10 do
   DropItem("Fuze_m605")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackRemoteFuzeBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 10 do
   DropItem("Fuze_radio")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMREBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 12 do
   DropItem("Food_irpb")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMREHUGEBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 DropItem("PackedMREBox")
 DropItem("PackedMREBox")
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackRationBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 24 do
   DropItem("Food_ration")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackSmershBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Razgr_smerch")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackTacVestBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded VestNew")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackYellowTacVestBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Tactical Vest")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMolleTacVestBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Razgr_molle")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackVestBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Tactical Armor Vest M100")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackVestM200Box(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Tactical Armor Vest M200")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackWildcatVestBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Tactical Armor Wildkat")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackKevlarBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Tactical Armor Vest M300")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackVyzovBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Tactical Armor Vizov")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMetalPlateBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Titanium armor plate Lvl 3")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMetalPlateStrongBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Titanium armor plate Lvl 4")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackCeramicPlateBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Ceramic armor plate Lvl 3")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackCeramicPlateStrongBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Ceramic armor plate Lvl 4")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackSteelHelmetBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Steel Helmet")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackPASGTBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Helmet PASGT")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackACHBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Kevlar Helmet")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackMICHBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("MICH Helmet")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackPASGTSWATBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Titanium Helmet M100")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackBasicBeltBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Ammo Belt")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackHolsterBeltBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Basic Belt")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackTacticalBeltBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Belt_01")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackButtpackBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Ammo Cartouche6")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackBigButtpackBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Ammo CartoucheVert")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackVeryBigButtpackBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Folded Ammo Cartouche")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function Unpack60MortarBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Bomb60")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function Unpack82MortarBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 5 do
   DropItem("Bomb82")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackUniformBundlePEPBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 15 do
   DropItem("Palinero ex president uniform")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackUniformBundlePETBox(item)
 local monster = GetCurrentMerc()
 monster:DeleteItem(item)
 for i = 1, 15 do
   DropItem("Palinero ex tormens uniform")
 end
 if IsBattle() then monster:AddChangeItemAction(5) end
end

function UnpackAmmoBox(item)
 local monster = GetCurrentMerc()
 local new_item = BoxItems[item:GetName()]
 if new_item ~= nil then
  monster:DeleteItem(item)
  monster:AddItem(new_item)
  if IsBattle() then monster:AddChangeItemAction(10) end
 end
end

function UnpackWeaponBox(item)
 local monster = GetCurrentMerc()
 local new_item = BoxItems[item:GetName()]

   if new_item ~= nil and monster:DeleteItem(item) then
     for i = 1, 5 do
       weapon = CreateItem(new_item)
       DropItem(weapon)
     end
     SmartSkip(120, 30)
   end
end

function UnpackParamedicKit2(item)
  local confirm = 1
  local text = _t"lang/lua/using_items/disassembly_medkit"

  if IsBattle() then confirm = MessageBox(text, 3) end

  if(confirm == 1) then
	local condition = item:GetCondition()
	local monster = GetCurrentMerc()


	if condition > 0.34 then
		item:ChangeItemType("Field Paramedic Kit1")
		item:SetCondition(1.00)
	else
		monster:DeleteItem(item)
	end

	local morph = CreateItem("morphine")
	morph:SetCondition(condition)
	monster:AddItem(morph)

	if condition > 0.67 then monster:AddItem("Field Paramedic Kit1") end
	return true
  end

  return false
end

function ChangeItem(item)
 local monster = GetCurrentMerc()
 local similar_item = SimilarItems[item:GetName()]
 if similar_item == nil then
	for key, value in pairs(SimilarItems) do
		if value == item:GetName() then
			similar_item = key
			break
		end
	end
 end

 if similar_item ~= nil then
	item:ChangeItemType(similar_item)
	monster:AddChangeItemAction(1)
 else
	monster:Say(_t"lang/lua/using_items/fail")
 end
end


-- edited by gpgpgpgp
function UnfoldItem(item)
 local monster = GetCurrentMerc()
 local similar_item = SimilarItems[item:GetName()]
 if similar_item == nil then
	for key, value in pairs(SimilarItems) do
		if value == item:GetName() then
			similar_item = key
			break
		end
	end
 end

 local hands = monster:GetHands()
 if hands ~= item 
	and monster:HasItem(item)
 then monster:Say(_t"lang/lua/using_items/take_in_hands2") return end

 if similar_item ~= nil then 
--and item:GetInfo():GetWeight() == GetItem(similar_item):GetWeight() then

    local container = item:GetContainer()
	if container ~= nil then
		local items = container:GetItems()
		if items ~= nil then 
			for _,inItem in ipairs(items) do
				inItem = item:GetContainer():RemoveItem(inItem)
				DropItem(inItem)
			end
		end
	end

	local meta = item:GetMeta()
	local hasKnife = meta:Get("knife") ~= nil
	if hasKnife then
		DropItem(meta:Get("knife"))
	end
    
	if monster:HasItem(item) then
		monster:DeleteItem(item)
		monster:AddItem(similar_item)
	else
		item:Delete()
		DropItem(similar_item)
	end
	monster:AddChangeItemAction(2)
	
 else
	monster:Say(_t"lang/lua/using_items/fail")
 end
end


-- edited by gpgpgpgp
function DestroyItem(item)
 local monster = GetCurrentMerc()
 local similar_item = PartsOfItems[item:GetName()]

 local hands = monster:GetHands()
 if hands ~= item 
	and monster:HasItem(item)
 then monster:Say(_t"lang/lua/using_items/take_in_hands2") return end

 if similar_item ~= nil then 

    local container = item:GetContainer()
	if container ~= nil then
		local items = container:GetItems()
		if items ~= nil then 
			for _,inItem in ipairs(items) do
				DropItem(inItem)
				item:GetContainer():RemoveItem(inItem)
			end
		end
	end
    
	if monster:HasItem(item) then
		monster:DeleteItem(item)
		monster:AddItem("Belt")
		monster:AddItem(similar_item)
	else
		item:Delete()
		DropItem("Belt")
		DropItem(similar_item)
	end
	monster:AddChangeItemAction(2)
 else
	monster:Say(_t"lang/lua/using_items/fail")
 end
end

function onBoxAdoptation(itemExample, itemEmptyBox)
    local boxName = ContainerItemsBoxMap[itemExample:GetName()]
    local monster = GetCurrentMerc()

    if boxName ~= nil and CanUnpackBox(itemEmptyBox) then
        if UserFuncs.ShowDialog(_t"lang/lua/using_items/adapt_prompt", 3) == 1 then
            local item = CreateItem(boxName)
            item:GetOtherData():SetItemsCount(1)

            monster:DeleteItem(itemEmptyBox)
            monster:AddItem(item)
            if IsBattle() then
                monster:AddChangeItemAction(30)
            end
            return item, true
        end
    else
        monster:Say(_t"lang/lua/using_items/tools_required")
    end

    return nil, false
end

function onSilencerAdoptation(itemExample, itemEmptyBox)
    local monster = GetCurrentMerc()

    if itemEmptyBox ~= nil and itemEmptyBox:GetOtherData():GetItemsCount()==0 and not itemExample:IsShopItem() then
        itemEmptyBox:GetOtherData():SetItemsCount(1)

--        monster:DeleteItem(itemExample)
        if IsBattle() then
            monster:AddChangeItemAction(30)
        end
        return itemEmptyBox, true
    else
--        monster:Say("Ничего не получится. Нужны инструменты.")
    end

    return nil, false
end

local function OpenNotebook()
    throw("USE Item", "note_open", GetCurrentMerc():GetID())
end

local function alwaysEnabled() return true end

local function CanCleanAllWeapons()
    return not IsBattle() and HUDState() ~= HUDType.hsShop
end

local function CanCleanAllWeaponsInCar()
    return TheCar ~= nil and TheCar ~= NULL and CanCleanAllWeapons()
end

local function CleanAllWeapons(cleaningKit)
    local team = GetPlayerSquadMembers()
    local info = cleaningKit:GetInfo():GetSpecificInfo()
    local kitResource = cleaningKit:GetCondition() * info.Usages

    if kitResource <= 0 then return nil end

    for _, monster in ipairs(team) do
        local items = monster:GetItemsDeep()
        for _, item in ipairs(items) do
            if item:GetFamily() == Family.ifWeapon and not item:GetInfo():IsGrenade() then
                local cleanAmount = 1 - item:GetDirt()
                if cleanAmount > 0 then
                    monster:AddChangeItemAction(3)
                    if cleanAmount >= kitResource then
                        item:SetDirt(1 - (cleanAmount - kitResource))
                        kitResource = 0
                        break
                    else
                        item:SetDirt(1)
                        kitResource = kitResource - cleanAmount
                    end
                end
            end
            if kitResource <= 0 then
                break
            end
        end
    end

    cleaningKit:SetCondition(kitResource / info.Usages)
    SmartSkip(120, 30)
end

local function CleanAllWeaponsInCar(cleaningKit)
    local info = cleaningKit:GetInfo():GetSpecificInfo()
    local kitResource = cleaningKit:GetCondition() * info.Usages
    local cleanTime = 0

    if kitResource <= 0 then return nil end

    local items = GetCarItems()
    for _, item in ipairs(items) do
        if item:GetFamily() == Family.ifWeapon and not item:GetInfo():IsGrenade() then
            local cleanAmount = 1 - item:GetDirt()
            if cleanAmount > 0 then
                cleanTime = cleanTime + 3

                if cleanAmount >= kitResource then
                    item:SetDirt(1 - (cleanAmount - kitResource))
                    kitResource = 0
                    break
                else
                    item:SetDirt(1)
                    kitResource = kitResource - cleanAmount
                end
            end
        end
        if kitResource <= 0 then
            break
        end
    end

    cleaningKit:SetCondition(kitResource / info.Usages)

    if cleanTime > 0 then
        local team = GetPlayerSquadMembers()
        cleanTime = cleanTime / #team
        for _, monster in ipairs(team) do
            monster:AddChangeItemAction(cleanTime)
        end
    end

    SmartSkip(120, 30)
end

function UnpackUniformBox (item)
    local monster = GetCurrentMerc()
    local condition = item:GetCondition()
    local uniform = nil
    local uniform_name = nil
    
    if  (item:GetName() == "Uniform Bundle Algeira") then
        uniform_name = "Algeira soldiers soldier uniform"
    elseif (item:GetName() == "Uniform Bundle Palinero") then
        uniform_name = "Palinero soldiers soldier uniform"
    elseif (item:GetName() == "Uniform Bundle Algeira carabineer") then
        uniform_name = "Algeira carabineer soldier uniform"
    end
    
    if monster:DeleteItem(item) then
        for i = 1, 15 do
            uniform = CreateItem(uniform_name)
            uniform:SetCondition(condition)
            DropItem(uniform )
        end
        SmartSkip(120, 30)
    end
end

-- ! Эта функа используется в том числе и для распаковки ящиков с формой
local function CanCutEpaulettes(item)
	local monster = GetCurrentMerc()
    local items = monster:GetItems()
    local hasbayonette = nil
    -- ищем в инвентаре колюще-режущий предмет
    for _,item in ipairs(items) do
        if item:GetFamily() == Family.ifAddon and item:GetInfo():GetAddonType() == AddonTypes.adBayonet then
            hasbayonette = 1
        end
    end
	-- проверяем что данный итем находится у нас в инвентаре и что у нас есть необходимые инструменты
	return HUDState() ~= 5
		and not IsBattle()
		and monster:HasItem(item)
		and not item:IsShopItem()
    -- в это условие нужно добавить наличие любого режущего предмета
    and item:GetCondition() > 0
    and (monster:HasItem("tool1") or monster:HasItem("tool2") or monster:HasItem("tool3") or hasbayonette ~= nil)
end


CacheBoxesForAdoptation()

-- Создание пункта меню и привязка к нему функции обработчика и анонимной функции проверки доступности данного пункта меню
-- четвёртый параметр - функция проверки, можно ли отобразить данный пункт меню
-- Распаковать ящики с формой
local action_unpack = _t"lang/lua/using_items/unpack"

AddItemContextMenu("Uniform Bundle Algeira", action_unpack, UnpackUniformBox, CanCutEpaulettes)
AddItemContextMenu("Uniform Bundle Palinero", action_unpack, UnpackUniformBox, CanCutEpaulettes)
AddItemContextMenu("Uniform Bundle Algeira carabineer", action_unpack, UnpackUniformBox, CanCutEpaulettes)
AddItemContextMenu("Uniform Bundle Palinero ex president", 	action_unpack, UnpackUniformBundlePEPBox, CanCutEpaulettes)
AddItemContextMenu("Uniform Bundle Palinero ex tormens", 	action_unpack, UnpackUniformBundlePETBox, CanCutEpaulettes)

local action_unpack_box = _t"lang/lua/using_items/unpack_box"
local action_throw_out = _t"lang/lua/using_items/throw_out"
local action_pack = _t"lang/lua/using_items/pack"
local action_remove_pouch = _t"lang/lua/using_items/remove_pouch"

AddItemContextMenu("PVS-7B", 					_t"lang/lua/using_items/raise_nvg", ChangeItem, CanUseItem)
AddItemContextMenu("PVS-7B_up", 				_t"lang/lua/using_items/lower_nvg", ChangeItem, CanUseItem)
AddItemContextMenu("Field Paramedic Kit2", 			action_unpack, UnpackParamedicKit2, CanUseItem)
AddItemContextMenu("Car_can5", 					_t"lang/lua/using_items/pour", AddEmptyCan, CanUseItem)
AddItemContextMenu("PackedCamoBox", 				action_unpack, UnpackCamoBox, CanUseItem)
AddItemContextMenu("PackedMedBox", 				action_unpack, UnpackMedBox, CanUseItem)
AddItemContextMenu("PackedCleaningKitBox", 				action_unpack, UnpackCleaningKitBox, CanUseItem)
AddItemContextMenu("Caja con medicamentos", 				action_unpack, UnpackMedBox2, CanUseItem)
AddItemContextMenu("PackedContactFuzeBox", 				action_unpack, UnpackContactFuzeBox, CanUseItem)
AddItemContextMenu("PackedRadioFuzeBox", 				action_unpack, UnpackRemoteFuzeBox, CanUseItem)
AddItemContextMenu("PackedTushBox", 				action_unpack, UnpackTushBox, CanUseItem)
AddItemContextMenu("PackedMREBox", 				action_unpack, UnpackMREBox, CanUseItem)
AddItemContextMenu("PackedRationBox", 				action_unpack, UnpackRationBox, CanUseItem)
AddItemContextMenu("PackedMREHUGEBox", 				action_unpack, UnpackMREHUGEBox, CanUseItem)
AddItemContextMenu("PackedSmershBox", 				action_unpack, UnpackSmershBox, CanUseItem)
AddItemContextMenu("PackedTacVestBox", 				action_unpack, UnpackTacVestBox, CanUseItem)
AddItemContextMenu("PackedYellowTacVestBox", 				action_unpack, UnpackYellowTacVestBox, CanUseItem)
AddItemContextMenu("PackedMolleVestBox", 				action_unpack, UnpackMolleTacVestBox, CanUseItem)
AddItemContextMenu("PackedVestBox", 				action_unpack, UnpackVestBox, CanUseItem)
AddItemContextMenu("PackedVestM200Box", 				action_unpack, UnpackVestM200Box, CanUseItem)
AddItemContextMenu("PackedWildcatVestBox", 				action_unpack, UnpackWildcatVestBox, CanUseItem)
AddItemContextMenu("PackedKevlarVestBox", 				action_unpack, UnpackKevlarBox, CanUseItem)
AddItemContextMenu("PackedVyzovBox", 				action_unpack, UnpackVyzovBox, CanUseItem)
AddItemContextMenu("PackedMetalPlateBox", 				action_unpack, UnpackMetalPlateBox, CanUseItem)
AddItemContextMenu("PackedMetalPlateStrongBox", 				action_unpack, UnpackMetalPlateStrongBox, CanUseItem)
AddItemContextMenu("PackedCeramicPlateBox", 				action_unpack, UnpackCeramicPlateBox, CanUseItem)
AddItemContextMenu("PackedCeramicPlateStrongBox", 				action_unpack, UnpackCeramicPlateStrongBox, CanUseItem)
AddItemContextMenu("PackedSteelHelmetBox", 				action_unpack, UnpackSteelHelmetBox, CanUseItem)
AddItemContextMenu("PackedPASGTBox", 				action_unpack, UnpackPASGTBox, CanUseItem)
AddItemContextMenu("PackedACHBox", 				action_unpack, UnpackACHBox, CanUseItem)
AddItemContextMenu("PackedMICHBox", 				action_unpack, UnpackMICHBox, CanUseItem)
AddItemContextMenu("PackedPASGTSWATBox", 				action_unpack, UnpackPASGTSWATBox, CanUseItem)
AddItemContextMenu("PackedBasicBeltBox", 				action_unpack, UnpackBasicBeltBox, CanUseItem)
AddItemContextMenu("PackedHolsterBeltBox", 				action_unpack, UnpackHolsterBeltBox, CanUseItem)
AddItemContextMenu("PackedTacticalBeltBox", 				action_unpack, UnpackTacticalBeltBox, CanUseItem)
AddItemContextMenu("PackedButtpackBox", 				action_unpack, UnpackButtpackBox, CanUseItem)
AddItemContextMenu("PackedBigButtpackBox", 				action_unpack, UnpackBigButtpackBox, CanUseItem)
AddItemContextMenu("PackedVeryBigButtpackBox", 				action_unpack, UnpackVeryBigButtpackBox, CanUseItem)
AddItemContextMenu("Packed60MortarBox", 				action_unpack, Unpack60MortarBox, CanUseItem)
AddItemContextMenu("Packed82MortarBox", 				action_unpack, Unpack82MortarBox, CanUseItem)
AddItemContextMenu("PackedAmmoBox M193 (5.56/1000)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox M80 (7.62x51/800)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox 7N6 (5.45/1000)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox 57-N-231S (7.62x39/1000)", 	action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox 7N1 (7.62x54/800)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (9x19/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (9x18/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Norinco (9x18/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox 7n21 (9x19/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.357 SIG/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (9x19/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.38/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (.38/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.40 SW/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (.40 SW/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.357 Magnum/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (.357 Magnum/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.45 ACP/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Eagle (.45 ACP/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox (5.8x21/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (12ga/200)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (12ga/200)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (10mm/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (30-06/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox DBP87 (5.8x42/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox DBP88 (5.8x42/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox DBP10 (5.8x42/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (5.45x39/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (300 BLK/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (5.56/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (5.56/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (6.8 SPC/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Norinco (7.62x39/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (7.62x39/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (7.62x51/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (7.62x51 M80/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox CBC (7.62x51 M933/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (7.62x54R/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.300 WM/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Palinero (9x39/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Algeira (.338 Lapua/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)
AddItemContextMenu("PackedAmmoBox Norinco (5.56x45/500)", 		action_unpack_box, UnpackAmmoBox, CanUnpackBox)




AddItemContextMenu("Box_grenade_m61", 				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Box_grenade_rgd-5",				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Box_grenade_f-1", 				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Box_grenade_rgn", 				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Box_grenade_rgo", 				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Box_grenade_m67", 				action_throw_out, Handle_BoxThrowOut, Handle_BoxThrowOut_Menu)
AddItemContextMenu("Folded Ammo Belt",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Basic Belt",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Belt_01",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Belt_02",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Belt_03",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Belt_04",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Tactical Belt",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Tactical Vest",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Razgr_molle",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Razgr_smerch",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded VestNew",				action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Ammo Cartouche6",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Ammo CartoucheVert",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Ammo Cartouche",			action_unpack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Sack folded",			_t"lang/lua/using_items/unfold_sack", UnfoldItem, CanFoldItem)
AddItemContextMenu("Ammo Belt",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Basic Belt",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Belt_01",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Belt_02",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Belt_03",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Belt_04",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Tactical Belt",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Tactical Vest",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Razgr_molle",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Razgr_smerch",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("VestNew",				action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Ammo Cartouche6",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Ammo CartoucheVert",		action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Ammo Cartouche",			action_pack, UnfoldItem, CanFoldItem)
AddItemContextMenu("Sack",			_t"lang/lua/using_items/fold_sack", UnfoldItem, CanFoldItem)
AddItemContextMenu("Folded Ammo Belt",				action_remove_pouch, DestroyItem, CanUseItem)
AddItemContextMenu("Folded Belt_02",				action_remove_pouch, DestroyItem, CanUseItem)
AddItemContextMenu("Folded Belt_03",				action_remove_pouch, DestroyItem, CanUseItem)
AddItemContextMenu("Folded Tactical Belt",			action_remove_pouch, DestroyItem, CanUseItem)
--AddItemContextMenu("Helmet Ballistic_up",		"Опустить забрало", ChangeItem, CanUseItem)
--AddItemContextMenu("Helmet Ballistic",			"Поднять забрало", ChangeItem, CanUseItem)
--AddItemContextMenu("Helmet 6B6-3_up",			"Опустить забрало", ChangeItem, CanUseItem)
--AddItemContextMenu("Helmet 6B6-3",			"Поднять забрало", ChangeItem, CanUseItem)

--AddItemContextMenu("Notebook", "Включить", OpenNotebook, alwaysEnabled)

--AddItemCombineHandler("Defensive Hand Grenade M61", "Box_Wood_Empty", onBoxAdoptation) -- CRASHES GAME!!! Need to completely rework ItemOnItem handler
--AddItemCombineHandler("Offensive Hand Grenade RGD-5", "Box_Wood_Empty", onBoxAdoptation)
--AddItemCombineHandler("Defensive Hand Grenade F-1", "Box_Wood_Empty", onBoxAdoptation)
--AddItemCombineHandler("Offensive Hand Grenade RGN", "Box_Wood_Empty", onBoxAdoptation)
--AddItemCombineHandler("Defensive Hand Grenade RGO", "Box_Wood_Empty", onBoxAdoptation)

AddItemCombineHandler("GemtechM4-96D Suppressor (5.56 mm)", "Gemtech Quickmount Kit", onSilencerAdoptation)
AddItemCombineHandler("Suppressor M4-2000 (5.56 mm)", "AAC Blackout Kit", onSilencerAdoptation)

AddItemContextMenu("Cleaning Kit", _t"lang/lua/using_items/cleanup_all", CleanAllWeapons, CanCleanAllWeapons)
AddItemContextMenu("Cleaning Kit", _t"lang/lua/using_items/cleanup_all_in_car", CleanAllWeaponsInCar, CanCleanAllWeaponsInCar)

AddItemContextMenu("BigWoodBoxM4A1", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxM16A2", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxG3", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxG36", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAK103", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxM7F", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxVektorZ88", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxPT1911", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxMP59mm", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxBizon", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxVityaz", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxBTMP9", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxFEGAK63", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxFEGAK63D", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAKM", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAKMN", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxM964Civ", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSAF9", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxMT40", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxKiparis", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSMT40", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxP90", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBox9A91", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSPAS15", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSAFIRT14Classic", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxMosquefal", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAUGPARA", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxK1A1", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxK2", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSIG540", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxSIG542", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxGalil556", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxGalilACE556", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxMD97", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxPSL", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxIA2Cciv", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxIA2C", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxType56", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxType56i", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxType56ii", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxGovCarbine", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxTacticalCarbine", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxM964", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAUGA1", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxAUGA2", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxHK33", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxNorincoCQ", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("BigWoodBoxNorincoCQCIV", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Algeira (9mm/2500)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX CBC (9mm/2500)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX FM (9mm/2500)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Algeira (5.56/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX CBC (5.56/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX CBC AP (5.56/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Norinco (5.56/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Palinero (5.45x39/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Palinero (7.62x39/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Norinco (7.62x39/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Palinero (7.62x54R/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Algeira (7.62/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX CBC (7.62/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX CBC AP (7.62/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX FM (7.62/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)
AddItemContextMenu("MEGABOX Norinco (7.62/3000)", 		action_unpack_box, UnpackWeaponBox, CanUnpackBox)

-- begin addition by gpgpgpgp

local tapeItem = GetItem("Tape")
local tapeUsage = 0.1
local function UseTape(monster)
    local tape, tapeCondition
    local tapeList = monster:GetItems(tapeItem)
    if tapeList and #tapeList > 0 then
        for _,t in ipairs(tapeList) do
            tapeCondition = t:GetCondition()
            if tapeCondition > 0 then
                tape = t
                break
            end
        end
    end

    if not tape then
        monster:Say(_t"lang/lua/mines/tape_required")
        return false
    end
    tape:SetCondition(math.max(0, tapeCondition - tapeUsage))
    return true
end

local function CombineDynamiteSticks(item)
	local monster = GetCurrentMerc()
	if not UseTape(monster) then
		return
	end
	if not CanCombineDynamiteSticks(item) then
        monster:Say(string.format("%d items are required.", 7))
		return
	end
	local inhands = ( monster:GetHands() == item )
	if IsBattle() then
		monster:DeleteItem(item)
		local items = monster:GetItems("Dynamite Stick")
		local removed  = 0
		for _, dynStick in ipairs(items) do
			if removed < 6 then
				monster:DeleteItem(dynStick)
				removed = removed + 1
			else
				break
			end
		end
		monster:AddChangeItemAction(5)
	else
		monster:DeleteItem(item)
		for i = 1, 6 do
			SquadRemoveItem("Dynamite Stick")
		end
	end
	local item_name, success = monster:AddItem("Dynamite Stick 7")
	if not success then
		DropItem("Dynamite Stick 7")
	end
end

function CanCombineDynamiteSticks(item)
	local monster = GetCurrentMerc()
	return	HUDState() ~= 5
		and monster:HasItem(item) 
		and not item:IsShopItem()
		and item:GetCondition() > 0 
		and ( (IsBattle() and #(monster:GetItems("Dynamite Stick")) >=7) or ( not IsBattle() and #SquadGetItems("Dynamite Stick") >=7) )
end

function SpiltDynamiteSticks(item)
	local monster = GetCurrentMerc()
	monster:DeleteItem(item)
	for i = 1, 7 do
		local item_name, success = monster:AddItem("Dynamite Stick")
		if not success then
			DropItem("Dynamite Stick")
		end
	end
	if IsBattle() then monster:AddChangeItemAction(5) end
end

AddItemContextMenu("Dynamite Stick", "Combine", CombineDynamiteSticks, CanCombineDynamiteSticks)
AddItemContextMenu("Dynamite Stick 7", "Spilt", SpiltDynamiteSticks, CanUseItem)

local function CanStackAmmo(item)
	return	HUDState() ~= 5
		and not item:IsShopItem()
		and item:GetBulletCount() >= 1
		and GetCurrentMerc():HasItem(item)
		and not IsBattle()
end

local function CanStackAmmoInNumber(item,stackNumber)
	if not CanStackAmmo(item) then
		return false
	end
	local name = item:GetName()
	local items
	if IsItemInCar(item) then
		items = GetCarItems(name)
	else
		items = GetCurrentMerc():GetItems(name)
	end
	local found = 0
	for _, ammoitem in ipairs(items) do
		local count = ammoitem:GetBulletCount()
		if count ~= stackNumber
			and count >= 1 then
				found = found + 1
				if found > 1 then
					break
				end
		end
	end
	if found > 1 then
		return true
	end
	if found == 1
		and item:GetBulletCount() > stackNumber then
		return true
	end
	return false
end

local function StackAmmoInNumber(item,stackNumber)
	local name = item:GetName()
	local number = 0
	local monster = GetCurrentMerc()
	local items = monster:GetItems(name)
	for _, ammoitem in ipairs(items) do
		local count = ammoitem:GetBulletCount()
		if count >= 1
			and count ~= stackNumber then
				number = number + count
				monster:DeleteItem(ammoitem)
		end
	end
	while number > 0 do
		local newItem = CreateItem(name)
		newItem:SetBulletCount(math.floor(math.min(stackNumber,number)))
		local item_name, success = monster:AddItem(newItem)
		if not success then
			DropItem(newItem)
		end
		number = number - stackNumber
	end
end

function StackAmmoInFour(item)
	StackAmmoInNumber(item,4)
end

function StackAmmoInThree(item)
	StackAmmoInNumber(item,3)
end

function StackAmmoInSix(item)
	StackAmmoInNumber(item,6)
end

function StackAmmoAll(item)
	StackAmmoInNumber(item,100)
end

function CanStackAmmoInThree(item)
	return CanStackAmmoInNumber(item,3)
end

function CanStackAmmoInFour(item)
	return CanStackAmmoInNumber(item,4)
end

function CanStackAmmoInSix(item)
	return CanStackAmmoInNumber(item,6)
end

function CanStackAmmoAll(item)
	return CanStackAmmoInNumber(item,100)
end


AddItemContextMenu("M202A1 Grenade", "Stack In 4", StackAmmoInFour, CanStackAmmoInFour)
AddItemContextMenu("M202A1 Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)

AddItemContextMenu("VOG-T", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("VOG-25", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("VOG-25P", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("M407 Smoke", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("M397A1 HE", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("M406 HE", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("M433A1 HEDP", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("35mm HE", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("35mm Smoke", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("35mm AB", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("DFS-10 Smoke", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("DFS-10P", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("DFS-10 HE", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)
AddItemContextMenu("Pallad 40x47", "Stack In 6", StackAmmoInSix, CanStackAmmoInSix)

AddItemContextMenu("VOG-T", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("VOG-25", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("VOG-25P", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("M407 Smoke", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("M397A1 HE", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("M406 HE", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("M433A1 HEDP", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("35mm HE", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("35mm Smoke", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("35mm AB", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("DFS-10 Smoke", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("DFS-10P", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("DFS-10 HE", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("Pallad 40x47", "Stack All", StackAmmoAll, CanStackAmmoAll)

AddItemContextMenu("RPG-7 Grenade(pg-7ei)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(type69-3)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(ipg-60)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(pg-7pm)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(og-7ve)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(gtb-7vs)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(ipg-82)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(tbg-7v)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade 2", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-7 Grenade(ko-7v)", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-2 Grenade", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-2 Mortar 60", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-2 Mortar 82", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPG-18 Grenade", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("M72 LAW Grenade", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)
AddItemContextMenu("RPO-A Grenade", "Stack In 3", StackAmmoInThree, CanStackAmmoInThree)

AddItemContextMenu("RPG-7 Grenade(pg-7ei)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(type69-3)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(ipg-60)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(pg-7pm)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(og-7ve)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(gtb-7vs)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(ipg-82)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(tbg-7v)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade 2", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-7 Grenade(ko-7v)", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-2 Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-2 Mortar 60", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-2 Mortar 82", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPG-18 Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("M72 LAW Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)
AddItemContextMenu("RPO-A Grenade", "Stack All", StackAmmoAll, CanStackAmmoAll)

function RepairLeakyFuelCan(item)
	local monster = GetCurrentMerc()
	if not UseTape(monster) then
		return
	end
	item:ChangeItemType("Car_can20")
	item:SetCondition(0)
	if IsBattle() then monster:AddChangeItemAction(10) end
end

AddItemContextMenu("Car_can20_empty", _t"lang/lua/mines/repair", RepairLeakyFuelCan , CanUseItem)

local CookableFoodTable = {"Food_fish_c","Food_meat_c"}

function UnstackUncookedFood(item)
	local monster = GetCurrentMerc()
	for i = 1, #CookableFoodTable do
		local name = CookableFoodTable[i]
		local items = monster:GetItems(name)
		for _, food in ipairs(items) do
			local count = food:GetOtherData():GetStackSize()
			if count > 1 then
				monster:DeleteItem(food)
				for i = 1, count do
					local item_name, success = monster:AddItem(name)
					if not success then
						DropItem(name)
					end
				end
			end
		end
	end
end

function CanUnstackUncookedFood(item)
	if not CanUseItem(item)
		or IsBattle() then
		return false
	end
	local monster = GetCurrentMerc()
	for i = 1, #CookableFoodTable do
		local name = CookableFoodTable[i]
		local items = monster:GetItems(name)
		for _, food in ipairs(items) do
			local count = food:GetOtherData():GetStackSize()
			if count > 1 then
				return true
			end
		end
	end
end


AddItemContextMenu("Food_fish_c", "Unstack for Cooking", UnstackUncookedFood, CanUnstackUncookedFood)
AddItemContextMenu("Food_meat_c", "Unstack for Cooking", UnstackUncookedFood, CanUnstackUncookedFood)

-- end addition by gpgpgpgp
