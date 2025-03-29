--[[
    Script: ReplicatedStorage.Packages.Freeze.List.zip.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:28
-- Luau version 6, Types version 3
-- Time taken: 0.000954 seconds

local zip_upvr = require(script.Parent.zip)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: zip_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("matching lengths", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: zip_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(zip_upvr(tbl_upvr, {'x', 'y', 'z'})).toEqual({{'a', 'x'}, {'b', 'y'}, {'c', 'z'}})
	end)
	it("mismatching lengths", function() -- Line 12
		--[[ Upvalues[2]:
			[1]: zip_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(zip_upvr(tbl_upvr, {'x', 'y', 'z', 'W'})).toEqual({{'a', 'x'}, {'b', 'y'}, {'c', 'z'}})
	end)
end