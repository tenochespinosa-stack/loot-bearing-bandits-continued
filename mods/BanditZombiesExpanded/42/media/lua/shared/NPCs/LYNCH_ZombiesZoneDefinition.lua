local ok, _ = pcall(function() require 'NPCs/ZombiesZoneDefinition' end)
if not ok then return end

function CallSandboxVars()
    if not SandboxVars.LYNCH or not SandboxVars.LYNCH.BanditSpawnChance then return end
    local banditSpawnChance = SandboxVars.LYNCH.BanditSpawnChance
    for _, entry in ipairs(ZombiesZoneDefinition.Default) do
        if entry.name == "L_BanditENH" then return end
    end
    table.insert(ZombiesZoneDefinition.Default,{name = "L_BanditENH", chance = banditSpawnChance})
end

if isServer() then
    Events.OnServerStarted.Add(CallSandboxVars)
else
    Events.OnPostDistributionMerge.Add(CallSandboxVars);
end
