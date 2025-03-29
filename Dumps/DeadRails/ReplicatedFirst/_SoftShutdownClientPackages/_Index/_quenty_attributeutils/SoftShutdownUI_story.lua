--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.SoftShutdownUI.story
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:32
-- Luau version 6, Types version 3
-- Time taken: 0.000928 seconds

local any_load_result1 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)
local var1_result1_upvr_2 = any_load_result1("Maid")
local var1_result1_upvr = any_load_result1("ServiceBag")
local any_load_result1_result1_upvr = any_load_result1("SoftShutdownTranslator")
local var1_result1_upvr_3 = any_load_result1("SoftShutdownUI")
return function(arg1) -- Line 12
	--[[ Upvalues[4]:
		[1]: var1_result1_upvr_2 (readonly)
		[2]: var1_result1_upvr (readonly)
		[3]: any_load_result1_result1_upvr (readonly)
		[4]: var1_result1_upvr_3 (readonly)
	]]
	local any_new_result1_2_upvr = var1_result1_upvr_2.new()
	local any_new_result1 = var1_result1_upvr.new()
	any_new_result1_2_upvr:GiveTask(any_new_result1)
	local service = any_new_result1:GetService(any_load_result1_result1_upvr)
	local any_new_result1_3_upvr = var1_result1_upvr_3.new()
	any_new_result1_2_upvr:GiveTask(any_new_result1_3_upvr)
	any_new_result1_2_upvr:GivePromise(service:PromiseFormatByKey("shutdown.lobby.title")):Then(function(arg1_2) -- Line 22
		--[[ Upvalues[1]:
			[1]: any_new_result1_3_upvr (readonly)
		]]
		any_new_result1_3_upvr:SetTitle(arg1_2)
	end)
	any_new_result1_2_upvr:GivePromise(service:PromiseFormatByKey("shutdown.lobby.subtitle")):Then(function(arg1_3) -- Line 26
		--[[ Upvalues[1]:
			[1]: any_new_result1_3_upvr (readonly)
		]]
		any_new_result1_3_upvr:SetSubtitle(arg1_3)
	end)
	any_new_result1_3_upvr:Show()
	any_new_result1_3_upvr.Gui.Parent = arg1
	return function() -- Line 34
		--[[ Upvalues[1]:
			[1]: any_new_result1_2_upvr (readonly)
		]]
		any_new_result1_2_upvr:DoCleaning()
	end
end