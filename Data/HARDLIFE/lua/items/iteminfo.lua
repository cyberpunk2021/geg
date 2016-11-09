
local PlugTypeToWeaponMap = {}
local WeaponToSilencerMap = {}
local UpgradesDescriptions = {}

function GetStdPlug(item, itemFamily)
	local plugs = item:GetStdPlugs()
	if plugs == nil then return nil end
	for _,plug in ipairs(plugs) do




		if (plug:GetFamily() == itemFamily) then
			return plug
		end

	end
	return nil
end

function GetClipRounds(item)
	local clip = GetStdPlug(item, Family.ifClip)

    if clip ~= nil then
        local clipInfo = clip:GetSpecificInfo()
        if clipInfo then
            local clip_rounds = clipInfo["Rounds"]
            if clip_rounds > 0 then
                return clip_rounds
            end
        end
    end
	return nil
end

function GetEffectiveRange(item)
	local weaponInfo = item:GetInfo():GetSpecificInfo()
	if weaponInfo then
		local range = weaponInfo["EffectiveRange"]
		if range > 0 then
			return range
		end
	end
	return nil
end

function GetSingleFireRate(item)
	local weaponInfo = item:GetInfo():GetSpecificInfo()
	if weaponInfo then
		local fire_time = weaponInfo["SingleFireTime"]
		if fire_time > 0 then
			return math.floor(60/fire_time)
		end
	end
	return nil
end

function GetBurstFireRate(item)
	local weaponInfo = item:GetInfo():GetSpecificInfo()
	if weaponInfo and weaponInfo["Burst"] then
		local fire_time = weaponInfo["BurstFireTime"]
		if fire_time > 0 then
			return math.floor(60/fire_time)
		end
	end
	return nil
end

function GetHeatCapacity(item)
	local weaponInfo = item:GetInfo():GetSpecificInfo()
	if weaponInfo then
		local heat_capacity = weaponInfo["HeatCapacity"]
		if heat_capacity >= 0 then
			return heat_capacity
		end
	end
	return nil
end

function GetBirstHitStart(item)
	local weaponInfo = item:GetInfo():GetSpecificInfo()
	if weaponInfo then
		local hit = weaponInfo["BurstHitStart"]
		if hit >= 0 then
			return hit
		end
	end
	return nil
end

function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function GetMisfireProb(item)
    local weaponInfo = item:GetInfo():GetSpecificInfo()
    if weaponInfo then
        local prob = 100*weaponInfo["MisfireProb"]
        if prob >= 0 then
            return round(prob, 5)
        end
    end
    return nil
end


local function formatTime(time)
    local result = {}

    if time >= 86400 then
        local days = math.floor(time / 86400)
        table.insert(result, days .. _t"lang/lua/iteminfo/tm/days")
        time = time - days * 86400
    end

    if time >= 3600 then
        local hours = math.floor(time / 3600)
        table.insert(result, hours .. _t"lang/lua/iteminfo/tm/hours")
        time = time - hours * 3600
    end

    if time >= 60 then
        local minutes = math.floor(time / 60)
        table.insert(result, minutes .. _t"lang/lua/iteminfo/tm/min")
        time = time - minutes * 60
    end

    if time > 0 then
        table.insert(result, time .. _t"lang/lua/iteminfo/tm/sec")
    end
    result = table.concat(result, " ")
    return result
end

local function GetSupportedSilencerNames(itemInfo)
end

