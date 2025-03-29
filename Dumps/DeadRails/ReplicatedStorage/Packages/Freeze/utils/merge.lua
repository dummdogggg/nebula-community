--[[
    Script: ReplicatedStorage.Packages.Freeze.utils.merge
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:37
-- Luau version 6, Types version 3
-- Time taken: 0.000872 seconds

local None_upvr = require(script.Parent.Parent.None)
return function(...) -- Line 4
	--[[ Upvalues[1]:
		[1]: None_upvr (readonly)
	]]
	for i = 1, select('#', ...) do
		local var9 = ...
		local selected = select(i, var9)
		if selected ~= nil then
			if type(selected) ~= "table" then
				var9 = false
			else
				var9 = true
			end
			assert(var9, "Expected table")
			var9 = nil
			for i_2, v in selected, var9 do
				if v == None_upvr then
					({})[i_2] = nil
				else
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					;({})[i_2] = v
				end
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end