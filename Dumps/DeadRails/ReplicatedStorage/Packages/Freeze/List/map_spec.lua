--[[
    Script: ReplicatedStorage.Packages.Freeze.List.map.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:53
-- Luau version 6, Types version 3
-- Time taken: 0.001006 seconds

local map_upvr = require(script.Parent.map)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: map_upvr (readonly)
	]]
	local tbl_upvr = {'a', 'b', 'c'}
	it("map", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, string.upper)).toEqual({'A', 'B', 'C'})
	end)
	it("map, filter", function() -- Line 11
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, function(arg1) -- Line 12
			if arg1 == 'c' then
				return nil
			end
			return string.upper(arg1)
		end)).toEqual({'A', 'B'})
	end)
	it("map, change type", function() -- Line 19
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, function(arg1) -- Line 20
			return 1
		end)).toEqual({1, 1, 1})
	end)
end