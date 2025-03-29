--[[
    Script: ReplicatedStorage.Shared.Utils.isAnyGunReloading
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:03
-- Luau version 6, Types version 3
-- Time taken: 0.001630 seconds

local var1_upvr
if game:GetService("RunService"):IsServer() then
	var1_upvr = "ServerWeaponState"
else
	var1_upvr = "ClientWeaponState"
end
local CollectionService_upvr = game:GetService("CollectionService")
return function(arg1) -- Line 6, Named "isAnyGunReloading"
	--[[ Upvalues[2]:
		[1]: CollectionService_upvr (readonly)
		[2]: var1_upvr (readonly)
	]]
	if not arg1 or typeof(arg1) ~= "Instance" or not arg1:IsA("Player") then
		return false
	end
	local tbl_2 = {}
	if arg1.Character then
		table.insert(tbl_2, arg1.Character)
	end
	if arg1.Backpack then
		table.insert(tbl_2, arg1.Backpack)
	end
	for _, v in tbl_2 do
		for _, v_2 in v:GetChildren(), nil do
			if v_2:IsA("Tool") and CollectionService_upvr:HasTag(v_2, "Gun") then
				local SOME_2 = v_2:FindFirstChild(var1_upvr)
				if SOME_2 then
					local IsReloading = SOME_2:FindFirstChild("IsReloading")
					if IsReloading and IsReloading.Value then
						return true
					end
				end
			end
		end
	end
	return false
end