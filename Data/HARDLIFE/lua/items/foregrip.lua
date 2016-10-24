 local WeponsWithForegrip = {
 ["Assault Rifle Colt Commando 933"] = "Assault Rifle Colt Commando 933 asalto",
 ["Assault Rifle M4A1 RIS (5.56mm)"] = "Assault Rifle M4A1 (5.56mm) asalto",
 ["Assault Rifle M16A3 (5.56mm)"] = "Assault Rifle M16A4 (5.56mm) asalto",
 ["Assault Rifle XM-15-E2S (5.56mm)"] = "Assault Rifle XM-15-E2S (5.56mm) asalto",
 ["Assault Rifle AR-15 CQB (.300 BLK)"] = "Assault Rifle AR-15 CQB AG (.300 BLK)",
 ["Assault Rifle M4A1 CQB (.300 BLK)"] = "Assault Rifle M4A1 CQB AG (.300 BLK)",
 ["Pistol Glock 17 (9mm)"] = "Pistol Glock 17 TB (9mm)",
 ["Pistol Glock 21 (.45 ACP)"] = "Pistol Glock 21 TB (.45 ACP)",
 ["Pistol Glock 22 (.40 S&W)"] = "Pistol Glock 22 TB (.40 S&W)",
 ["Pistol Taurus PT100 (.40 S&W)"] = "Pistol Taurus PT100 TB (.40 S&W)",
}

-- ��������� ��� �������� ������ ����������� ��������
function CanDetachForegrip(item)
	if HUDState() ~= 5 then
		for key, value in pairs(WeponsWithForegrip) do
			if value == item:GetName() then	return true end
		end
	end
	return false
end

function DetachForegrip(item)
	local similar_item
	local monster = GetCurrentMerc()
	for key, value in pairs(WeponsWithForegrip) do
		if value == item:GetName() then
			similar_item = key
			break
		end
	end

	if similar_item ~= nil then
		item:ChangeItemType(similar_item)
		item_name, success = monster:AddItem("Tactical grip")
		if not success then DropItem("Tactical grip") end
		monster:AddChangeItemAction(2)
	else
		monster:Say(_t"lang/lua/fptb/cant_detach_handle")
	end
end

function AttachForegrip(itemAttach, itemWeapon)
	local monster = GetCurrentMerc()
	local similar_item = WeponsWithForegrip[itemWeapon:GetName()]
	if (similar_item ~= nil and HUDState() ~= 5) then
		itemWeapon:ChangeItemType(similar_item)
		monster:AddChangeItemAction(2)
        	return itemWeapon, true
	end
	return nil
end

function AttachStock(itemAttach, itemWeapon)
	local monster = GetCurrentMerc()
	if HUDState() ~= 5 and GetAddon(itemWeapon, adStock) == nil then
		if monster:GetHands() == itemWeapon then
			monster:RiseButt()
			monster:AddChangeItemAction(2)
	        	return itemWeapon, true
		else
			monster:Say(_t'lang/lua/fptb/need_to_handle_weapon')
		end
	end
	return nil
end

-- ������ ��� ����� ����������� ������� �� �������
local Pistols4Barrels = {
["Pistol Glock 17 TB (9mm)"] = "Glock-17 threaded barrel",
["Pistol Glock 21 TB (.45 ACP)"] ="Glock-21 threaded barrel",
["Pistol Glock 22 TB (.40 S&W)"] = "Glock-22 threaded barrel", 
["Pistol Taurus PT100 TB (.40 S&W)"] = "Taurus PT100 threaded barrel", 
}

function CanDetachPistolTB(item)
	if HUDState() ~= 5 then
		for key, value in pairs(WeponsWithForegrip) do
			if value == item:GetName() then	return true end
		end
	end
	return false
end

