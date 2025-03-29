--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.map.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:09
-- Luau version 6, Types version 3
-- Time taken: 0.001475 seconds

local map_upvr = require(script.Parent.map)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: map_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("map", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, function(arg1, arg2) -- Line 7
			return arg1 * 10, arg2
		end)).toEqual({
			a = 10;
			b = 20;
			c = 30;
		})
	end)
	it("change type", function() -- Line 13
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, function(arg1, arg2) -- Line 14
			return tostring(arg1), arg2
		end)).toEqual({
			a = '1';
			b = '2';
			c = '3';
		})
	end)
	it("filters with nil", function() -- Line 20
		--[[ Upvalues[2]:
			[1]: map_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(map_upvr(tbl_upvr, function(arg1, arg2) -- Line 21
			if arg1 == 2 then
			else
			end
			return arg1, arg2
		end)).toEqual({
			a = 1;
			c = 3;
		})
	end)
	it("convert list to dictionary", function() -- Line 27
		--[[ Upvalues[1]:
			[1]: map_upvr (copied, readonly)
		]]
		expect(map_upvr({'a', 'b', 'c'}, function(arg1) -- Line 29
			return 0, 'a'
		end)).toEqual({
			a = 0;
		})
	end)
end