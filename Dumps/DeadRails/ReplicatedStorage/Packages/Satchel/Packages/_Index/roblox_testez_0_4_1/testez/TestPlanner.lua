--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.TestPlanner
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:49
-- Luau version 6, Types version 3
-- Time taken: 0.000825 seconds

local module = {}
local TestPlan_upvr = require(script.Parent.TestPlan)
function module.createPlan(arg1, arg2, arg3) -- Line 26
	--[[ Upvalues[1]:
		[1]: TestPlan_upvr (readonly)
	]]
	local any_new_result1 = TestPlan_upvr.new(arg2, arg3)
	table.sort(arg1, function(arg1_2, arg2_2) -- Line 29
		local var9
		if arg1_2.pathStringForSorting >= arg2_2.pathStringForSorting then
			var9 = false
		else
			var9 = true
		end
		return var9
	end)
	for _, v in ipairs(arg1) do
		any_new_result1:addRoot(v.path, v.method)
	end
	return any_new_result1
end
return module