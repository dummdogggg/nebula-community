--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeValue.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:59
-- Luau version 6, Types version 3
-- Time taken: 0.000844 seconds

local removeValue_upvr = require(script.Parent.removeValue)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: removeValue_upvr (readonly)
	]]
	it("removeValue 1", function() -- Line 5
		--[[ Upvalues[1]:
			[1]: removeValue_upvr (copied, readonly)
		]]
		expect(removeValue_upvr({
			a = 1;
			b = 2;
			c = 3;
		}, 1)).toEqual({
			b = 2;
			c = 3;
		})
	end)
	it("removeValue 2", function() -- Line 10
		--[[ Upvalues[1]:
			[1]: removeValue_upvr (copied, readonly)
		]]
		expect(removeValue_upvr({
			a = 1;
			b = 1;
			c = 3;
		}, 1)).toEqual({
			c = 3;
		})
	end)
	it("removeValue 0, same id", function() -- Line 15
		--[[ Upvalues[1]:
			[1]: removeValue_upvr (copied, readonly)
		]]
		local tbl = {
			a = 1;
			b = 2;
			c = 3;
		}
		expect(removeValue_upvr(tbl, 0)).toBe(tbl)
	end)
end