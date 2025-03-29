--[[
    Script: ReplicatedStorage.Shared.DataBanks.WeaponConstants
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:22
-- Luau version 6, Types version 3
-- Time taken: 0.000772 seconds

return table.freeze({
	WEAPON_TAG = "Weapon";
	WEAPON_CONFIURATION_FOLDER = "WeaponConfiguration";
	WEAPON_STATE_FOLDER = "WeaponState";
	WEAPON_TYPE = {
		MELEE = "Melee";
		GUN = "Gun";
	};
	BULLET_TYPE = {
		LIGHT = "Light";
		MEDIUM = "Medium";
		HEAVY = "Heavy";
		SHOT = "Shot";
		LIGHTNING = "Lightning";
	};
	STATE_VALUES = {
		GUN_VALUES = {
			CURRENT_AMMO = "CurrentAmmo";
			LAST_FIRE_TIME = "LastFireTime";
			IS_RELOADING = "IsReloading";
		};
		MELEE_VALUES = {};
	};
	CONFIGURATION_VALUES = {
		WEAPON_TYPE = "WeaponType";
		GUN_VALUES = {
			WEAPON_TYPE = "WeaponType";
			BULLET_TYPE = "BulletType";
			BULLET_DAMAGE = "BulletDamage";
			MAGAZINE_SIZE = "MagazineSize";
			RELOAD_DURATION = "ReloadDuration";
			FIRE_DELAY = "FireDelay";
			HEADSHOT_MULTIPLIER = "HeadshotMultiplier";
			LIMB_MULTIPLIER = "LimbMultiplier";
		};
		MELEE_VALUES = {
			WEAPON_TYPE = "WeaponType";
		};
	};
	BULLET_RANGE = 500;
	RAY_RADIUS = 0.4;
})