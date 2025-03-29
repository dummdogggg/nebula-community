--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:57
-- Luau version 6, Types version 3
-- Time taken: 0.001258 seconds

local module_upvr = require(script.Parent:FindFirstChild("removeIn"))
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local tbl_upvr = {
		a = {
			b = {'c'};
		};
	}
	it("removeIn 1", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, {'a'})).toEqual({})
	end)
	it("removeIn 2", function() -- Line 10
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, {'a', 'b'})).toEqual({
			a = {};
		})
	end)
	it("removeIn 3", function() -- Line 14
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, {'a', 'b', 'c'})).toEqual({
			a = {
				b = {'c'};
			};
		})
	end)
	it("removeIn 4", function() -- Line 18
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(module_upvr(tbl_upvr, {'x', 'y', 'z'})).toEqual({
			a = {
				b = {'c'};
			};
			x = {
				y = {};
			};
		})
	end)
end