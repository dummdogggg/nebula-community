--[[
    Script: ReplicatedStorage.Packages.Freeze.List.first.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:13
-- Luau version 6, Types version 3
-- Time taken: 0.000644 seconds

local first_upvr = require(script.Parent.first)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: first_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("first", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: first_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(first_upvr(tbl_upvr)).toEqual('a')
	end)
	it("default", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: first_upvr (copied, readonly)
		]]
		expect(first_upvr({}, "default")).toEqual("default")
	end)
end