local function buildItemInfo(item)
	local result = {}
	local itemInfo = item:GetInfo()
    local family = itemInfo:GetFamily()
    local function show(text)
        table.insert(result, text)
    end


    if itemInfo:GetName() == "Nails_box" then
        show(string.format(_t"lang/lua/iteminfo/nails_left", GetNailsInBox(item)))
        show(true)
	elseif family == Family.ifWeapon then
        local tradeSkill = GetCurrentMerc():GetSkill(Skills.skTrade)
        local extInfo = ""
        if tradeSkill >= 60 then
            extInfo = " [" .. tostring(item:GetLevel()) .. "] " .. string.format("%d", item:GetINIPrice()) .. _t"lang/lua/iteminfo/eldo_suffix"
        elseif tradeSkill >= 25 then
            extInfo = " [" .. tostring(item:GetLevel()) .. "]"
        end

        show((itemInfo:GetRealName() or _t"lang/lua/iteminfo/item_name_unknown") .. extInfo)
        show(_t"lang/lua/iteminfo/caliber" .. (itemInfo:GetCaliber() or "-"))
        show(_t"lang/lua/iteminfo/clip_rounds" .. (GetClipRounds(item) or "-"))
        show(_t"lang/lua/iteminfo/effective_range" .. (GetEffectiveRange(item) or "-"))
        show(_t"lang/lua/iteminfo/fire_rate" .. (GetSingleFireRate(item) or "-"))
		local burst_rate = GetBurstFireRate(item)
		if(burst_rate) then
            if(GetClipRounds(item) == 2) then
                show(_t"lang/lua/iteminfo/doublet")
            else
                show(_t"lang/lua/iteminfo/burst_rate" .. (burst_rate or "-"))
            end
        end
        show(_t"lang/lua/iteminfo/heat_capacity" .. (GetHeatCapacity(item) or "-"))
        show(string.format(_t"lang/lua/iteminfo/burst_hit_start", GetBirstHitStart(item) or "-"))
        show(string.format(_t"lang/lua/iteminfo/misfire_prob", GetMisfireProb(item) or "-"))
-- информация об апгрейдах оружия:
        local upgrades = item:GetUpgrades()
        if #upgrades > 0 then
            show(_t"lang/lua/iteminfo/upgrades")
            for _, upgrade in ipairs(upgrades) do
                show("  - " .. upgrade.desc)
            end
        end
        show("")
        show(true)

        local silencerList = WeaponToSilencerMap[itemInfo:GetID()]
        if silencerList ~= nil and #silencerList > 0 then
            show("")
            show(_t"lang/lua/iteminfo/compatible_silencers")
            for _,silencerName in ipairs(silencerList) do
                show("  - " .. silencerName)
            end
        end


	elseif family == Family.ifAddon and itemInfo:GetAddonType() == AddonTypes.adSilencer then
        show(true)

        local list = PlugTypeToWeaponMap[itemInfo:GetPlugType()]
        if list and #list > 0 then
            show("")
            show(_t"lang/lua/iteminfo/compatible_weapons")
            for _,weaponName in ipairs(list) do
                show("  - " .. weaponName)
            end

        end
    elseif family == Family.ifOther and (itemInfo:GetOtherInfo():GetOtherType() == OtherItemTypes.oitUniform or itemInfo:GetOtherInfo():GetOtherType() == OtherItemTypes.oitCamouflage) then
        local otherInfo = itemInfo:GetSpecificInfo()
        if otherInfo["camouflage"] then
            show(_t"lang/lua/iteminfo/camouflage")
            show(_t"lang/lua/iteminfo/camouflage/city" .. string.format("%d%%", otherInfo["camouflage"]["urban"] * 100))
            show(_t"lang/lua/iteminfo/camouflage/jung" .. string.format("%d%%", otherInfo["camouflage"]["jungle"] * 100))

            if itemInfo:GetOtherInfo():GetOtherType() == OtherItemTypes.oitCamouflage then
                FillCamouflageInfo(item, show)
            end

        else
            show(_t"lang/lua/iteminfo/camouflage/invalid")
        end

        show(true)
    elseif family == Family.ifHeadArmour then
        local info = itemInfo:GetSpecificInfo()
        if info["camouflage"] then
            show(_t"lang/lua/iteminfo/camouflage")
            show(_t"lang/lua/iteminfo/camouflage/city" .. string.format("%d%%", info["camouflage"]["urban"] * 100))
            show(_t"lang/lua/iteminfo/camouflage/jung" .. string.format("%d%%", info["camouflage"]["jungle"] * 100))
        else
            show(_t"lang/lua/iteminfo/camouflage/invalid")
        end

        show(true)
    elseif family == Family.ifOther and itemInfo:GetOtherInfo():GetOtherType() == OtherItemTypes.oitMedikit then
        local otherInfo = itemInfo:GetSpecificInfo()
        --local CureSpeed = otherInfo["CureSpeed"]
        local Energy = otherInfo["Energy"]
        local ADuration = otherInfo["ADuration"] -- адреналин/боль/шок
        local Usages = otherInfo["Usages"]
        local HealsDamages = otherInfo["HealsDamages"] -- лечит травмы

        if Usages > 0 then
            show(string.format(_t"lang/lua/iteminfo/used_to", math.ceil(item:GetOtherData():GetUsages()), Usages))
        end
        if ADuration > 0 then
            show(_t"lang/lua/iteminfo/lower_adrenaline" .. formatTime(ADuration))
        end
        if HealsDamages then
            show(_t"lang/lua/iteminfo/heals_injury")
        end
        if Energy > 0 then
            show(_t"lang/lua/iteminfo/replenish_energy")
        end


        if #result > 0 then
            show("") -- вставим отступ, если хоть какая-то инфа показана
        end

        show(true)
    elseif family == Family.ifAmmo then
        show(true)
        local misfireProb = itemInfo:GetMisfireProb()
        if misfireProb > 0 then
            show(_t"lang/lua/iteminfo/quality" .. string.format("%.1f%%", 100 - misfireProb * 100))
        else
            show(_t"lang/lua/iteminfo/quality/100")
        end
    else
		local owner_name = GetItemOwnerName(item)
		if (owner_name~="") then
            show(_t"lang/lua/iteminfo/owner" .. GetItemOwnerName(item))
        end
        show(true)
	end
	return result
