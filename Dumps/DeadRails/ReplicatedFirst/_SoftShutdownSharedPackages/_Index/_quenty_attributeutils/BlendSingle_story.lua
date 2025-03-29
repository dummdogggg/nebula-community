--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.BlendSingle.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:27
-- Luau version 6, Types version 3
-- Time taken: 0.001203 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("Blend")
local any_load_result1_result1_upvr = any_load_result1("Observable")
return function(arg1) -- Line 11
	--[[ Upvalues[3]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr (readonly)
	]]
	local any_new_result1_upvr = var1_result1_upvr_2.new()
	local any_State_result1 = var1_result1_upvr.State('a')
	any_new_result1_upvr:GiveTask(var1_result1_upvr.Single(var1_result1_upvr.Dynamic(any_State_result1, function(arg1_2) -- Line 16
		--[[ Upvalues[4]:
			[1]: var1_result1_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: any_load_result1_result1_upvr (copied, readonly)
			[4]: var1_result1_upvr_2 (copied, readonly)
		]]
		local module = {}
		module.Parent = arg1
		module.Text = arg1_2
		module.Size = UDim2.new(1, 0, 1, 0)
		module.BackgroundTransparency = 0.5
		module[function() -- Line 22
			--[[ Upvalues[3]:
				[1]: any_load_result1_result1_upvr (copied, readonly)
				[2]: var1_result1_upvr_2 (copied, readonly)
				[3]: arg1_2 (readonly)
			]]
			return any_load_result1_result1_upvr.new(function() -- Line 23
				--[[ Upvalues[2]:
					[1]: var1_result1_upvr_2 (copied, readonly)
					[2]: arg1_2 (copied, readonly)
				]]
				local any_new_result1 = var1_result1_upvr_2.new()
				print("Made for", arg1_2)
				any_new_result1:GiveTask(function() -- Line 27
					--[[ Upvalues[1]:
						[1]: arg1_2 (copied, readonly)
					]]
					print("Cleaning up", arg1_2)
				end)
				return any_new_result1
			end)
		end] = true
		return var1_result1_upvr.New("TextLabel")(module)
	end)):Subscribe())
	any_State_result1.Value = 'b'
	return function() -- Line 42
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:DoCleaning()
	end
end