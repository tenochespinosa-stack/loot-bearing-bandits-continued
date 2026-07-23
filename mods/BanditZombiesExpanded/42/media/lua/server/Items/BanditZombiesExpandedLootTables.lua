-- This only file contains some code from Handlebar, all credit to him.
function LBagLoot(zombie)
    if not zombie:getOutfitName() then return end
    local outfit = tostring(zombie:getOutfitName())

    local potentialloot = {
        "WaterBottleFull",
        "DehydratedMeatStick",
        "BeefJerky",
        "CleaningKit",
        "Apple",
        "CannedSardines",
        "Rope",
        "Bandage",
        "DuctTape",
        "CannedCornedBeef",
        "JamFruit",
        "Matches",
        "Lighter",
        "Antibiotics",
        "Battery",
        "NailsBox",
        "Glue",
        "Woodglue",
        "CannedTuna",
        "CannedBeans",
        "Bread",
        "GranolaBar",
        "AlcoholWipes",
        "SutureNeedle",
        "Painkillers",
        "Soap",
    }
    local loseBulletChance = 50
    local ammoBoxChance = 20
    local magazineChance = 40

    local bulletList = {}
    local ammoBoxList = {}
    local magazineList = {}

    local loseBulletRolls = 8
    local ammoBoxRolls = 3
    local magazineRolls = 2

    local inv = zombie:getInventory()
    if not inv then return end
    local attachedWeapons = zombie:getAttachedItems()
    if not attachedWeapons then return end
    local weaponsNum = attachedWeapons:size()
    local backpackinv = nil

    local invItems = inv:getItems()
    if invItems then
        for i = 0, invItems:size()-1 do
            local itemBackpack = invItems:get(i)
            if itemBackpack and itemBackpack:getCategory() == "Container" and zombie:isEquipped(itemBackpack) then
                backpackinv = itemBackpack:getInventory()
            end
        end
    end

    if outfit == "L_BanditENH" then
        for i=0, weaponsNum - 1 do
            local item = attachedWeapons:getItemByIndex(i)
            if item and instanceof(item, "HandWeapon") and item:isRanged() then
                -- B42: getAmmoType() returns an AmmoType object (use getItemKey());
                -- getAmmoBox() and getMagazineType() remain plain strings.
                local ammoTypeObj = item:getAmmoType()
                local box = item:getAmmoBox()
                local mag = item:getMagazineType()
                if ammoTypeObj then
                    local bullet = type(ammoTypeObj) == "string" and ammoTypeObj or ammoTypeObj:getItemKey()
                    if bullet and bullet ~= "" then table.insert(bulletList, bullet) end
                end
                if box and box ~= "" then table.insert(ammoBoxList, box) end
                if mag and mag ~= "" then table.insert(magazineList, mag) end
            end
        end

        for i, v in ipairs(bulletList) do
            for j = 1, loseBulletRolls do
                if loseBulletChance >= ZombRand(1, 100) then
                    inv:AddItem(v)
                end
            end
        end

        for i, v in ipairs(ammoBoxList) do
            for j = 1, ammoBoxRolls do
                if ammoBoxChance >= ZombRand(1, 100) then
                    if backpackinv then
                        backpackinv:AddItem(v)
                    else
                        inv:AddItem(v)
                    end
                end
            end
        end

        for i, v in ipairs(magazineList) do
            for j = 1, magazineRolls do
                if magazineChance >= ZombRand(1, 100) then
                    local magItem = inv:AddItem(v)
                    if magItem then
                        local maxAmmo = magItem:getMaxAmmo()
                        if maxAmmo > 0 then
                            -- ZombRand upper bound is exclusive; +1 so a full magazine is possible
                            magItem:setCurrentAmmoCount(ZombRand(0, maxAmmo + 1))
                        end
                    end
                end
            end
        end

        local selectedItems = {}
        local itemsAdded = 0
        local safetyCounter = 0
        while itemsAdded < 5 and itemsAdded < #potentialloot and safetyCounter < 100 do
            safetyCounter = safetyCounter + 1
            -- ZombRand upper bound is exclusive; +1 so the last list entry is reachable
            local randomIndex = ZombRand(1, #potentialloot + 1)
            local selectedItem = potentialloot[randomIndex]
            if not selectedItems[selectedItem] then
                selectedItems[selectedItem] = true
                if backpackinv then
                    backpackinv:AddItem(selectedItem)
                else
                    inv:AddItem(selectedItem)
                end
                itemsAdded = itemsAdded + 1
            end
        end
    end
end

Events.OnZombieDead.Add(LBagLoot)