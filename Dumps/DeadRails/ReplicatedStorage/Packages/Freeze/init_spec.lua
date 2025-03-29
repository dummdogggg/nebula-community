--[[
    Script: ReplicatedStorage.Packages.Freeze.init.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:10
-- Luau version 6, Types version 3
-- Time taken: 0.002147 seconds

local function toString_upvr(arg1) -- Line 3, Named "toString"
	--[[ Upvalues[1]:
		[1]: toString_upvr (readonly)
	]]
	if type(arg1) == "table" then
		local module = {}
		for i, v in pairs(arg1) do
			local var9
			if type(i) == "number" then
				var9 = toString_upvr(v)
			else
				var9 = toString_upvr(i)..'='..toString_upvr(v)
			end
			table.insert(module, var9)
		end
		return '{'..table.concat(module, ", ")..'}'
	end
	return tostring(arg1)
end
local equalsDeep_upvr = require(script.Parent.utils.equalsDeep)
return function() -- Line 16
	--[[ Upvalues[2]:
		[1]: equalsDeep_upvr (readonly)
		[2]: toString_upvr (readonly)
	]]
	beforeAll(function() -- Line 17
		--[[ Upvalues[2]:
			[1]: equalsDeep_upvr (copied, readonly)
			[2]: toString_upvr (copied, readonly)
		]]
		expect.extend({
			toEqual = function(arg1, arg2) -- Line 19, Named "toEqual"
				--[[ Upvalues[2]:
					[1]: equalsDeep_upvr (copied, readonly)
					[2]: toString_upvr (copied, readonly)
				]]
				if arg1 == arg2 then
					return {
						pass = true;
						message = "Expected to not equal";
					}
				end
				if equalsDeep_upvr(arg1, arg2) then
					return {
						pass = true;
						message = "Expected to not equal";
					}
				end
				return {
					pass = false;
					message = string.format("Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n", toString_upvr(arg1), toString_upvr(arg2));
				}
			end;
			toBe = function(arg1, arg2) -- Line 44, Named "toBe"
				--[[ Upvalues[1]:
					[1]: toString_upvr (copied, readonly)
				]]
				local module_2 = {}
				local var18
				if arg1 ~= arg2 then
					var18 = false
				else
					var18 = true
				end
				module_2.pass = var18
				var18 = string.format("Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n", toString_upvr(arg1), toString_upvr(arg2))
				module_2.message = var18
				return module_2
			end;
		})
	end)
end