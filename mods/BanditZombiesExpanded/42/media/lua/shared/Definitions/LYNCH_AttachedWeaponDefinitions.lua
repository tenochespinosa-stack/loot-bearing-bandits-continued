AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};



	AttachedWeaponDefinitions.lmelee = {
		id = "lmelee",
		chance = 15,
		outfit = {"L_BanditENH"},
		weaponLocation = {"Shovel Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
			"Base.SpearCrafted",
			"Base.WoodAxe",
			"Base.Axe",
			"Base.Crowbar",
			"Base.Machete",
			"Base.BaseballBat_RailSpike",
			"Base.BaseballBat",
			"Base.BaseballBat_Spiked",
			"Base.BaseballBat_Metal",
			"Base.Mace",
			"Base.SpearHuntingKnife",
			"Base.PickAxe",
		},
	}

	AttachedWeaponDefinitions.ltool = {
		id = "ltool",
		chance = 12,
		outfit = {"L_BanditENH"},
		weaponLocation = {"Belt Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
			"Base.HandAxe",
			"Base.WalkieTalkie3",
			"Base.WalkieTalkie4",
			"Base.WalkieTalkie5",
			"Base.BallPeenHammer",
			"Base.ClubHammer",
			"Base.Hammer",
			"Base.Nightstick",
			"Base.EntrenchingTool",
			"Base.CanteenMilitary",
			"Base.Canteen",
		},
	}

	AttachedWeaponDefinitions.lblade = {
		id = "lblade",
		chance = 12,
		outfit = {"L_BanditENH"},
		weaponLocation = {"Belt Left Upside"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
			"Base.HuntingKnife",
			"Base.KitchenKnife",
			"Base.M16Bayonet",
			"Base.MeatCleaver",
			"Base.CrudeSword",
			"Base.FightingKnife",
		},
	}

	AttachedWeaponDefinitions.lcommongun1 = {
		id = "lcommongun1",
		chance = 16,
		outfit = {"L_BanditENH"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
			"Base.DoubleBarrelShotgun",
			"Base.DoubleBarrelShotgunSawnoff",
			"Base.Shotgun",
			"Base.ShotgunSawnoff",
			"Base.VarmintRifle",
			"Base.HuntingRifle",
		},
	}

	AttachedWeaponDefinitions.lcommongun2 = {
		id = "lcommongun2",
		chance = 9,
		outfit = {"L_BanditENH"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
			"Base.AssaultRifle2",
			"Base.AssaultRifle",
		},
	}

	AttachedWeaponDefinitions.lhandgun = {
		id = "lhandgun",
		chance = 13,
		outfit = {"L_BanditENH"},
		weaponLocation =  {"Holster Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		ensureItem = "Base.HolsterSimple",
		weapons = {
			"Base.Pistol",
			"Base.Pistol2",
			"Base.Pistol3",
			"Base.Revolver_Short",
			"Base.Revolver",
			"Base.Revolver_Long",
		},
	}
	
	

local function SpawnWeaponsOnZomboid()
        AttachedWeaponDefinitions.attachedWeaponCustomOutfit = AttachedWeaponDefinitions.attachedWeaponCustomOutfit or {}
        AttachedWeaponDefinitions.attachedWeaponCustomOutfit.L_BanditENH = {
            chance = 100,
            maxitem = 3,
            weapons = {
                AttachedWeaponDefinitions.lmelee,
                AttachedWeaponDefinitions.ltool,
                AttachedWeaponDefinitions.lblade,
                AttachedWeaponDefinitions.lcommongun1,
                AttachedWeaponDefinitions.lcommongun2,
                AttachedWeaponDefinitions.lhandgun,
            },
			}
			    
end


Events.OnInitGlobalModData.Add(SpawnWeaponsOnZomboid)