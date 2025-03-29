--[[
    Script: ReplicatedStorage.Shared.DataBanks.WeaponConstants
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {
    WEAPON_TAG = "Weapon", 
    WEAPON_CONFIURATION_FOLDER = "WeaponConfiguration", 
    WEAPON_STATE_FOLDER = "WeaponState", 
    WEAPON_TYPE = {
        MELEE = "Melee", 
        GUN = "Gun"
    }, 
    BULLET_TYPE = {
        LIGHT = "Light", 
        MEDIUM = "Medium", 
        HEAVY = "Heavy", 
        SHOT = "Shot", 
        LIGHTNING = "Lightning"
    }, 
    STATE_VALUES = {
        GUN_VALUES = {
            CURRENT_AMMO = "CurrentAmmo", 
            LAST_FIRE_TIME = "LastFireTime", 
            IS_RELOADING = "IsReloading"
        }, 
        MELEE_VALUES = {}
    }, 
    CONFIGURATION_VALUES = {
        WEAPON_TYPE = "WeaponType", 
        GUN_VALUES = {
            WEAPON_TYPE = "WeaponType", 
            BULLET_TYPE = "BulletType", 
            BULLET_DAMAGE = "BulletDamage", 
            MAGAZINE_SIZE = "MagazineSize", 
            RELOAD_DURATION = "ReloadDuration", 
            FIRE_DELAY = "FireDelay", 
            HEADSHOT_MULTIPLIER = "HeadshotMultiplier", 
            LIMB_MULTIPLIER = "LimbMultiplier"
        }, 
        MELEE_VALUES = {
            WEAPON_TYPE = "WeaponType"
        }
    }, 
    BULLET_RANGE = 500, 
    RAY_RADIUS = 0.4
};
return table.freeze(v0);