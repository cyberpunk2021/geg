--
-- Created by IntelliJ IDEA.
-- User: Xelat
-- Date: 08.11.13
-- Time: 5:08
-- To change this template use File | Settings | File Templates.
--

local wcPistol = 1

local LargeBoxes = {
    "Box_Med_Supplies",
    "Box_Explosives",
    "Box_Ammunition"
}
local WeaponCases = {
    "Case_Soft_Skin",
    "Case_Soft_Fabric",
    "Case_Soft_Camo",
    "Case_Hard_Medium",
    "Case_Hard_Big",
    "Case_Hard_Aluminium",
    "Case_Soft_Small",
    "Case_Hard_Small",
    "Case_Guitar"
}
local SmallBags = {
    "TouristBag",
    "Portfel",
    "tool3"
}

local function ExtractItem(containerItem, item)
    local item = containerItem:GetContainer():RemoveItem(item)
    if HUDState() == HUDType.hsShop then
        item:CreateTradeInfo()
    end
    return item
end

local function getExtractHandler(item)
    return function (containerItem)
        local result = ExtractItem(containerItem, item)
        return result
    end
end

local function BoxMenu(item)
    local items = item:GetContainer():GetItems()
    local map = {}
    local takeString = _t"lang/lua/boxes/take"
    for _,item in ipairs(items) do
        local itemID = item:GetID()
        if map[itemID] == nil then
            map[itemID] = true
            AddTempItemContextMenu(takeString .. " " .. item:GetRealName(), getExtractHandler(item))	-- edited by gpgpgpgp
        end
    end
end

local function RegisterList(list)
    for _,caseName in ipairs(list) do
        OnItemContextMenu(caseName, BoxMenu)
    end
end

local function PutItemToBox(item, boxItem)
    local copy = item:Copy()
    local result = boxItem:GetContainer():AddItem(copy)
    if result then
        return boxItem, true
    else
        copy:Delete()
    end

    return nil, false
end

local function BindList(itemName, list)
    for _,caseName in ipairs(list) do
        AddItemCombineHandler(itemName, caseName, PutItemToBox)
    end
end

local function registerBoxItems()
    local items = Engine.GetAllItems()
    for _,item in ipairs(items) do
        local family = item:GetFamily()
        local itemName = item:GetName()
        if item:IsGrenade() or family == Family.ifMine then
            AddItemCombineHandler(itemName, "Box_Explosives", PutItemToBox)
            BindList(itemName, WeaponCases)
        elseif family == Family.ifAmmo or family == Family.ifClip then
            AddItemCombineHandler(itemName, "Box_Ammunition", PutItemToBox)
            BindList(itemName, WeaponCases)
            BindList(itemName, SmallBags)
        elseif family == Family.ifOther then
            if item:GetOtherInfo():GetOtherType() == OtherItemTypes.oitMedikit then
                AddItemCombineHandler(itemName, "Box_Med_Supplies", PutItemToBox)
            end
            if item:GetWeight() <= 50 then
                BindList(itemName, SmallBags)
            end
        elseif family == Family.ifWeapon or family == Family.ifAddon then
            local info = item:GetSpecificInfo()
            if family == Family.ifWeapon and info.Class == wcPistol then
                BindList(itemName, SmallBags)
            end
            BindList(itemName, WeaponCases)
        end

    end

end

RegisterList(LargeBoxes)
RegisterList(WeaponCases)
RegisterList(SmallBags)


-- added by gpgpgpgp
local AdditionalContainers = {
    "Box_Wood_Empty",
	"Sack"
}
local Carriers = {
	"Tactical Vest",
	"Razgr_molle",
	"Razgr_smerch",
	"VestNew",
	"Ammo Cartouche6",
	"Ammo CartoucheVert",
	"Ammo Cartouche",
	"Ammo Belt",
	"Basic Belt",
	"Belt_01",
	"Belt_02",
	"Belt_03",
	"Belt_04",
	"Tactical Belt",
	"Backpack",
	"Backpack_reid",
	"Backpack_tactic",
	"Backpack_tourist"
}
RegisterList(AdditionalContainers)
local function BoxMenuContainerHUDOnly(item)
	if HUDState() == 5 then
		local items = item:GetContainer():GetItems()
		local map = {}
		local takeString = _t"lang/lua/boxes/take"
		for _,item in ipairs(items) do
			local itemID = item:GetID()
			if map[itemID] == nil then
				map[itemID] = true
				AddTempItemContextMenu(takeString .. " " .. item:GetRealName(), getExtractHandler(item))	-- edited by gpgpgpgp
			end
		end
	end
end
local function RegisterListShopOnly(list)
    for _,caseName in ipairs(list) do
        OnItemContextMenu(caseName, BoxMenuContainerHUDOnly)
    end
end
RegisterListShopOnly(Carriers)

registerBoxItems()