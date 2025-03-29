--[[
    Script: ReplicatedStorage.Packages.Freeze.List.includes.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:14
-- Luau version 6, Types version 3
-- Time taken: 0.000634 seconds

local includes_upvr = require(script.Parent.includes)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: includes_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("exists", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: includes_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(includes_upvr(tbl_upvr, 'b')).toEqual(true)
	end)
	it("doesnt exist", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: includes_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(includes_upvr(tbl_upvr, 'd')).toEqual(false)
	end)
end