--[[
    Script: ReplicatedStorage.Packages.Freeze.List.pop.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:42
-- Luau version 6, Types version 3
-- Time taken: 0.001063 seconds

local pop_upvr = require(script.Parent.pop)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: pop_upvr (readonly)
	]]
	local tbl_upvr = {10, 20, 30}
	it("pop, default", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: pop_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(pop_upvr(tbl_upvr)).toEqual({10, 20})
	end)
	it("pop, 2", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: pop_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(pop_upvr(tbl_upvr, 2)).toEqual({10})
	end)
	it("pop, empty", function() -- Line 16
		--[[ Upvalues[1]:
			[1]: pop_upvr (copied, readonly)
		]]
		expect(pop_upvr({})).toEqual({})
	end)
end