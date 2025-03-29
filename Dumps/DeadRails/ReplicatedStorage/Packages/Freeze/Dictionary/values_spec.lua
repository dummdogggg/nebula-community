--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.values.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:20
-- Luau version 6, Types version 3
-- Time taken: 0.000464 seconds

local values_upvr = require(script.Parent.values)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: values_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
	}
	it("values", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: values_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(values_upvr(tbl_upvr)).toEqual({1})
	end)
end