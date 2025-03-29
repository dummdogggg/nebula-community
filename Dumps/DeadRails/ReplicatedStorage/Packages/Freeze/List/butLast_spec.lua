--[[
    Script: ReplicatedStorage.Packages.Freeze.List.butLast.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:03
-- Luau version 6, Types version 3
-- Time taken: 0.000544 seconds

local butLast_upvr = require(script.Parent.butLast)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: butLast_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("butLast", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: butLast_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(butLast_upvr(tbl_upvr)).toEqual({'a', 'b'})
	end)
end