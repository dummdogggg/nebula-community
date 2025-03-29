--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.RevivePromptHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:47
-- Luau version 6, Types version 3
-- Time taken: 0.001417 seconds

local CollectionService_upvr = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayerObjectsContainer = require(ReplicatedStorage.Client.LocalPlayerObjectsContainer)
local ClassEnums_upvr = require(ReplicatedStorage.Shared.DataBanks.ClassEnums)
require(ReplicatedStorage.Client.Controllers.PlayerDataController).waitForDataLoadAsync()
LocalPlayerObjectsContainer.waitForRegisteredAsync()
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local any_getPlayerClassData_result1_upvr = LocalPlayerObjectsContainer.getPlayerClassData()
local function toggleAllPrompts_upvr(arg1) -- Line 24, Named "toggleAllPrompts"
	--[[ Upvalues[2]:
		[1]: CollectionService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	for _, v in CollectionService_upvr:GetTagged("RevivePrompt"), nil do
		if not v:IsDescendantOf(LocalPlayer_upvr.Character) then
			v.Enabled = arg1
		end
	end
end
local function onLocalCharacterAdded(arg1) -- Line 34
	--[[ Upvalues[3]:
		[1]: toggleAllPrompts_upvr (readonly)
		[2]: any_getPlayerClassData_result1_upvr (readonly)
		[3]: ClassEnums_upvr (readonly)
	]]
	arg1.ChildAdded:Connect(function(arg1_2) -- Line 35
		--[[ Upvalues[1]:
			[1]: toggleAllPrompts_upvr (copied, readonly)
		]]
		if arg1_2:IsA("Tool") and arg1_2.Name == "Bandage" then
			toggleAllPrompts_upvr(true)
		end
	end)
	arg1.ChildRemoved:Connect(function(arg1_3) -- Line 41
		--[[ Upvalues[3]:
			[1]: any_getPlayerClassData_result1_upvr (copied, readonly)
			[2]: ClassEnums_upvr (copied, readonly)
			[3]: toggleAllPrompts_upvr (copied, readonly)
		]]
		if not any_getPlayerClassData_result1_upvr:hasTag(ClassEnums_upvr.Tag.CanReviveWithoutBandage) and (not arg1_3 or arg1_3.Name == "Bandage") then
			toggleAllPrompts_upvr(false)
		end
	end)
end
if LocalPlayer_upvr.Character then
	onLocalCharacterAdded(LocalPlayer_upvr.Character)
end
LocalPlayerObjectsContainer.getCharacterLoadedWrapper().loaded:Connect(onLocalCharacterAdded)
CollectionService_upvr:GetInstanceAddedSignal("RevivePrompt"):Connect(function(arg1) -- Line 48, Named "onRevivePromptAdded"
	--[[ Upvalues[3]:
		[1]: any_getPlayerClassData_result1_upvr (readonly)
		[2]: ClassEnums_upvr (readonly)
		[3]: toggleAllPrompts_upvr (readonly)
	]]
	if any_getPlayerClassData_result1_upvr:hasTag(ClassEnums_upvr.Tag.CanReviveWithoutBandage) then
		toggleAllPrompts_upvr(true)
	end
end)