function DetachPistolTB(item)
	local similar_pistol
	local monster = GetCurrentMerc()
	for key, value in pairs(WeponsWithForegrip) do
		if value == item:GetName() then
			similar_pistol = key
			break
		end
	end
	local tactical_barrel
	for key, value in pairs(Pistols4Barrels) do
		if key == item:GetName() then
			tactical_barrel = value
			break
		end
	end
	local condition = item:GetCondition()
	if similar_pistol ~= nil then
		if tactical_barrel ~= nil then
			local silencer = item:RemoveAddon(AddonTypes.adSilencer)
			if silencer ~= nil then DropItem(silencer) end
			item:ChangeItemType(similar_pistol)
			local barrel_result = CreateItem(tactical_barrel)
			barrel_result:SetCondition(condition)
			item_name, success = monster:AddItem(barrel_result)
			if not success then DropItem(barrel_result) end
				monster:AddChangeItemAction(5)
		else
				monster:Say(_t"lang/lua/fptb/no_matching_barrel")
		end
	else
		monster:Say(_t"lang/lua/fptb/cant_detach_barrel")
	end
end


-- ����� ������ ��� ����������� ��������� ���������
AddItemCombineHandler("Glock-17 threaded barrel", "Pistol Glock 17 (9mm)", AttachForegrip)
AddItemCombineHandler("Glock-21 threaded barrel", "Pistol Glock 21 (.45 ACP)", AttachForegrip)
AddItemCombineHandler("Glock-22 threaded barrel", "Pistol Glock 22 (.40 S&W)", AttachForegrip)
AddItemCombineHandler("Taurus PT100 threaded barrel", "Pistol Taurus PT100 (.40 S&W)", AttachForegrip)

local action_detach_barrel = _t"lang/lua/fptb/detach_barrel"

AddItemContextMenu("Pistol Glock 17 TB (9mm)", action_detach_barrel, DetachPistolTB, CanDetachPistolTB)
AddItemContextMenu("Pistol Glock 21 TB (.45 ACP)", action_detach_barrel, DetachPistolTB, CanDetachPistolTB)
AddItemContextMenu("Pistol Glock 22 TB (.40 S&W)", action_detach_barrel, DetachPistolTB, CanDetachPistolTB)
AddItemContextMenu("Pistol Taurus PT100 TB (.40 S&W)", action_detach_barrel, DetachPistolTB, CanDetachPistolTB)

-- ��������� ����������� ��������
AddItemCombineHandler("Tactical grip", "Assault Rifle Colt Commando 933", AttachForegrip)
AddItemCombineHandler("Tactical grip", "Assault Rifle M4A1 RIS (5.56mm)", AttachForegrip)
AddItemCombineHandler("Tactical grip", "Assault Rifle M16A3 (5.56mm)", AttachForegrip)
AddItemCombineHandler("Tactical grip", "Assault Rifle XM-15-E2S (5.56mm)", AttachForegrip)
AddItemCombineHandler("Tactical grip", "Assault Rifle AR-15 CQB (.300 BLK)", AttachForegrip)
AddItemCombineHandler("Tactical grip", "Assault Rifle M4A1 CQB (.300 BLK)", AttachForegrip)
AddItemCombineHandler("APS Belt", "Pistol APS (9x18mm) folded", AttachStock)
AddItemCombineHandler("Mauser Belt", "Pistol M712 (7.62x25mm) folded", AttachStock)
AddItemCombineHandler("Mauser Belt", "Pistol Astra 900 (Largo) folded", AttachStock)

local action_detach_handle = _t"lang/lua/fptb/detach_handle"

AddItemContextMenu("Assault Rifle Colt Commando 933 asalto", action_detach_handle, DetachForegrip, CanDetachForegrip)
AddItemContextMenu("Assault Rifle M4A1 (5.56mm) asalto", action_detach_handle, DetachForegrip, CanDetachForegrip)
AddItemContextMenu("Assault Rifle M16A4 (5.56mm) asalto", action_detach_handle, DetachForegrip, CanDetachForegrip)
AddItemContextMenu("Assault Rifle XM-15-E2S (5.56mm) asalto", action_detach_handle, DetachForegrip, CanDetachForegrip)
AddItemContextMenu("Assault Rifle AR-15 CQB AG (.300 BLK)", action_detach_handle, DetachForegrip, CanDetachForegrip)
AddItemContextMenu("Assault Rifle M4A1 CQB AG (.300 BLK)", action_detach_handle, DetachForegrip, CanDetachForegrip)