end


local function tablePush(tbl, index, itemName)
    local list = tbl[index] or {}
    if #list == 0 then
        tbl[index] = list
    end
    for _,name in ipairs(list) do -- фильтруем от повторений (бывают у разных предметов одинаковые имена)
        if name == itemName then return end
    end

    table.insert(list, itemName)
end

local function buildItemSpecificInfo()
    local items = Engine.GetAllItems()
    local maxPlugIndex = Engine.PlugTypesCount(AddonTypes.adSilencer) - 1
    local builtInIndex = Engine.BuiltInPlugType(AddonTypes.adSilencer)

    local plugTypeSilencers = {}
    for _,item in ipairs(items) do
        -- also ignoring built-in (0)
        if item:GetFamily() == Family.ifAddon and item:GetAddonType() == AddonTypes.adSilencer and not item:IsBuiltIn() then
            tablePush(plugTypeSilencers, item:GetPlugType(), item:GetRealName() .. string.format(" (%.0f%%)", item:GetSilencingValue() * 100))
        end
    end

    for _,item in ipairs(items) do
        local family = item:GetFamily()
        if family == Family.ifWeapon then
            local info = item:GetSpecificInfo()
            for i = 0, maxPlugIndex do
                if i ~= builtInIndex and item:CanPlugAddon(AddonTypes.adSilencer, i) then
                    -- if weapon unfolded
                    if info["FoldButtItem"] == info["RiseButtItem"] or info["FoldButtItem"] ~= nil then
                        tablePush(PlugTypeToWeaponMap, i, item:GetRealName())
                    end

                    local list = plugTypeSilencers[i] or {}
                    for _,silencer in ipairs(list) do
                        tablePush(WeaponToSilencerMap, item:GetID(), silencer)
                    end
                end
            end
        end
    end
    for i = 0, maxPlugIndex do
        local source = PlugTypeToWeaponMap[i]
        if source then
            PlugTypeToWeaponMap[i] = Util.SortTableOfStrings(source)
        end
    end

    for id,list in pairs(WeaponToSilencerMap) do
        WeaponToSilencerMap[id] = Util.SortTableOfStrings(list)
    end
end

local function SetItemHint(cmd, value)
    local monster = GetCurrentMerc()
    local item = monster:GetHands()
    if item ~= nil then
        item:SetHint(value or "")
    end
end

buildItemSpecificInfo()

RegisterItemInfoBuildHandler(buildItemInfo)
