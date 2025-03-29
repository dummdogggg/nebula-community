--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.AmmoGuiHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:45
-- Luau version 6, Types version 3
-- Time taken: 0.001454 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local WeaponController = require(game.ReplicatedStorage.Client.Controllers.WeaponController)
local var3_upvw
local var4_upvw
local var6_upvw
WeaponController.OnWeaponEquipped:Connect(function(arg1) -- Line 10
	--[[ Upvalues[4]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var3_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: var4_upvw (read and write)
	]]
	local Character_upvr = LocalPlayer_upvr.Character
	if not Character_upvr then
	else
		if arg1.WeaponConfiguration.WeaponType.Value ~= "Gun" then return end
		if not var3_upvw then
			var3_upvw = Character_upvr.AttributeChanged:Connect(function(arg1_2) -- Line 21
				--[[ Upvalues[4]:
					[1]: var6_upvw (copied, read and write)
					[2]: arg1 (readonly)
					[3]: LocalPlayer_upvr (copied, readonly)
					[4]: Character_upvr (readonly)
				]]
				if var6_upvw.."Ammo" == arg1_2 then
					var6_upvw = arg1.WeaponConfiguration.BulletType.Value
					LocalPlayer_upvr.PlayerGui.GunGui.Ammo.Text = arg1.ClientWeaponState.CurrentAmmo.Value..'/'..Character_upvr:GetAttribute(var6_upvw.."Ammo")
				end
			end)
		end
		if not var4_upvw then
			var4_upvw = arg1.ClientWeaponState.CurrentAmmo.Changed:Connect(function() -- Line 30
				--[[ Upvalues[4]:
					[1]: var6_upvw (copied, read and write)
					[2]: arg1 (readonly)
					[3]: LocalPlayer_upvr (copied, readonly)
					[4]: Character_upvr (readonly)
				]]
				var6_upvw = arg1.WeaponConfiguration.BulletType.Value
				LocalPlayer_upvr.PlayerGui.GunGui.Ammo.Text = arg1.ClientWeaponState.CurrentAmmo.Value..'/'..Character_upvr:GetAttribute(var6_upvw.."Ammo")
			end)
		end
		var6_upvw = arg1.WeaponConfiguration.BulletType.Value
		LocalPlayer_upvr.PlayerGui.GunGui.Ammo.Text = arg1.ClientWeaponState.CurrentAmmo.Value..'/'..Character_upvr:GetAttribute(var6_upvw.."Ammo")
		LocalPlayer_upvr.PlayerGui.GunGui.Ammo.Visible = true
	end
end)
WeaponController.OnWeaponUnequipped:Connect(function(arg1) -- Line 45
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
	]]
	if var4_upvw then
		var4_upvw:Disconnect()
	end
	if var3_upvw then
		var3_upvw:Disconnect()
	end
	var4_upvw = nil
	var3_upvw = nil
	LocalPlayer_upvr.PlayerGui.GunGui.Ammo.Visible = false
end)