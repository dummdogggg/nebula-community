--[[
    Script: ReplicatedStorage.Packages.Freeze.List.rest.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:20
-- Luau version 6, Types version 3
-- Time taken: 0.000518 seconds

local rest_upvr = require(script.Parent.rest)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: rest_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("rest", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: rest_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(rest_upvr(tbl_upvr)).toEqual({'b', 'c'})
	end)
end