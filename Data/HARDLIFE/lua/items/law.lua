local wcNone = 0
local wcPistol = 1
local wcSMG = 2
local wcSniper = 3
local wcShotgun = 4
local wcRifle = 5
local wcMachinegun = 6
local wcGrenade = 7
local wcLauncher = 8
local wcOther = 9

local ammoAirsoft = "6 mm Airsoft pellets"
local ammoLongRifle = ".22LR"

LawType = {
    Toy         = 0,
    Civilian    = 1,
    Hunter      = 2,
    Police      = 3,
    Military    = 4,
    Special     = 5,
    Unlegal     = 6
}
LawTypeLabels = {
    [0] = _t"lang/lua/law/labels/0",
    [1] = _t"lang/lua/law/labels/1",
    [2] = _t"lang/lua/law/labels/2",
    [3] = _t"lang/lua/law/labels/3",
    [4] = _t"lang/lua/law/labels/4",
    [5] = _t"lang/lua/law/labels/5",
    [6] = _t"lang/lua/law/labels/6"
}
local LawTable = {} -- таблица соответствия ID оружия = Тип

local function addLawType(itemID, typeID, check)
    check = check or false
    if check and LawTable[itemID] ~= nil then
        Log("Item " .. itemName .. " has collision in weapon law")
    else
        LawTable[itemID] = typeID
    end
end

