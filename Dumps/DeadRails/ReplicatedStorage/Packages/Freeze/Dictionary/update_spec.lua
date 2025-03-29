--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.update.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:50
-- Luau version 6, Types version 3
-- Time taken: 0.001251 seconds

local update_upvr = require(script.Parent.update)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: update_upvr (readonly)
	]]
	local tbl_upvr = {
		a = 1;
		b = 2;
		c = 3;
	}
	it("should replace existing key", function() -- Line 6
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(update_upvr(tbl_upvr, 'a', function(arg1) -- Line 7
			assert(arg1, "should exist")
			return arg1 * 100
		end)).toEqual({
			a = 100;
			b = 2;
			c = 3;
		})
	end)
	it("should pass nil to updater for nil key", function() -- Line 15
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		local var8_upvw = false
		expect(var8_upvw).toEqual(true)
		expect(nil).toEqual(nil)
		expect(update_upvr(tbl_upvr, 'd', function(arg1) -- Line 17
			--[[ Upvalues[1]:
				[1]: var8_upvw (read and write)
			]]
			var8_upvw = true
			return 4
		end)).toEqual({
			a = 1;
			b = 2;
			c = 3;
			d = 4;
		})
	end)
	it("should pass notSetValue to updater for nil key", function() -- Line 27
		--[[ Upvalues[2]:
			[1]: update_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		expect(update_upvr(tbl_upvr, 'd', function(arg1) -- Line 28
			assert(arg1, "exists")
			return arg1 * 100
		end, 4)).toEqual({
			a = 1;
			b = 2;
			c = 3;
			d = 400;
		})
	end)
end