--[[
    Script: ReplicatedStorage.Packages.Freeze.List.last.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:05
-- Luau version 6, Types version 3
-- Time taken: 0.000636 seconds

local last_upvr = require(script.Parent.last)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: last_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("last", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: last_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(last_upvr(tbl_upvr)).toEqual('c')
	end)
	it("default", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: last_upvr (copied, readonly)
		]]
		expect(last_upvr({}, "default")).toEqual("default")
	end)
end