-- What kind of weapon is by it's caracteristics
function buildItemLawType(item)	
    local family = item:GetFamily()
    local info = item:GetSpecificInfo()
	if family == Family.ifMine then
		return LawType.Military
	end

    if family == Family.ifWeapon then
        local clip_capacity = 0
        local stdPlugList = info["StdPlug"]
        if stdPlugList ~= nil then
            for _,plugName in ipairs(stdPlugList) do
                local plugItem = GetItem(plugName)
                local plugFamily = plugItem:GetFamily()
                if plugFamily == Family.ifAddon then
                    local addonType = plugItem:GetAddonType()
                    if addonType == AddonTypes.adSilencer and plugItem:IsBuiltIn() then
                        return LawType.Special -- только если неснимаемый глушак
                    end
                elseif plugFamily == Family.ifClip then
                    local plugInfo = plugItem:GetSpecificInfo()
                    clip_capacity = plugInfo["Rounds"]
                end
            end
        end
        local weaponClass = info["Class"]	--If it's a greanade: Military
		if item:IsGrenade() then
            return LawType.Military
        end
		
		-- If it have burst mode and isn't a smg or a pistol: Military
        if ((info["Burst"]) and (weaponClass ~= wcSMG and weaponClass ~= wcPistol)) then -- автоматическое оружие (постоянный параметр)
            return LawType.Military
        end
		-- If it's a shotgun and have a clip: Police
		if (weaponClass == wcShotgun and plugFamily == Family.ifClip and plugItem:IsBuiltIn() == false) then
            return LawType.Police
        end
		-- If it have burst mode and is a smg or a pistol: Police
        if ((info["Burst"]) and (weaponClass == wcSMG or weaponClass == wcPistol)) then -- Law.Police по признаку наличия складного приклада (постоянный параметр)
            return LawType.Police
        end		
		-- If isn't a pistol or is a shotgun whit more than 5 shells: Hunting
        if ((weaponClass ~= wcPistol) or (weaponClass == wcShotgun and clip_capacity > 5)) then
          return LawType.Hunter 
        end
		-- If it's a shotgun and have equal or less than 5 shells: Civilian
		if (weaponClass == wcShotgun and clip_capacity <= 5) then
          return LawType.Civilian
        end
		
	-- If it have a silencer: Special
    elseif family == Family.ifAddon then
        if item:GetAddonType() == AddonTypes.adSilencer then
            return LawType.Special
        end
	
    elseif family == Family.ifClip then
        if info["PlugType"] ~= 1 then -- избегаем проверки пачек патронов
            -- If uses airsoft ammo: Toy	
			if info["DefaultAmmo"] == ammoAirsoft then
                return LawType.Toy
            end
			-- If uses 22LR ammo: Civilian (I believe this don't work properly)
			if info["DefaultAmmo"] == ammoLongRifle then
                return LawType.Civilian
            end
        end
    elseif family == Family.ifAmmo then
    end
    return LawType.Civilian
end

function loadLawData()
    -- пробежимся по всем предметам в игре, и составим на основе базовых характеристик карту типов

    local items = Engine.GetAllItems()
    for _,item in ipairs(items) do
        local itemID = item:GetID()
        local typeID = buildItemLawType(item)
        LawTable[itemID] = typeID
    end

    -- теперь выгрузим из конфига исключительные типы, они затрут уже имеющиеся значения в таблице

    local config = Config("Config") -- lol :D

    for typeName, typeID in pairs(LawType) do
        local list = config:XPath("/root/NeedCheckInTown/" .. typeName .. "/item")
        for i = 1, #list do
            local itemName = tostring(list[i])
            local item = GetItem(itemName)
            if item ~= nil then
                local itemID = item:GetID()
                addLawType(itemID, typeID, false)
            else
                Log("Item " .. itemName .. " not found in game database")
            end
        end
        --list:close()
    end
    
    config:close()
end

function GetLawStrForItem(item)
    local typeID = GetLawForItem(item)
    return LawTypeLabels[typeID] or ""
end


-- How it's seeing the tipe of weapon by the laws
function GetLawForItem(item)
    if item == nil then return nil end
	local itemInfo = item:GetInfo()
    local typeID = LawTable[itemInfo:GetID()]
    local family = itemInfo:GetFamily()

    if typeID == LawType.Toy then return typeID end
	
	

	-- теперь проверяем, может ли что-то перезатереть этот тип
	-- SILENCED WEAPONS
    if typeID <= LawType.Special then -- динамическая проверка на принадлежность к специальным
        if family == Family.ifWeapon then
            local addons = item:GetAddons()
            for _,addon in ipairs(addons) do
                if addon:GetAddonType() == AddonTypes.adSilencer then -- наличие ПБС (динамический параметр)
                    return LawType.Special
                end
            end
        end
    end
	-- MILITARY WEAPONS
    if typeID == LawType.Military then
        if family == Family.ifWeapon then
            local info = itemInfo:GetSpecificInfo()
            -- бывают апдейты, которые добавляют режим очереди
            if ((info["Burst"]) and (info["Class"] ~= wcSMG and info["Class"] ~= wcPistol)) then
                return LawType.Military
            end
			
        end
        -- то, что может в динамике переквалифицировать оружие до военного
        --todo сделать проверку на ящики гранат и т.п., вобщем на содержимое контейнеров
    end
	-- SERVICE OR POLICE WEAPONS
    if typeID == LawType.Police then
        if family == Family.ifWeapon then		
            local clip = item:GetClip()
            if clip ~= nil then
                local info = itemInfo:GetSpecificInfo()
                local clipInfo = clip:GetInfo():GetSpecificInfo()
                local clip_capacity = clipInfo["Rounds"]
				
				if ((info["Burst"]) and (info["Class"] == wcSMG or info["Class"] == wcPistol) or (weaponClass == wcShotgun and (plugFamily == Family.ifClip and plugItem:IsBuiltIn() == false))) then -- Law.Police по признаку наличия складного приклада (постоянный параметр)
					return LawType.Police
				end
            end
        end
    end
	-- HUNTING SHOTGUNS
    if typeID == LawType.Hunter then
        if family == Family.ifWeapon then
            local clip = item:GetClip()
            if clip ~= nil then
                local info = itemInfo:GetSpecificInfo()
                local clipInfo = clip:GetInfo():GetSpecificInfo()
                local weaponClass = info["Class"]
                local clip_capacity = clipInfo["Rounds"]
                if ((info["Class"] ~= wcPistol) and (info["Class"] == wcShotgun and clip_capacity > 5)) then
                    return LawType.Hunter
                end
            end
        end
    end	 
	-- CIVIL SHOTGUNS
	if typeID == LawType.Hunter then
        if family == Family.ifWeapon then
            local clip = item:GetClip()
            if clip ~= nil then
                local info = itemInfo:GetSpecificInfo()
                local clipInfo = clip:GetInfo():GetSpecificInfo()
                local weaponClass = info["Class"]
                local clip_capacity = clipInfo["Rounds"]
                if ((info["Class"] ~= wcPistol) and (info["Class"] == wcShotgun and clip_capacity <= 5)) then
                    return LawType.Civilian
                end
            end
        end
    end	 
	-- GRENADE LAUNCHERS
	if typeID == LawType.Hunter then  
		if family == Family.ifWeapon then
            local info = itemInfo:GetSpecificInfo()
            if (info["Class"] == wcMachinegun) then
				return LawType.Military					
            end
        end    
    end
    return typeID
end

function GetLawForItemName(item_name)
  if item == "" then return "" end
  local itemInfo = GetItem(item_name)
  return LawTable[itemInfo:GetID()]
end


loadLawData()

RegisterItemLawStringHandler(GetLawStrForItem)