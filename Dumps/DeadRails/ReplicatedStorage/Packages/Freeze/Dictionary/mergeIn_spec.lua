--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.mergeIn.spec
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:27
-- Luau version 6, Types version 3
-- Time taken: 0.000702 seconds

local mergeIn_upvr = require(script.Parent.mergeIn)
return function() -- Line 4
	--[[ Upvalues[1]:
		[1]: mergeIn_upvr (readonly)
	]]
	it("mergeIn", function() -- Line 5
		--[[ Upvalues[1]:
			[1]: mergeIn_upvr (copied, readonly)
		]]
		expect(mergeIn_upvr({
			persons = {
				alice = {
					age = 10;
				};
			};
		}, {"persons", "alice"}, {
			age = 11;
		})).toEqual({
			persons = {
				alice = {
					age = 11;
				};
			};
		})
	end)
end