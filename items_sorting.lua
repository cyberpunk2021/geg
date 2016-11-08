--
-- Created by IntelliJ IDEA.
-- User: Xelat
-- Date: 29.08.2016
-- Time: 1:59
--

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

local ifWeapon = 0
local ifBodyArmour = 1
local ifHeadArmour = 2
local ifFaceArmour = 3
local ifSlotArmour = 4
local ifAmmo = 6
local ifClip = 7
local ifAddon = 8
local ifMine = 9
local ifOther = 10
local ifKey = 12


local family_priority =
{
    [ifWeapon] = 0,
    [ifAmmo] = 1,
    [ifClip] = 1,
    [ifAddon] = 2,
    [ifBodyArmour] = 5,
    [ifHeadArmour] = 4,
    [ifFaceArmour] = 3,
    [ifSlotArmour] = 6,
    [ifMine] = 7,
    [ifOther] = 8,
    [ifKey] = 9,
}

local WCP =
{
    [wcPistol] = 0,
    [wcShotgun] = 1,
    [wcSMG] = 2,
    [wcRifle] = 3,
    [wcSniper] = 4,
    [wcMachinegun] = 5,
    [wcLauncher] = 6,
    [wcGrenade] = 7,
    [wcOther] = 8,
    [wcNone] = 9,
}

local function compare_items(a, b)
    local fa = family_priority[a.family]
    local fb = family_priority[b.family]
    if fa ~= fb then
        return fa < fb
    end

    if a.family == ifWeapon then
        if a.class ~= b.class then
            return WCP[a.class] < WCP[b.class]
        end
    end
    if a.family == ifAddon or a.family == ifOther then
        if a.class ~= b.class then
            return a.class < b.class
        end
    end
    if a.family == ifWeapon or a.family == ifAmmo or a.family == ifClip then
        if a.caliber ~= b.caliber then
            return a.caliber < b.caliber
        end
    end
    if a.family == ifWeapon then
        if a.range ~= b.range then
            return a.range < b.range
        end
    end
    if a.family == ifAddon or a.family == ifClip and b.family ~= ifAmmo then
        if a.plug ~= b.plug then
            return a.plug < b.plug
        end
    end
    return a.name < b.name
end

SetItemSortingFunction(compare_items)