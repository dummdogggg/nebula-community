--[[
    Script: ReplicatedStorage.Packages.Freeze.Freeze.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:03
-- Luau version 6, Types version 3
-- Time taken: 0.001235 seconds

local Parent_upvr = require(script.Parent)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: Parent_upvr (readonly)
	]]
	it("handle multiple operations", function() -- Line 5
		--[[ Upvalues[1]:
			[1]: Parent_upvr (copied, readonly)
		]]
		expect(Parent_upvr.List.map(Parent_upvr.List.push({'a', 'b'}, 'c'), function(arg1) -- Line 8
			return string.upper(arg1)
		end)).toEqual({'A', 'B', 'C'})
	end)
	it("deprecation warning", function() -- Line 14
		--[[ Upvalues[1]:
			[1]: Parent_upvr (copied, readonly)
		]]
		expect(Parent_upvr.Dictionary.removeKeys({
			a = 1;
			b = 2;
			c = 3;
		}, 'b', 'c')).toEqual({
			a = 1;
		})
		expect(Parent_upvr.List.append({'a', 'b', 'c'}, 'b', 'c')).toEqual({'a', 'b', 'c', 'b', 'c'})
	end)
end